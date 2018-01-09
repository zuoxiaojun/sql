select supplier,
  from ap_payableitem
 where pk_payablebill =
       (select pk_payablebill
          from ap_payablebill
         where billno = '80501YF17120040');
         
         
         select * from  bd_cust_supplier where  pk_cust_sup ='0001D11000000004EM4F'

select * from bd_supplier where pk_supplier ='0001D11000000004EM4F'   --应付单供应商
