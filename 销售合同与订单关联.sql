--���ۺ�ͬ�����۶�������
select   pk_ct_sale,vbillcode  from ct_sale where vbillcode ='GCL/XXJC-XSSW-2018-0632';--1001D110000000C0QZBO
select  pk_ct_sale_b from ct_sale_b where  pk_ct_sale ='1001D110000000C0QZBO';--1001D110000000C0QZBQ

select csaleorderid from so_saleorder where vbillcode='82500XD20180813014';--1001D110000000C0SH8N

select *
  from so_saleorder_b
 where csaleorderid = '1001D110000000C0SH8N'  for update 
--and dr = 0



--���³��ⵥ�����Զ�����20��ͬ����
select vbdef20
  from ic_saleout_b
 where cgeneralhid =
       (select cgeneralhid
          from ic_saleout_h
         where vbillcode = '81300XC20180830257') for update 

--���·����������Զ�����20��ͬ����
select vbdef20
  from so_delivery_b
 where cdeliveryid =
       (select cdeliveryid
          from so_delivery
         where vbillcode = '81300DN20180828003') for update 
