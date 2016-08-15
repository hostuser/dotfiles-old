#!/usr/bin/env python

from json import loads
from os import popen
from sys import argv

def ipc_query(req="command", msg=""):
    ans = popen("i3-msg -t " + req + " " +  msg).readlines()[0]
    return loads(ans)

if __name__ == "__main__":
    # Usage & checking args
    if len(argv) != 3:
        print "Usage: switch-workspace.py name-of-workspace name-of-output"
        exit(-1)

    newworkspace = argv[1]
    output = argv[2]

    message = "'workspace " + newworkspace + "; move workspace to output " + output + "; workspace " + newworkspace + "'"
    print message
    # Moving workspace to active display
    print ipc_query(msg=message)

