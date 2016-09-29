#!/bin/bash
cat travis_tokens | while read line;
do
    array=(${line})
    user="${array[0]}"
    project="${array[1]}"
    token="${array[2]}"
    len=${#array[@]}
    for ((i=3; i<len; i++)); do
        branch="${array[i]}"
        body="{\"request\": {\"branch\":\"${branch}\"}}"
        echo "Triggering build of ${user}'s ${project}/${branch} with token ${token}"
        curl -s -X POST \
            -H "Content-Type: application/json" \
            -H "Accept: application/json" \
            -H "Travis-API-Version: 3" \
            -H "Authorization: token ${token}" \
            -d "${body}" \
            "https://api.travis-ci.org/repo/${user}%2F${project}/requests"
    done
done
