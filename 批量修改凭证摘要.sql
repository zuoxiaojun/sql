--�����м�� 

create table GLZY
(
  yzy VARCHAR2(255),
  zy  VARCHAR2(255)
)
;
select * from GLZY;

--odbc��������

--ִ�и��½ű�

 update gl_detail a
    set a.explanation =
        (select b.zy from glzy b where a. explanation = b.yzy)
  where exists (select 1 from glzy b where a.explanation = b.yzy)  --����ƾ֤��¼��ϸ
  
  
   update gl_voucher a
    set a.explanation =
        (select b.zy from glzy b where a. explanation = b.yzy)
  where exists (select 1 from glzy b where a.explanation = b.yzy)  --����ƾ֤��ͷ
  
