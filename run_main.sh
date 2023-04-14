#!/bin/sh
export LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH # 二进制程序加载动态库路径
./main.out