--Ӧ��������ϸ����ͬ����ⵥ������ϵvbdef20
select vbdef20
  from ic_saleout_b
 where cgeneralhid =
       (select cgeneralhid
          from ic_saleout_h
         where vbillcode = '82400XC20181108012')
for update 
