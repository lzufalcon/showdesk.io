#!/bin/bash
#
# update-records.sh - tools/update-records.sh 0 $PWD/ $PWD/recordings/
#

TOP_DIR=$(cd $(dirname $0) && pwd)/../

VNC_RECORD_ACTION=$1
VNC_WWW_DIR=$2
VNC_RECORD_DIR=$3

[ -z "$VNC_RECORD_ACTION" ] && VNC_RECORD_ACTION=0
[ -z "$VNC_RECORD_DIR" ] && VNC_RECORD_DIR=${TOP_DIR}/recordings/
[ -z "$VNC_WWW_DIR" ] && VNC_WWW_DIR=${TOP_DIR}/
[ -z "$VNC_POST_DIR" ] && VNC_POST_DIR=${TOP_DIR}/_posts/
[ -z "$VNC_SESSION_DIR" ] && VNC_SESSION_DIR=${TOP_DIR}/sessions/

${TOP_DIR}/tools/generate-records.py $VNC_RECORD_DIR $VNC_RECORD_ACTION $VNC_WWW_DIR

# Public sessions
find $VNC_RECORD_DIR -name "*.session.md" | xargs -i cp {} $VNC_SESSION_DIR

# Public posts
find $VNC_RECORD_DIR -name "*.post.md" | xargs -i cp {} $VNC_POST_DIR
