select distinct(defitem21) from er_busitem

select * from er_busitem where defitem25='6%'

update er_busitem set defitem21 = '' where defitem21 = '~';
update er_busitem set defitem25 = '' where defitem25 = '~'


--�����洢���̶�ʱ�����÷ѱ���������defitem25��˰�ʣ���ֵΪ'~'�ĸ���Ϊ��
--�����洢���̶�ʱ�����÷ѱ���������defitem21��˰�ʣ���ֵΪ'~'�ĸ���Ϊ��

create or replace procedure update_er_busitem_defitem2125 is
begin
  update er_busitem set defitem21 = '' where defitem21 = '~';
  update er_busitem set defitem25 = '' where defitem25 = '~';
  commit;
end;


select * from user_jobs
