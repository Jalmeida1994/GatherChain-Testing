#!/bin/bash

source .weburl.env

curl -X POST -H "Content-Type: application/json" -d "{\"Author\":\"0000\",\"Group\":\"0000\",\"Commit\":\"0000\"}" ${WEB_URL}/clear 


