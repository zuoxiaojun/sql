--���ö�̬������ͼ
select * from V$FIXED_TABLE; --���ж�̬������ͼ
select * from v$instance; --��ǰʵ������ϸ��Ϣ
select * from v$database; --��ȡ��ǰ���ݿ����ϸ��Ϣ
select * from v$sga; --��ȡsga���й���Ϣ
select * from v$sgainfo; --ȡ��sga�ĸ���ϸ��Ϣ
select * from v$parameter; --ȡ�ó�ʼ����������ϸ��Ϣ
select * from v$version; --��ȡ���ݿ�汾��Ϣ
select * from v$option; --��ʾ�Ѿ���װ��oracleѡ��
select * from v$session where username is not null; --��ʾ�Ự����ϸ��Ϣ
select * from v$process; --��ʾ��̨������ϸ��Ϣ
select * from v$controlfile; --ȡ�õ�ǰ���ݿ����п����ļ�����Ϣ
select * from v$datafile; --ȡ�õ�ǰ���ݿ�����������ļ�����ϸ��Ϣ
select * from v$dbfile ;--ȡ�������ļ���ż�����
select * from v$tablespace;--��ʾ��ռ���Ϣ
select * from v$sql;
