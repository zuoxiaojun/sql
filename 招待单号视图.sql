

select * from XX_ENTERTAINMENT--�д����뵥


select distinct(defitem40) from er_busitem --�д����뵥�ݺ�
select distinct(defitem41) from er_busitem --������
select distinct(defitem42) from er_busitem --�д�����

--�д�������ͼ
create or replace view CRMZD as 
select a.pk_jkbx ,a.djbh, b.defitem40
  from er_bxzb a
  left join er_busitem b
    on a.pk_jkbx = b.pk_jkbx
 where b.dr = '0'
 and a.djzt<>'0'
   and b.defitem40 <> '~'  ;

select * from CRMZD
