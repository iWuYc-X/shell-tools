####
# 对原shell命令的重新定义，以简化原有命令
####
export ieditor="/Applications/Visual Studio Code"

alias ireloadsource='source ~/.profile'
alias iopen='open -a "$ieditor"'

# 查找进程名为$1的进程信息
alias ips='_function(){ ps -ef | grep $1 | grep -v grep; };_function'
