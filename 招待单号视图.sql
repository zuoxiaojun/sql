

select * from XX_ENTERTAINMENT--招待申请单


select distinct(defitem40) from er_busitem --招待申请单据号
select distinct(defitem41) from er_busitem --申请金额
select distinct(defitem42) from er_busitem --招待日期

--招待单号视图
create or replace view CRMZD as 
select a.pk_jkbx ,a.djbh, b.defitem40
  from er_bxzb a
  left join er_busitem b
    on a.pk_jkbx = b.pk_jkbx
 where b.dr = '0'
 and a.djzt<>'0'
   and b.defitem40 <> '~'  ;

select * from CRMZD
