--2017-11-06

select code, name, pk_defdoc
  from bd_defdoc
 where pk_defdoclist =
       (select pk_defdoclist from bd_defdoclist where name = '���ź�������'); --�Զ��嵵���б�

select pay_local,def1
  from cmp_paybilldetail
 where pk_paybill =
       (select pk_paybill from cmp_paybill where bill_no = 'FJ17100057') --for update 
