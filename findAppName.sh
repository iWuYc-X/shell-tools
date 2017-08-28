#!/bin/bash

##########################################################################
#
#   Find program info by port.
#
#   Return:
#       @parameter name:The program name.
#       @parameter pid:The program process id.
#       @parameter protocol:The protocol of this port.
#   Example:
#       byPort 60128
#       echo $name $pid $protocol
#
##########################################################################
function byPort {
    local port=$1
    local filterResult=(`netstat -anp | grep ":${port}" | grep "LISTEN"`)
    #Replace all '/' character to space.
    local pidAndProgram=(${filterResult[6]//\// })
    
    protocol=${filterResult[0]}
    pid="${pidAndProgram[0]}"
    name="${pidAndProgram[1]}"
}