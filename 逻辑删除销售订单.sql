


--�߼�ɾ�����۶�������
update so_saleorder set dr=1 where vbillcode='SO30AK190521012';

--�߼�ɾ�����۶����ӱ�
update so_saleorder_b
   set dr = 1
 where csaleorderid in (select csaleorderid
                         from so_saleorder
                        where vbillcode = 'SO30AK190521012');
--�߼�ɾ�����۶���ִ�б�
update so_saleorder_exe
   set dr = 1where csaleorderbid in
            (select csaleorderbid
                      from so_saleorder_b
                     where csaleorderid in
                           (select csaleorderid
                              from so_saleorder
                             where vbillcode = 'SO30AK190521012'));
