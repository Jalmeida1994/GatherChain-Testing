#!/bin/bash

# Arg 1: Virtual Machine Password configured in the ARM template (https://github.com/Jalmeida1994/GatherChain-ARM-Template)

source .weburl.env

curl -X POST -H "Content-Type: application/json" -d "{\"Author\":\"${1}\",\"Group\":\"0000\",\"Commit\":\"0000\"}" ${WEB_URL}/clear 


