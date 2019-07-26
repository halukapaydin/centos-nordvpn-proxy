#!/bin/bash
ssh-keygen -f "/home/haluk/.ssh/known_hosts" -R "[127.0.0.1]:1022";ssh root@127.0.0.1 -p 1022
