
--����ֱ��֧������δ����ƾ֤
--������״̬�ֹ��ĳ�  1��֧���У� 
--֧��ָ��״̬����ͬ���¼���
select settlestatus
  from cmp_settlement
 where billcode = '81300CL18120055'
   for update;

update cmp_settlement
   set settlestatus = '1'
 where billcode in ( select billcode from bxd
 )
   and dr = '0'


create table bxd (
billcode varchar(30)
)


select * from bxd
