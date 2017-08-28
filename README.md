# shell-tools
定义一些Linux中shell常用的工具脚本，主要是用于linux下的一些shell脚本。

# log.sh
格式化记录shell脚本中的日志，每天在指定的日志目录下产生一个日志文件。
示例代码如下：
```shell
source ./log.sh "/opt/shell/iwuyc/log" "iwuyc.app" 0
log 0 "test_log" "Test write ERROR log into logfile."
log 1 "test_log" "Test write WARN log into logfile."
log 2 "test_log" "Test write INFO log into logfile."
log 3 "test_log" "Test write DEBUG log into logfile."
```
第一行代码表示引入，log.sh文件，并指定log文件的位置，log文件的前缀（可以认为是日志文件的存储目录），全局的日志级别。
上述的代码最终会在"/opt/shell/iwuyc/log"目录下，每天以"iwuyc.app_日期.log"的形式产生一个日志文件。日志级别为0，即大于0的日志将不打印到日志文件中，即"log 1 ..." 、"log 2 ..."、"log 3 ..."这几行输出的日志将被忽略，不会输出到日志文件中。