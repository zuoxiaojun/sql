select * from dba_directories;

--linux系统下oracle自动备份导出shell

#!/bin/bash
day=$(date +'%Y-%m-%d')
expdp NC2019/1 dumpfile=NC_$day.dmp logfile=NC_$day.log directory=DUMP schemas=NC2019


