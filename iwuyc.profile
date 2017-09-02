####
# 对原shell命令的重新定义，以简化原有命令
# 使用说明：
# 在系统的profile文件中引用该文件，如：在~/.profile文件中添加:source ./iwuyc.profile。再执行下:source ~/.profile
# 即可生效
####

# 定义iopen打开文件时所使用的编辑器
export ieditor="/Applications/Visual Studio Code"

#定义打开文件的指令，使用前面定义的编辑器打开指定文件
alias iopen='open -a "$ieditor"'

# 重新加载profile文件，只有手动执行过一次source ~/.profile之后才可以使用
alias ireloadsource='source ~/.profile'

# 查找进程名为$1的进程信息
alias ips='_function(){ ps -ef | grep $1 | grep -v grep; };_function'

# 实时查看文件变更
alias itailf='tail -f'

# 删除非空目录
alias irmdir='rm -rf'

# 列出所有的文件，ls的增强
alias lsall='ls -a'