select b.cgeneralbid,b.cmaterialoid,b.pk_batchcode,b.vbatchcode from ic_transin_h h inner join ic_transin_b b on h.cgeneralhid = b.cgeneralhid where h.dr = 0 and b.dr= 0 and 
h.vbillcode = '81300FR20171014002' and b.crowno = '30'
union all
select f.cgeneralbid,f.cmaterialoid,f.pk_batchcode,f.vbatchcode from ic_flowaccount_his f where f.vbillcode = '81300FR20171014002' and f.crowno = '30';

select b.CMATERIALOID, b.pk_batchcode, b.vbatchcode
  from scm_batchcode b
 where b.dr = 0
   and b.PK_BATCHCODE = '1001D11000000072EYET';
select b.CMATERIALOID, b.pk_batchcode, b.vbatchcode
  from scm_batchcode b
 where b.dr = 0
   and CMATERIALOID = '1001D11000000010SPR0'
   and VBATCHCODE = 'XYZ20171013-01'; --1001D1100000009BIZHS

--原值是 1001D11000000072EYET 
--update ic_transin_b set PK_BATCHCODE = '1001D11000000072EYET' where dr = 0 and CGENERALBID = '1001D11000000072EYEY';
--update ic_flowaccount_his set PK_BATCHCODE = '1001D11000000072EYET' where dr = 0 and CGENERALBID = '1001D11000000072EYEY';


select vbatchcode,pk_batchcode from ic_flowaccount_his where dr = 0 and CGENERALBID = '1001D11000000072EYEY' for update



   
   select * from  bd_stordoc  where pk_stordoc='1001B11000000002IGHT'--原辅料-自采-正常
