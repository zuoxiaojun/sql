/*
差旅费报销单取出差申请单号对应关联凭证号
*/
select a.pk_fiorg,
       a.djrq,
       a.djbh,
       a.pk_jkbx,
       a.defitem13,
       b.des_relationid,
       c.pk_vouchertype, --凭证类别
       c.year,
       c.period,
       c.num
  from (select bx.djbh, bx.pk_jkbx, b.defitem13, bx.pk_fiorg, bx.djrq
          from er_bxzb bx
          left join er_busitem b
            on bx.pk_jkbx = b.pk_jkbx
         where bx.djlxbm = '2641'
           and bx.dr = 0) a
  left join fip_relation b
    on a.djbh = b.src_freedef1
  left join gl_voucher c
    on b.des_relationid = c.pk_voucher
;
    
    
 /*   
select * from  user_indexes  where TABLE_NAME='FIP_RELATION' 

create index index_des_relationid  on  fip_relation (SRC_FREEDEF1) tablespace nnc_index01

select  des_relationid  from  fip_relation where     SRC_FREEDEF1   ='80100CL19030066'

select a.djbh, a.pk_jkbx
  from er_bxzb a
 where a.djbh = '80100CL19030066'

select period, num
  from gl_voucher
 where pk_voucher = '1001D110000000GTRE5H'
*/
