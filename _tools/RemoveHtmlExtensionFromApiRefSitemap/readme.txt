To execute from the console:
1. navigate your console to the folder with the .csproj file
2. execute from "dotnet run"

dotnet run SitemapGenerator.csproj -- "C:\\TheCurrentWorkspace\\_site\\api\\"

The first argument is the project file name, the second is the path to the API reference folder so we can get to the sitemap.xml file inside and transform it. So, this must run after the api ref build - either before, or after combining it with the conceptual docs, but before uploading to staging/test/live.


The "--" delimits bult-in dotnet run args from custom args.
Note the double slashes, as they are required as an escaping sequence.

