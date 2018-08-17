#!/bin/sh
ps -ef|grep gitbook|grep -v grep|awk '{print "kill -9 "$2}'|sh