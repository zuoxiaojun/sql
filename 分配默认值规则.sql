--��ʷ����ִ�У�
--�Ȳ�һ�����޴������ݹ���
select * from bd_assign_rule where pk_assign_temp not in (select pk_assign_temp from bd_assign_temp )
--����һ��Ҫɾ�������ݣ���ֹ����
create table bd_assign_rule_copy as(select * from bd_assign_rule);
--ɾ����������
delete from bd_assign_rule where pk_assign_temp not in (select pk_assign_temp from bd_assign_temp );
