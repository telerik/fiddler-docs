#!/bin/bash

# Get latest documentation from github
git pull --rebase || { echo 'Getting latest documentation from github.com failed.'; exit 1; }

# Install latest Ruby gems (if any)
bundle install --without development || { echo 'Installing Ruby gems failed.'; exit 1; }

# Build the documentation
jekyll build || { echo 'Building the documentation with Jekyll failed.'; exit 1; }

# Copy the _site directory to \\telerik.com\Resources\AppDirector\Drops\Fiddler\Fiddler.Docs
robocopy _site //telerik.com/Resources/AppDirector/Drops/Fiddler/Fiddler.Docs -purge -s

VERSION="1.0.`date +%s`";

PAYLOAD="{ \"Folder\": \"//telerik.com/Resources/AppDirector/Drops/Fiddler\", \"Version\": \"$VERSION\", \"Environment\": \"Test\", \"RepositoryName\": \"Local\", \"Workspace\": \"Documentation\", \"ClientId\": \"uri:platform.cp.builds\", \"ClientSecret\": \"3edd5acdb61db37f3ab2bd735b058911\", \"SkipRegisterPackage\": false, \"OverwritePackage\": false, \"SkipDateChange\": true, \"SkipDeployment\": false, \"DeploymentApiUrl\": \"http://deploy.telerik.com/api/deployment/v1\", \"RepositoryUrl\": \"http://deploy.telerik.com/api/repository/v1\", \"TokenEndpoint\": \"https://identity.telerik.com/v2/oauth/telerik/token\", \"PackageNameFormat\": \"package-{0}-{1}.zip\" }";

echo "posting $PAYLOAD";

curl -X POST -d "$PAYLOAD" -H "Accept: application/json" -H "Content-Type: application/json" http://deploy.telerik.com/api/deployment/v1/packages

RESULT=''

while [ "$RESULT" != "success" ]
do
    if [ "$RESULT" = 'fail' ]
    then
        echo 'Deployment failed :(';
        exit 1;
    elif [ "$RESULT" = 'unknown' ]
    then
        echo 'Deployment failed :(';
        exit 1;
    else
        RESULT=$(curl -s http://deploy.telerik.com/api/deployment/v1/workspaces/Documentation/stacks/Fiddler.Docs/environments/Test/status)
        echo "Deployment in progress, current status: $RESULT"
        sleep 2
    fi
done

echo 'Deployment passed :)'

