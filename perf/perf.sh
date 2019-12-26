#!/bin/bash
#
# wuzexiang@20191129
#

ARGS=$@
PID=$1
DURATION=$2


help() {
	echo "Useage: $0 PID DURATION(in seconds)"
	echo "Example: sh perf.sh 26336 10"		
}

checkArgs() {
	if [ $# -lt 2 ];then
		echo "ERROR: not enough args"
		help
		exit;
	fi 
}

startPerf() {
	perf record -p $PID -F 99 -g -- sleep $DURATION   
	perf script | ~/software/FlameGraph/stackcollapse-perf.pl | ~/software/FlameGraph/flamegraph.pl > $PID.svg  
	perf report --stdio
}

main() {
    checkArgs $ARGS

    startPerf
}

main
