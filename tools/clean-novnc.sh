#!/bin/bash

TOP_DIR=$(cd $(dirname $0) && pwd)/../

find ${TOP_DIR} -name "*.novnc*" -o -name "*.vnc*" -exec rm -rf {} \;
