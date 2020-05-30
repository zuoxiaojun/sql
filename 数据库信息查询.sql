
-- 一、数据库 
--数据库名称
select name from v$database;
--数据库唯一名称 
select db_unique_name from v$database;
--数据库ID 
select dbid from v$database;
--数据库创建时间 
select to_char(created, 'yyyy/mm/dd hh24:mi:ss') from v$database;
--日志归档模式 
select log_mode from v$database;
--打开模式  
select open_mode from v$database;
--数据库角色
select database_role from v$database;
--服务器参数文件 
select value from v$parameter where name = 'spfile';
--控制文件列表  
select value from v$parameter2 where name = 'control_files';
--二、数据文件  
--表空间列表 
select name from v$tablespace;
--数据文件列表  
select name from v$datafile;
--临时文件列表  
select name from v$tempfile;
--日志组列表 
select group#, bytes / 1024 / 1024 || 'M' from v$log;
--在线日志文件列表  
select max(length(member)) from v$logfile;
select group#, member from v$logfile;
--三、备份文件  
--归档日志文件列表  
select count(*) from v$archived_log;
select count(*) from v$archived_log where name is not null;
select name from v$archived_log where name is not null;
--备份文件列表  
select count(*) from v$backup_piece;
select count(*) from v$backup_piece where handle is not null;
select handle
  from v$backup_piece
 where start_time >= sysdate - 1
 order by handle;
--四、用户与模式对象 
--数据库用户列表 
select username from dba_users order by created;
--模式对象数量列表  desc dba_objects
select owner, object_type, count(*)
  from dba_objects
 group by owner, object_type
 order by owner, object_type;
--五、实例与会话 
--主机名称  
select host_name from v$instance;
--实例名称  
select instance_name from v$instance;
--服务名称  
select value from v$parameter where name = 'service_names';
--数据库软件版本 
select version from v$instance;
--实例启动时间  
select to_char(startup_time, 'yyyy/mm/dd hh24:mi:ss') from v$instance;
--实例状态  
select status from v$instance;
--当前会话列表  
select sid, serial#, username from v$session;
--文件的大小与分布  
--数据文件总大小 
select sum(bytes) / 1024 / 1024 || 'M' from v$datafile;
select round(sum(bytes) / 1024 / 1024 / 1024) || 'G' from v$datafile;
--临时文件总大小 
select sum(bytes) / 1024 / 1024 || 'M' from v$tempfile;
select round(sum(bytes) / 1024 / 1024 / 1024) || 'G' from v$tempfile;
--在线日志文件总大小 
select sum(bytes * members) / 1024 / 1024 || 'M' from v$log;
select round(sum(bytes * members) / 1024 / 1024 / 1024) || 'G' from v$log;
--控制文件总大小 
select sum(block_size * file_size_blks) / 1024 / 1024 || 'M'
  from v$controlfile;
--归档日志文件总大小 
select count(*) from v$archived_log;
select min(block_size * blocks) from v$archived_log;
select max(block_size * blocks) / 1024 / 1024 || 'M' from v$archived_log;
select sum(block_size * blocks) / 1024 / 1024 / 1024 || 'G'
  from v$archived_log;
select round(nvl(sum(block_size * blocks), 0) / 1024 / 1024 / 1024) || 'G'
  from v$archived_log
 where name is not null;
--备份文件总大小 
select count(*) from v$backup_piece;
select sum(bytes) / 1024 / 1024 / 1024 || 'G' from v$backup_piece;
select round(sum(bytes) / 1024 / 1024 / 1024) || 'G'
  from v$backup_piece
 where handle is not null;
--数据文件分布  
select distinct substr(name, 1, instr(name, '/', -1)) from v$datafile;
--临时文件分布  
select distinct substr(name, 1, instr(name, '/', -1)) from v$tempfile;
--在线日志文件分布  
select distinct substr(member, 1, instr(member, '/', -1)) from v$logfile;
--控制文件分布  
select distinct substr(name, 1, instr(name, '/', -1)) from v$controlfile;
--归档日志文件分布  
select distinct substr(name, 1, instr(name, '/', -1)) from v$archived_log;
--备份文件分布  
select distinct substr(handle, 1, instr(handle, '/', -1))
  from v$backup_piece;
--服务器参数文件位置 
select substr(value, 1, instr(value, '/', -1))
  from v$parameter
 where name = 'spfile';
--告警日志位置  
select value from v$parameter where name = 'background_dump_dest';
--后台跟踪日志位置  
select value from v$parameter where name = 'background_dump_dest';
--用户跟踪日志位置  
select value from v$parameter where name = 'user_dump_dest';
--内核跟踪日志位置  
select value from v$parameter where name = 'core_dump_dest';

--各表空间空间占用率 
select df.tablespace_name,
       round(df.bytes / 1024 / 1024, 2) || 'M' as "Total_Space",
       round(nvl(fs.bytes, 0) / 1024 / 1024, 2) || 'M' as "Free_Space",
       round((df.bytes - nvl(fs.bytes, 0)) / 1024 / 1024, 2) || 'M' as "Used_Space",
       round(nvl(fs.bytes, 0) / df.bytes, 4) * 100 || '%' as "Free_Percentage",
       round(1 - nvl(fs.bytes, 0) / df.bytes, 4) * 100 || '%' as "Used_Percentage"
  from (select tablespace_name, sum(bytes) as bytes
          from dba_data_files
         group by tablespace_name) df,
       (select tablespace_name, sum(bytes) as bytes
          from dba_free_space
         group by tablespace_name) fs
 where df.tablespace_name = fs.tablespace_name(+)
 order by df.tablespace_name;

--主机资源使用情况  desc v$resource_limit
select max(length(resource_name)) from v$resource_limit;

select resource_name,
       current_utilization,
       max_utilization,
       initial_allocation,
       limit_value
  from v$resource_limit;
--版本  
--数据库版本 desc v$version
select banner from v$version;
--数据库选项 desc v$option
select max(length(parameter)), max(length(value)) from v$option;
select parameter, value from v$option;
--系统参数  
--最大进程数 
select value from v$parameter where name = 'processes';
--最大会话数 
select value from v$parameter where name = 'sessions';
--数据块大小 
select value from v$parameter where name = 'db_block_size';
--游标共享模式  
select value from v$parameter where name = 'cursor_sharing';
--多块读批量 
select value from v$parameter where name = 'db_file_multiblock_read_count';
--回滚段表空间  
select value from v$parameter where name = 'undo_tablespace';
--回滚段保留时间 
select value from v$parameter where name = 'undo_retention';
--回滚段管理模式 
select value from v$parameter where name = 'undo_management';
--系统全局区目标大小 
select value / 1024 / 1024 || 'M'
  from v$parameter
 where name = 'sga_target';
--系统全局区最大值  
select value / 1024 / 1024 || 'M'
  from v$parameter
 where name = 'sga_max_size';
--程序全局区目标和  
select value / 1024 / 1024 || 'M'
  from v$parameter
 where name = 'pga_aggregate_target';
--时间统计  
select value from v$parameter where name = 'timed_statistics';
--初始化参数文件 
select value from v$parameter where name = 'ifile';
--数据库名称 
select value from v$parameter where name = 'db_name';
--数据库唯一名称 
select value from v$parameter where name = 'db_unique_name';
--实例名称  
select value from v$parameter where name = 'instance_name';
--服务名称  
select value from v$parameter where name = 'service_names';
--当前用户概况  
--段的总数量 -- 查看段的数量
select count(*) from user_segments;
-- 查看各种类型的段的数量
select segment_type, count(*)
  from user_segments
 group by segment_type
 order by segment_type;
--大段列表  desc user_segments
select max(length(segment_name)) from user_segments;

select max(length(tablespace_name)) from dba_tablespaces;

-- 按类型查看段的基本信息
select segment_name, -- 段的名称
       tablespace_name, -- 所在的表空间的名称
       round(bytes / 1024 / 1024) || 'MB' as MB,
       extents -- 包含的区的数量
  from user_segments
 where segment_type = 'TABLE'
   and bytes >= (1024 * 1024) * 10
   and rownum <= 5
 order by bytes desc;
--段的基本信息  -- 查看某个段的基本信息
select segment_name, -- 段的名称
       partition_name,
       segment_type, -- 段的类型
       segment_subtype,
       tablespace_name, -- 表空间的名称
       bytes, -- 段的大小
       blocks, -- 块的数量
       extents -- 区的数量
  from user_segments
 where segment_name = 'POSTPAY_BILLED_REVENUE';
--区的列表  -- 查看某个段的区列表
select segment_name, -- 段的名称
       extent_id, -- 区的编号
       bytes -- 区的大小
  from user_extents
 where segment_name = 'POSTPAY_BILLED_REVENUE'
 order by extent_id;
--区的大小分布  -- 区的大小分布分析
select segment_name, -- 段的名称
       bytes / 1024 / 1024, -- 区的大小
       count(*) -- 区的数量
  from user_extents
 where segment_name = 'POSTPAY_BILLED_REVENUE'
 group by segment_name, bytes
 order by bytes;
-- 计算整个用户占用的存储空间
select user, -- 数据库用户名
       round(sum(bytes / 1024 / 1024 / 1024), 2) as space_GB -- 占用存储空间大小
  from user_segments;
-- 列出占用存储空间最多的前20个段
select segment_name, -- 段的名称
       segment_type, -- 段的类型
       tablespace_name, -- 所在表空间
       bytes, -- 段的大小
       round(bytes / 1024 / 1024 / 1024, 3) as space_GB
  from (select segment_name,
               segment_type,
               tablespace_name,
               bytes,
               blocks,
               extents
          from user_segments
         order by bytes desc)
 where rownum <= 10;
-- 查看表的基本信息
select table_name, -- 表的名称
       tablespace_name, -- 表空间的名称
       num_rows, -- 记录数
       avg_row_len, -- 行的平均长度
       last_analyzed, -- 统计信息收集时间
       sample_size -- 统计信息收集样本
  from user_tables
 where table_name = 'POSTPAY_BILLED_REVENUE';
-- 查看字段的基本信息
select table_name, -- 表的名称
       column_id, -- 字段的顺序
       column_name, -- 字段的名称
       data_type, -- 数据类型
       data_length, -- 字段长度
       nullable, -- 是否允许空值
       num_distinct, -- 不同值的个数
       num_nulls -- 空值记录数
  from user_tab_columns
 where table_name = 'POSTPAY_BILLED_REVENUE'
 order by column_id;
-- 查看表的备注
select table_name, -- 名称
       table_type, -- 类型
       comments -- 备注
  from user_tab_comments
 where table_name = 'POSTPAY_BILLED_REVENUE';
-- 查看字段的备注
select table_name, -- 表的名称
       column_name, -- 字段的名称
       comments -- 备注
  from user_col_comments
 where table_name = 'POSTPAY_BILLED_REVENUE';
-- 查看表的约束
select owner,
       constraint_name, -- 约束的名称
       constraint_type, -- 约束的类型
       table_name -- 归属表的名称
  from user_constraints
 where table_name = 'POSTPAY_BILLED_REVENUE'
   and constraint_type = 'P';
-- 查看约束的字段
select owner,
       constraint_name, -- 约束的名称
       table_name, -- 归属表的名称
       column_name, -- 字段的名称
       position -- 字段的顺序
  from user_cons_columns
 where constraint_name = 'POSTPAY_BILLED_REVENUE_PK'
 order by position;
-- 查看索引的列表
select table_name, -- 表的名称
       index_name, -- 索引的名称
       index_type, -- 索引类型
       uniqueness, -- 是否唯一索引
       tablespace_name, -- 表空间名称
       leaf_blocks, -- 叶子块数量
       distinct_keys, -- 键值数
       clustering_factor, -- 聚合因子
       num_rows, -- 记录数
       last_analyzed -- 统计信息收集时间
  from user_indexes
 where table_name = 'POSTPAY_BILLED_REVENUE';
-- 查看索引的字段
select table_name, -- 表名称
       index_name, -- 字段名称
       column_position, -- 字段顺序
       column_name -- 字段名称
  from user_ind_columns
 where table_name = 'POSTPAY_BILLED_REVENUE'
 order by index_name, column_position;
-- 查看对象的数量
select count(*) from user_objects;
-- 查看各种类型对象的数量
select object_type, -- 对象的类型
       count(*) -- 对象的数量
  from user_objects
 group by object_type
 order by object_type;
-- 查看数据库链接
select * from user_db_links;
-- 查看大对象
select * from user_lobs;
-- 查看物化视图
select * from user_mviews;
-- 查看视图
select * from user_views;
了解业务表的例子 --
-- 了解某个业务表的例子
--
-- 看一下段有多大
  select segment_name, -- 段的名称
         segment_type, -- 段的类型
         tablespace_name, -- 表空间的名称
         round(bytes / 1024 / 1024 / 1024, 2) || 'GB' as space_GB -- 段的大小
    from user_segments
   where segment_name = 'CUSTOMER'
     and segment_type = 'TABLE';

-- 看一下表有多少条记录
select table_name, -- 表的名称
       tablespace_name, -- 表空间的名称
       num_rows, -- 记录数
       last_analyzed -- 统计信息收集时间
  from user_tables
 where table_name = 'CUSTOMER';

-- 找出主键的名称和字段列表
select owner,
       constraint_name, -- 约束的名称
       constraint_type, -- 约束的类型
       table_name -- 归属表的名称
  from user_constraints
 where table_name = 'CUSTOMER'
   and constraint_type = 'P';

--
select owner,
       constraint_name, -- 约束的名称
       table_name, -- 归属表的名称
       column_name, -- 字段的名称
       position -- 字段的顺序
  from user_cons_columns
 where constraint_name = 'SYS_C0010843'
   and table_name = 'CUSTOMER'
 order by position;

-- 看看表有哪些索引以及索引的字段
select table_name, -- 表的名称
       index_name -- 索引的名称
  from user_indexes
 where table_name = 'CUSTOMER';

--
select table_name, -- 表名称
       index_name, -- 字段名称
       column_position, -- 字段顺序
       column_name -- 字段名称
  from user_ind_columns
 where table_name = 'CUSTOMER'
 order by index_name, column_position;

-- 随机检索10条记录的主键字段
select customer_id from customer where rownum <= 10;

-- 查看主键字段的数据类型
select table_name, -- 表的名称
       column_name, -- 字段的名称
       data_type, -- 数据类型
       num_distinct, -- 不同值的个数
       num_nulls -- 空值记录数
  from user_tab_columns
 where table_name = 'CUSTOMER'
   and column_name in ('CUSTOMER_ID');
