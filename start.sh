#! /bin/sh
cnt=`ps -ef|grep -v grep|grep gitbook|wc -l`
if [ $cnt -lt 1 ];then
nohup gitbook serve >> /dev/null 2>&1 &
else
echo "gitbook process exists"
fi