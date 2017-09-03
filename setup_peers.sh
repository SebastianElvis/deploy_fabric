#!/bin/bash

cd `dirname ${BASH_SOURCE-$0}`
. env_peer.sh

for host in `cat hosts`; do
    echo 'SSH to '$client' to start the Hyperledger peer'
    ssh -i ~/.ssh/mykey $USER_NAME@$host bash $DEPLOY_FABRIC_DIR/start_peer.sh
done
