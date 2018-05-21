#!/bin/bash

if [ -n "$LOCUST_TARGET_HOST" ]; then
    LOCUST_TARGET_HOST="--host=$LOCUST_TARGET_HOST"
else
    echo "env \`LOCUST_TARGET_HOST\` required"
    exit 1
fi

## LOCUST_FILE
if [ -n "$LOCUST_FILE" ]; then
    LOCUST_FILE="-f $LOCUST_FILE"
else
    LOCUST_FILE="-f /opt/locustfile/locustfile.py"
fi

## is master?
if [ -n "$LOCUST_IS_MASTER" ]; then
    LOCUST_MODE="--master"
fi

## is slave?
if [ -n "$LOCUST_IS_SLAVE" ]; then
    LOCUST_MODE="--slave"
    
    if [ -n "$LOCUST_MASTER_HOST" ]; then
        LOCUST_MASTER_HOST="--master-host=$LOCUST_MASTER_HOST"
    else
        echo "If this locust is slave, env \`LOCUST_MASTER_HOST\` required"
        exit 1
    fi
else
    LOCUST_MASTER_HOST=""
fi


echo "locust $LOCUST_FILE $LOCUST_MODE $LOCUST_MASTER_HOST $LOCUST_TARGET_HOST"
locust $LOCUST_FILE $LOCUST_MODE $LOCUST_MASTER_HOST $LOCUST_TARGET_HOST
