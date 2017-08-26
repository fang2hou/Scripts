#!/bin/bash
#----------------------------
# Aria2c 智能控制脚本 
# houshuu
#----------------------------
# 使用说明：
# 可以直接运行脚本，也可以将设定 alias 到本文件当作命令用。
# 脚本默认只会运行一个实例！
# (null) - 同 Start
# start  - 开启
# stop   - 停止
# status - 状态
#----------------------------
# 设定部分
# 1 提示的软件名
softname="Aria2"
# 2 配置文件位置
config="/usr/local/cfg/aria2.conf"
#----------------------------
# 检测是否有参数
if [ -n "$1" ]; then
	# 参数运行
	if [ "$1" = "start" ]; then
		# start
		if pgrep -xq -- "aria2c"; then
		# 检测到在运行
		    echo "$softname .. [Running]"
		else
			# 没有检测到在运行
			aria2c --conf-path="$config" -D
		    echo "$softname .. [Start]"
		fi
	elif [ "$1" = "status" ]; then
		# status
		if pgrep -xq -- "aria2c"; then
		    echo "$softname .. [Running]"
		else
		    echo "$softname .. [Not running]"
		fi
	elif [ "$1" = "stop" ]; then
		# stop
		if pgrep -xq -- "aria2c"; then
		    pkill aria2c
			echo "$softname .. [Stop]"
		else
		    echo "$softname .. [Not running]"
		fi
	fi
else
	# 智能选择
	# 可按照个人需求来调整
	if pgrep -xq -- "aria2c"; then
		# 检测到在运行
	    echo "$softname .. [Running]"
	else
		# 没有检测到在运行
		aria2c --conf-path="$config" -D
	    echo "$softname .. [Start]"
	fi
fi