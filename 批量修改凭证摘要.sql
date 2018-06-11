--创建中间表 

create table GLZY
(
  yzy VARCHAR2(255),
  zy  VARCHAR2(255)
)
;
select * from GLZY;

--odbc对照数据

--执行更新脚本

 update gl_detail a
    set a.explanation =
        (select b.zy from glzy b where a. explanation = b.yzy)
  where exists (select 1 from glzy b where a.explanation = b.yzy)  --更新凭证分录明细
  
  
   update gl_voucher a
    set a.explanation =
        (select b.zy from glzy b where a. explanation = b.yzy)
  where exists (select 1 from glzy b where a.explanation = b.yzy)  --更新凭证表头
  
