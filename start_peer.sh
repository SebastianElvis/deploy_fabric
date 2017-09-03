#!/bin/bash

cd `dirname ${BASH_SOURCE-$0}`
. env_peer.sh

$FABRIC_DIR/build/bin/peer node start
