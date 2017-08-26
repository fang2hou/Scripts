#!/bin/bash
#----------------------------
# 进程检测脚本 
# houshuu
#----------------------------
# 使用说明：
# 可以直接运行脚本，也可以将设定 alias 到本文件当作命令用。
# 参数1 - 欲检测的进程名
#----------------------------

#检测是否有参数
if [ -n "$1" ]
then
	#检查参数指定的进程名
	if pgrep -xq -- "$1"
	then
	    echo "$1 is running"
	else
	    echo "$1 is not running"
	fi
else
	echo "Please enter the process name."
fi