#!/bin/bash

# Arg 1: Virtual Machine Password configured in the ARM template (https://github.com/Jalmeida1994/GatherChain-ARM-Template)

source .weburl.env

pass=${1}

initNet () {
    if curl --fail -X POST -H "Content-Type: application/json" -d "{\"Author\":\"${pass}\",\"Group\":\"0000\",\"Commit\":\"0000\"}" ${WEB_URL}/init; then
        printf "Network launched!"
    else
        printf "Error launching the network."
    fi;
}

initNet