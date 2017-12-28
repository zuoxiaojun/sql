select code,name ,pk_defdoc 
  from bd_defdoc
 where pk_defdoclist =
       (select pk_defdoclist from bd_defdoclist where name = '部门核算属性'); --自定义档案列表

select pk_dept ,def1,pk_dept,pay_local    
  from cmp_paybilldetail
 where pk_paybill ='1001D11000000078NCF2'
       --( select dr,pk_paybill, billmaker_date  from cmp_paybill where bill_no = 'FJ17100218'and dr=0)
        for update
