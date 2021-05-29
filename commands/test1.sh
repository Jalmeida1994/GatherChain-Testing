#!/bin/bash

source .weburl.env

users=(101 202 303)
group1="101-202-303"

# Generates Random Hash pretending to be a git commit hash
randomHash() {
    hash=$(openssl rand -base64 6)
    printf ${hash}
}

# Registers Student Number in the System
registerNumber () {

    if curl --fail -X POST -H "Content-Type: application/json" -d "{\"Author\":\"${1}\",\"GitHub\":\"userName\",\"Group\":\"userName\",\"GroupName\":\"${2}\"}" ${WEB_URL}/registernumber ; then
        echo "Student ${1} registered"
    else
        echo "Student ${1} not registered"
    fi;
}

# Creates the group in the System
createGroup ()  {
    hash=$(randomHash)

    if curl --fail -X POST -H "Content-Type: application/json" -d "{\"Author\":\"${1}\",\"Group\":\"${2}\",\"Commit\":\"${hash}\"}" ${WEB_URL}/creategroup ; then
        echo "Created group: ${2}!"
    else
        echo "Error creating the group: ${2}!"
    fi;

    members=$(echo ${2} | tr "-" "\n")

    for i in ${members[@]} ; do
        registerNumber ${i} ${2}
    done 
}

pushCommit () {
    hash=$(randomHash)

    if curl --fail -X POST -H "Content-Type: application/json" -d "{\"Author\":\"${1}\",\"Group\":\"${2}\",\"Commit\":\"${hash}\"}" ${WEB_URL}/push ; then
        echo "Pushed commit ${hash}!"
    else
        echo "Error pushing commit: ${hash}!"
    fi;
}

getHistory () {
    curl --fail -X POST -H "Content-Type: application/json" -d "{\"Author\":\"0000\",\"Group\":\"${1}\",\"Commit\":\"0000\"}" ${WEB_URL}/history
}

registerNumber ${users[0]} 0
registerNumber ${users[1]} 0
registerNumber ${users[2]} 0

startGrp=$(date +%s)
createGroup ${users[0]} ${group1}
endGrp=$(date +%s)

pushCommit ${users[0]} ${group1}
pushCommit ${users[1]} ${group1}
pushCommit ${users[0]} ${group1}
startPush=$(date +%s)
pushCommit ${users[2]} ${group1}
endPush=$(date +%s)

startHistory=$(date +%s)
getHistory ${group1}
endHistory=$(date +%s)

groupCreationRuntime=$(echo "$endGrp - $startGrp" | bc)
pushRuntime=$(echo "$endPush - $startPush" | bc)
historyRuntime=$(echo "$endHistory - $startHistory" | bc)

echo "Group Creation Duration: ${groupCreationRuntime}"
echo "Push Duration: ${pushRuntime}"
echo "Get History Duration: ${historyRuntime}"
