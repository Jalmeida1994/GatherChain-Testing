#!/bin/bash

source .weburl.env

initNet () {
    if curl --fail -X POST -H "Content-Type: application/json" -d "{\"Author\":\"0000\",\"Group\":\"0000\",\"Commit\":\"0000\"}" ${WEB_URL}/init; then
        printf "Network launched!"
    else
        printf "Error launching the network."
    fi;
}

initNet