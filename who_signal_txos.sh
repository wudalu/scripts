#!/bin/bash
#
# wuzexiang@20191030
#
stap -e 'probe signal.send { printf("%s by %s: %s(%d) -> %s(%d)\n", sig_name, name, execname(), pid(), pid_name, sig_pid)}' | grep txos

# another way
#  strace -p ${TXOS_PID} -e trace=signal

