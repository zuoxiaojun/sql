
/*����Ʒ�����˶��˲�ƽ����
ԭ���ǲ���Ʒ�ĵ�����ϸʵ�������8λС��������ƾ֤��ǰ̨��¼����2λС�����ӿڴ�������
*/

--�������˲�ƽ�ĵ��ݼ�¼��
create table dzbp (
vbillcode varchar(255));



select * from dzbp

--���´����ϸʵ����Ϊ2λС��
update ia_detailledger
   set nmny = round(nmny, 2)
 where vbillcode in (select vbillcode from dzbp)


select nmny
  from ia_detailledger
 where vbillcode in (select vbillcode from dzbp)
