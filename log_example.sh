source ./log.sh "/opt/shell/iwuyc/log" "iwuyc.app" 0

log 0 "test_log" "Test write ERROR log into logfile."
log 1 "test_log" "Test write WARN log into logfile."
log 2 "test_log" "Test write INFO log into logfile."
log 3 "test_log" "Test write DEBUG log into logfile."