#!/bin/bash

MONGOEXPORT=`which mongoexport`

MONGO_URL="$1"
MONGO_AUTH_DB_NAME="$2"
MONGO_COLLECTION_NAME="$3"
MONGO_QUERY="$4"
MONGO_FIELDS="$5"
OUTPUT_FILE="$6"

if [ "x$1" == "x" ] || [ "x$2" == "x" ] || [ "x$3" == "x" ] || [ "x$4" == "x" ] || [ "x$5" == "x" ] || [ "x$6" == "x" ]; then
  echo "Usage:"
  echo "$0 [MONGO_URL] [MONGO_AUTH_DB_NAME] [MONGO_COLLECTION_NAME] [MONGO_QUERY] [MONGO_FIELDS] [OUTPUT_FILE]"
  exit 1;
fi

${MONGOEXPORT} --uri="${MONGO_URL}" \
            --authenticationDatabase=${MONGO_AUTH_DB_NAME} \
            --collection=${MONGO_COLLECTION_NAME} \
            --query="${MONGO_QUERY}" \
            --fields="${MONGO_FIELDS}" \
            --type=csv \
            --out=${OUTPUT_FILE} \
            --verbose
