#!/bin/bash

inotifywait -rme modify,attrib,move,close_write,create,delete,delete_self ../logic/log 
