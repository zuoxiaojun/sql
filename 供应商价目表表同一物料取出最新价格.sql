
--��Ӧ�̼�Ŀ���ͬһ����ȡ�����¼۸�
select pk_material, nastorigtaxprice, nastorigprice, tcreatetime
  from purp_supplierprice
 where tcreatetime in (select ts
                         from (select max(tcreatetime) ts, pk_material
                                 from purp_supplierprice
                                group by pk_material))
                                
   select * from purp_supplierprice
