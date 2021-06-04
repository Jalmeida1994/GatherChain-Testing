#!/bin/bash

source .weburl.env

users=(101 202 303 404 505 606)
group1="101-202-303"
group2="404-505-606"

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

# Pushes the random hash to the blockchain network
pushCommit () {
    hash=$(randomHash)

    if curl --fail -X POST -H "Content-Type: application/json" -d "{\"Author\":\"${1}\",\"Group\":\"${2}\",\"Commit\":\"${hash}\"}" ${WEB_URL}/push ; then
        echo "Pushed commit ${hash}!"
    else
        echo "Error pushing commit: ${hash}!"
    fi;
}

# Gets transaction history from the network
getHistory () {
    curl --fail -X POST -H "Content-Type: application/json" -d "{\"Author\":\"0000\",\"Group\":\"${1}\",\"Commit\":\"0000\"}" ${WEB_URL}/history
}

registerNumber ${users[0]} 0 &
registerNumber ${users[1]} 0 &
registerNumber ${users[2]} 0 &
registerNumber ${users[3]} 0 &
registerNumber ${users[4]} 0 &
registerNumber ${users[5]} 0 &
wait

createGroup ${users[0]} ${group1} &
createGroup ${users[3]} ${group2} &
wait

pushCommit ${users[0]} ${group1} &
pushCommit ${users[1]} ${group1} &
pushCommit ${users[3]} ${group2} &
pushCommit ${users[2]} ${group1} &
pushCommit ${users[0]} ${group1} &
pushCommit ${users[5]} ${group2} &
pushCommit ${users[4]} ${group2} &
pushCommit ${users[2]} ${group1} &
pushCommit ${users[3]} ${group2} &
pushCommit ${users[1]} ${group1} &
pushCommit ${users[0]} ${group1} &
pushCommit ${users[2]} ${group1} &
pushCommit ${users[4]} ${group2} &
pushCommit ${users[5]} ${group2} &
pushCommit ${users[3]} ${group2} &
pushCommit ${users[1]} ${group1} &
pushCommit ${users[0]} ${group1} &
pushCommit ${users[0]} ${group1} &
wait

echo "-----------History Group 1------------------"

getHistory ${group1}

echo "-----------History Group 2------------------"

getHistory ${group2}

