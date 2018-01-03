

select * from mid_custinfo;

UPDATE bd_customer A
   SET A . TAXPAYERID =
       (SELECT b.TAXPAYERID FROM mid_custinfo b WHERE A.code = b.code)
 WHERE EXISTS (SELECT 1 FROM mid_custinfo b WHERE A.code = b.code);--更新客户税号


update bd_customer a
   set a.tel2 =
       (select b.tel2 from mid_custinfo b where a.code = b.code)
 where exists (select 1 from mid_custinfo b where a.code = b.code);--更新户名
 
update bd_customer a
   set a.tel3 =
       (select b.tel3 from mid_custinfo b where a.code = b.code)
 where exists (select 1 from mid_custinfo b where a.code = b.code);--更新开户银行
 
 
update bd_customer a
   set a.CORPADDRESS =
       (select b.CORPADDRESS from mid_custinfo b where a.code = b.code)
 where exists (select 1 from mid_custinfo b where a.code = b.code); --更新地址




