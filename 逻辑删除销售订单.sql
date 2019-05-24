


--逻辑删除销售订单主表
update so_saleorder set dr=1 where vbillcode='SO30AK190521012';

--逻辑删除销售订单子表
update so_saleorder_b
   set dr = 1
 where csaleorderid in (select csaleorderid
                         from so_saleorder
                        where vbillcode = 'SO30AK190521012');
--逻辑删除销售订单执行表
update so_saleorder_exe
   set dr = 1where csaleorderbid in
            (select csaleorderbid
                      from so_saleorder_b
                     where csaleorderid in
                           (select csaleorderid
                              from so_saleorder
                             where vbillcode = 'SO30AK190521012'));
