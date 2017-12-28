--常用动态性能视图
select * from V$FIXED_TABLE; --所有动态性能视图
select * from v$instance; --当前实例的详细信息
select * from v$database; --获取当前数据库的详细信息
select * from v$sga; --获取sga的有关信息
select * from v$sgainfo; --取得sga的更详细信息
select * from v$parameter; --取得初始化参数的详细信息
select * from v$version; --获取数据库版本信息
select * from v$option; --显示已经安装的oracle选项
select * from v$session where username is not null; --显示会话的详细信息
select * from v$process; --显示后台进程详细信息
select * from v$controlfile; --取得当前数据库所有控制文件的信息
select * from v$datafile; --取得当前数据库的所有数据文件的详细信息
select * from v$dbfile ;--取得数据文件编号及名称
select * from v$tablespace;--显示表空间信息
select * from v$sql;
