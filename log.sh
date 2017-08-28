#!/bin/bash
##########################################################################
#
#   Log for linux shell script
#   Author: iwuyc
#   Since: 2016-10-23 PM
#   Parameter:
#       @parameter log_path:save log file dir.Default value:"/var/log"
#       @parameter filePrename:log file prename.Default value:"iwuyc"
#       @parameter global_log_level:print log level
#   
#   Description:
#       If you want to import this shell script,you could use source keywords.
#   Example:
#       source /opt/script/log.sh "log_path" "filePrename" 2 
##########################################################################

log_path=$1
filePrename=$2
global_log_level=$3
##########################################################################
#
#   Prepare for write log into file.
#
#   Step 1.Get parameter for log
#   Step 2.Create directory for log file
#   Step 3.Create file for log
##########################################################################
function prepare {
    
    if [ "${log_path}X" = "X" ]; then
        log_path="/var/log"
    fi

    if [ "${filePrename}X" = "X" ]; then
        filePrename="iwuyc"
    fi

    if [ "${global_log_level}X" = "X" ]; then
        global_log_level=2
    fi

    #1 ERROR 2 WARN 3 INFO 4 DEBUG
    LOG_LEVEL=("ERROR" "WARN " "INFO " "DEBUG")

    currentDate=`date "+%Y-%m-%d"`

    currentDateLogFile="${log_path}/${filePrename}_${currentDate}.log"

    if [ ! -d "${log_path}" ]; then
        mkdir -p "${log_path}"
        chmod -f 600 "${log_path}"
    fi

    #Create current date log file,create new log file everyday.
    if [ ! -f "$currentDateLogFile" ]; then
        touch "${currentDateLogFile}"
        chmod -f 600 "${currentDateLogFile}"
    fi
}
##########################################################################
#
#   Description:
#       Write message into log file.
#   Parameter:
#       @parameter int log_level:0-3,mean:("ERROR" "WARN " "INFO " "DEBUG")
#       @parameter method_name:Where is write the message into log file.
#       @parameter msg:The message will write to log file.
#   Example:
#       log 2 "main" "This message will write to current date file."
##########################################################################
function log {
    
    local log_level=$1
    if [ "${log_level}" -gt "${global_log_level}" ]; then
        return
    fi
    
    local method_name=$2
    local msg=$3
    local current_time=`date "+%Y-%m-%dT%H:%M:%S%z"`
    local log_level_name=${LOG_LEVEL[${log_level}]}
    
    echo "[${current_time}] [${log_level_name}] [${method_name}] \"${msg}\"" >> ${currentDateLogFile}
}

prepare