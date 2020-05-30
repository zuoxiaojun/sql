
-- һ�����ݿ� 
--���ݿ�����
select name from v$database;
--���ݿ�Ψһ���� 
select db_unique_name from v$database;
--���ݿ�ID 
select dbid from v$database;
--���ݿⴴ��ʱ�� 
select to_char(created, 'yyyy/mm/dd hh24:mi:ss') from v$database;
--��־�鵵ģʽ 
select log_mode from v$database;
--��ģʽ  
select open_mode from v$database;
--���ݿ��ɫ
select database_role from v$database;
--�����������ļ� 
select value from v$parameter where name = 'spfile';
--�����ļ��б�  
select value from v$parameter2 where name = 'control_files';
--���������ļ�  
--��ռ��б� 
select name from v$tablespace;
--�����ļ��б�  
select name from v$datafile;
--��ʱ�ļ��б�  
select name from v$tempfile;
--��־���б� 
select group#, bytes / 1024 / 1024 || 'M' from v$log;
--������־�ļ��б�  
select max(length(member)) from v$logfile;
select group#, member from v$logfile;
--���������ļ�  
--�鵵��־�ļ��б�  
select count(*) from v$archived_log;
select count(*) from v$archived_log where name is not null;
select name from v$archived_log where name is not null;
--�����ļ��б�  
select count(*) from v$backup_piece;
select count(*) from v$backup_piece where handle is not null;
select handle
  from v$backup_piece
 where start_time >= sysdate - 1
 order by handle;
--�ġ��û���ģʽ���� 
--���ݿ��û��б� 
select username from dba_users order by created;
--ģʽ���������б�  desc dba_objects
select owner, object_type, count(*)
  from dba_objects
 group by owner, object_type
 order by owner, object_type;
--�塢ʵ����Ự 
--��������  
select host_name from v$instance;
--ʵ������  
select instance_name from v$instance;
--��������  
select value from v$parameter where name = 'service_names';
--���ݿ�����汾 
select version from v$instance;
--ʵ������ʱ��  
select to_char(startup_time, 'yyyy/mm/dd hh24:mi:ss') from v$instance;
--ʵ��״̬  
select status from v$instance;
--��ǰ�Ự�б�  
select sid, serial#, username from v$session;
--�ļ��Ĵ�С��ֲ�  
--�����ļ��ܴ�С 
select sum(bytes) / 1024 / 1024 || 'M' from v$datafile;
select round(sum(bytes) / 1024 / 1024 / 1024) || 'G' from v$datafile;
--��ʱ�ļ��ܴ�С 
select sum(bytes) / 1024 / 1024 || 'M' from v$tempfile;
select round(sum(bytes) / 1024 / 1024 / 1024) || 'G' from v$tempfile;
--������־�ļ��ܴ�С 
select sum(bytes * members) / 1024 / 1024 || 'M' from v$log;
select round(sum(bytes * members) / 1024 / 1024 / 1024) || 'G' from v$log;
--�����ļ��ܴ�С 
select sum(block_size * file_size_blks) / 1024 / 1024 || 'M'
  from v$controlfile;
--�鵵��־�ļ��ܴ�С 
select count(*) from v$archived_log;
select min(block_size * blocks) from v$archived_log;
select max(block_size * blocks) / 1024 / 1024 || 'M' from v$archived_log;
select sum(block_size * blocks) / 1024 / 1024 / 1024 || 'G'
  from v$archived_log;
select round(nvl(sum(block_size * blocks), 0) / 1024 / 1024 / 1024) || 'G'
  from v$archived_log
 where name is not null;
--�����ļ��ܴ�С 
select count(*) from v$backup_piece;
select sum(bytes) / 1024 / 1024 / 1024 || 'G' from v$backup_piece;
select round(sum(bytes) / 1024 / 1024 / 1024) || 'G'
  from v$backup_piece
 where handle is not null;
--�����ļ��ֲ�  
select distinct substr(name, 1, instr(name, '/', -1)) from v$datafile;
--��ʱ�ļ��ֲ�  
select distinct substr(name, 1, instr(name, '/', -1)) from v$tempfile;
--������־�ļ��ֲ�  
select distinct substr(member, 1, instr(member, '/', -1)) from v$logfile;
--�����ļ��ֲ�  
select distinct substr(name, 1, instr(name, '/', -1)) from v$controlfile;
--�鵵��־�ļ��ֲ�  
select distinct substr(name, 1, instr(name, '/', -1)) from v$archived_log;
--�����ļ��ֲ�  
select distinct substr(handle, 1, instr(handle, '/', -1))
  from v$backup_piece;
--�����������ļ�λ�� 
select substr(value, 1, instr(value, '/', -1))
  from v$parameter
 where name = 'spfile';
--�澯��־λ��  
select value from v$parameter where name = 'background_dump_dest';
--��̨������־λ��  
select value from v$parameter where name = 'background_dump_dest';
--�û�������־λ��  
select value from v$parameter where name = 'user_dump_dest';
--�ں˸�����־λ��  
select value from v$parameter where name = 'core_dump_dest';

--����ռ�ռ�ռ���� 
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

--������Դʹ�����  desc v$resource_limit
select max(length(resource_name)) from v$resource_limit;

select resource_name,
       current_utilization,
       max_utilization,
       initial_allocation,
       limit_value
  from v$resource_limit;
--�汾  
--���ݿ�汾 desc v$version
select banner from v$version;
--���ݿ�ѡ�� desc v$option
select max(length(parameter)), max(length(value)) from v$option;
select parameter, value from v$option;
--ϵͳ����  
--�������� 
select value from v$parameter where name = 'processes';
--���Ự�� 
select value from v$parameter where name = 'sessions';
--���ݿ��С 
select value from v$parameter where name = 'db_block_size';
--�α깲��ģʽ  
select value from v$parameter where name = 'cursor_sharing';
--�������� 
select value from v$parameter where name = 'db_file_multiblock_read_count';
--�ع��α�ռ�  
select value from v$parameter where name = 'undo_tablespace';
--�ع��α���ʱ�� 
select value from v$parameter where name = 'undo_retention';
--�ع��ι���ģʽ 
select value from v$parameter where name = 'undo_management';
--ϵͳȫ����Ŀ���С 
select value / 1024 / 1024 || 'M'
  from v$parameter
 where name = 'sga_target';
--ϵͳȫ�������ֵ  
select value / 1024 / 1024 || 'M'
  from v$parameter
 where name = 'sga_max_size';
--����ȫ����Ŀ���  
select value / 1024 / 1024 || 'M'
  from v$parameter
 where name = 'pga_aggregate_target';
--ʱ��ͳ��  
select value from v$parameter where name = 'timed_statistics';
--��ʼ�������ļ� 
select value from v$parameter where name = 'ifile';
--���ݿ����� 
select value from v$parameter where name = 'db_name';
--���ݿ�Ψһ���� 
select value from v$parameter where name = 'db_unique_name';
--ʵ������  
select value from v$parameter where name = 'instance_name';
--��������  
select value from v$parameter where name = 'service_names';
--��ǰ�û��ſ�  
--�ε������� -- �鿴�ε�����
select count(*) from user_segments;
-- �鿴�������͵Ķε�����
select segment_type, count(*)
  from user_segments
 group by segment_type
 order by segment_type;
--����б�  desc user_segments
select max(length(segment_name)) from user_segments;

select max(length(tablespace_name)) from dba_tablespaces;

-- �����Ͳ鿴�εĻ�����Ϣ
select segment_name, -- �ε�����
       tablespace_name, -- ���ڵı�ռ������
       round(bytes / 1024 / 1024) || 'MB' as MB,
       extents -- ��������������
  from user_segments
 where segment_type = 'TABLE'
   and bytes >= (1024 * 1024) * 10
   and rownum <= 5
 order by bytes desc;
--�εĻ�����Ϣ  -- �鿴ĳ���εĻ�����Ϣ
select segment_name, -- �ε�����
       partition_name,
       segment_type, -- �ε�����
       segment_subtype,
       tablespace_name, -- ��ռ������
       bytes, -- �εĴ�С
       blocks, -- �������
       extents -- ��������
  from user_segments
 where segment_name = 'POSTPAY_BILLED_REVENUE';
--�����б�  -- �鿴ĳ���ε����б�
select segment_name, -- �ε�����
       extent_id, -- ���ı��
       bytes -- ���Ĵ�С
  from user_extents
 where segment_name = 'POSTPAY_BILLED_REVENUE'
 order by extent_id;
--���Ĵ�С�ֲ�  -- ���Ĵ�С�ֲ�����
select segment_name, -- �ε�����
       bytes / 1024 / 1024, -- ���Ĵ�С
       count(*) -- ��������
  from user_extents
 where segment_name = 'POSTPAY_BILLED_REVENUE'
 group by segment_name, bytes
 order by bytes;
-- ���������û�ռ�õĴ洢�ռ�
select user, -- ���ݿ��û���
       round(sum(bytes / 1024 / 1024 / 1024), 2) as space_GB -- ռ�ô洢�ռ��С
  from user_segments;
-- �г�ռ�ô洢�ռ�����ǰ20����
select segment_name, -- �ε�����
       segment_type, -- �ε�����
       tablespace_name, -- ���ڱ�ռ�
       bytes, -- �εĴ�С
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
-- �鿴��Ļ�����Ϣ
select table_name, -- �������
       tablespace_name, -- ��ռ������
       num_rows, -- ��¼��
       avg_row_len, -- �е�ƽ������
       last_analyzed, -- ͳ����Ϣ�ռ�ʱ��
       sample_size -- ͳ����Ϣ�ռ�����
  from user_tables
 where table_name = 'POSTPAY_BILLED_REVENUE';
-- �鿴�ֶεĻ�����Ϣ
select table_name, -- �������
       column_id, -- �ֶε�˳��
       column_name, -- �ֶε�����
       data_type, -- ��������
       data_length, -- �ֶγ���
       nullable, -- �Ƿ������ֵ
       num_distinct, -- ��ֵͬ�ĸ���
       num_nulls -- ��ֵ��¼��
  from user_tab_columns
 where table_name = 'POSTPAY_BILLED_REVENUE'
 order by column_id;
-- �鿴��ı�ע
select table_name, -- ����
       table_type, -- ����
       comments -- ��ע
  from user_tab_comments
 where table_name = 'POSTPAY_BILLED_REVENUE';
-- �鿴�ֶεı�ע
select table_name, -- �������
       column_name, -- �ֶε�����
       comments -- ��ע
  from user_col_comments
 where table_name = 'POSTPAY_BILLED_REVENUE';
-- �鿴���Լ��
select owner,
       constraint_name, -- Լ��������
       constraint_type, -- Լ��������
       table_name -- �����������
  from user_constraints
 where table_name = 'POSTPAY_BILLED_REVENUE'
   and constraint_type = 'P';
-- �鿴Լ�����ֶ�
select owner,
       constraint_name, -- Լ��������
       table_name, -- �����������
       column_name, -- �ֶε�����
       position -- �ֶε�˳��
  from user_cons_columns
 where constraint_name = 'POSTPAY_BILLED_REVENUE_PK'
 order by position;
-- �鿴�������б�
select table_name, -- �������
       index_name, -- ����������
       index_type, -- ��������
       uniqueness, -- �Ƿ�Ψһ����
       tablespace_name, -- ��ռ�����
       leaf_blocks, -- Ҷ�ӿ�����
       distinct_keys, -- ��ֵ��
       clustering_factor, -- �ۺ�����
       num_rows, -- ��¼��
       last_analyzed -- ͳ����Ϣ�ռ�ʱ��
  from user_indexes
 where table_name = 'POSTPAY_BILLED_REVENUE';
-- �鿴�������ֶ�
select table_name, -- ������
       index_name, -- �ֶ�����
       column_position, -- �ֶ�˳��
       column_name -- �ֶ�����
  from user_ind_columns
 where table_name = 'POSTPAY_BILLED_REVENUE'
 order by index_name, column_position;
-- �鿴���������
select count(*) from user_objects;
-- �鿴�������Ͷ��������
select object_type, -- ���������
       count(*) -- ���������
  from user_objects
 group by object_type
 order by object_type;
-- �鿴���ݿ�����
select * from user_db_links;
-- �鿴�����
select * from user_lobs;
-- �鿴�ﻯ��ͼ
select * from user_mviews;
-- �鿴��ͼ
select * from user_views;
�˽�ҵ�������� --
-- �˽�ĳ��ҵ��������
--
-- ��һ�¶��ж��
  select segment_name, -- �ε�����
         segment_type, -- �ε�����
         tablespace_name, -- ��ռ������
         round(bytes / 1024 / 1024 / 1024, 2) || 'GB' as space_GB -- �εĴ�С
    from user_segments
   where segment_name = 'CUSTOMER'
     and segment_type = 'TABLE';

-- ��һ�±��ж�������¼
select table_name, -- �������
       tablespace_name, -- ��ռ������
       num_rows, -- ��¼��
       last_analyzed -- ͳ����Ϣ�ռ�ʱ��
  from user_tables
 where table_name = 'CUSTOMER';

-- �ҳ����������ƺ��ֶ��б�
select owner,
       constraint_name, -- Լ��������
       constraint_type, -- Լ��������
       table_name -- �����������
  from user_constraints
 where table_name = 'CUSTOMER'
   and constraint_type = 'P';

--
select owner,
       constraint_name, -- Լ��������
       table_name, -- �����������
       column_name, -- �ֶε�����
       position -- �ֶε�˳��
  from user_cons_columns
 where constraint_name = 'SYS_C0010843'
   and table_name = 'CUSTOMER'
 order by position;

-- ����������Щ�����Լ��������ֶ�
select table_name, -- �������
       index_name -- ����������
  from user_indexes
 where table_name = 'CUSTOMER';

--
select table_name, -- ������
       index_name, -- �ֶ�����
       column_position, -- �ֶ�˳��
       column_name -- �ֶ�����
  from user_ind_columns
 where table_name = 'CUSTOMER'
 order by index_name, column_position;

-- �������10����¼�������ֶ�
select customer_id from customer where rownum <= 10;

-- �鿴�����ֶε���������
select table_name, -- �������
       column_name, -- �ֶε�����
       data_type, -- ��������
       num_distinct, -- ��ֵͬ�ĸ���
       num_nulls -- ��ֵ��¼��
  from user_tab_columns
 where table_name = 'CUSTOMER'
   and column_name in ('CUSTOMER_ID');
