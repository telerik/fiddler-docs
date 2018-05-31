#!/bin/bash

# Expecting host name as first parameter
args=("$@")
host=${args[0]}

ok_codes="200 301 302"
count=0
err_count=0

# List of URLs to check: <from> <to>
urls="

"

#Make `for` iterate over new lines
IFS='
'

echo "Checking documentation redirects on ${host}"
for line in $urls; do
    let count=$count+1

    url=`echo ${line} | awk '{print $1}'`
    url="${host}${url}"

    target=`echo ${line} | awk '{print $2}'`
    target="${host}${target}"

    printf '.'
    result=`curl --silent --head -w 'Destination %{url_effective}' --location "${url}"`

    result_codes=`echo "${result}" | grep HTTP/1.1 | awk '{print $2}'`
    destination=`echo "${result}" | grep Destination | awk '{print $2}'`

    if [[ $destination != $target ]]; then
        echo ""
        echo "FAIL for ${url}"
        echo "Expected ${target}"
        echo "Actual   ${destination}"
        let err_count=$err_count+1
        continue
    fi

    while read code; do
        if [[ !( $ok_codes =~ $code ) ]]; then
            echo ""
            echo "FAIL for ${url} with code ${code}"
            echo ""
            echo "${result}"
            echo ""
            let err_count=$err_count+1
        fi
    done <<< "$result_codes"
done

echo ""
echo "Checked ${count} redirects with ${err_count} failures."

exit ${err_count}
