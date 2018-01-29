#!/usr/bin/env bash

service ssh start

STARTUPCOMMAND="npm start prod"
echo "Running $STARTUPCOMMAND"
eval "exec $STARTUPCOMMAND"
