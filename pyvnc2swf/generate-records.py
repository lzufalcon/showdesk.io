#!/usr/bin/env python
#
# generate-records.py -- generate records.js for noVNC recordings in /noVNC/recordings/
#

import sys, os

mypath = os.path.dirname(os.path.abspath(sys.argv[0]))
sys.path.append(mypath)

from records import *

def main():
    record_dir = ""
    if len(sys.argv) > 1:
        record_dir = sys.argv[1]

    # 0: zb64 + slice
    # 1: zb64
    # 2: remove + zb64
    # 3: remove + zb64 + slice

    action = 0
    if len(sys.argv) > 2:
        action = int(sys.argv[2])

    www_dir = ""
    if len(sys.argv) > 3:
        www_dir = sys.argv[3]

    if not record_dir:
        record_dir = mypath + "../" + "recordings/"
    if not www_dir:
        www_dir = mypath + "../"

    record_dir = os.path.abspath(record_dir) + "/"
    www_dir = os.path.abspath(www_dir) + "/"

    if action == 1:
	action = ('remove', 'remove_raw')
    elif action == 2:
	action = ('restore_raw')
    else:
	action = ('remove_raw', 'zb64', 'slice')

    r = Records(www_dir = www_dir, record_dir = record_dir, action = action)

    r.generate()

main()
