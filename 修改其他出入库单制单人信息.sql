 
 
 select cuserid, user_name, user_code
   from sm_user
  --where user_name = '魏海燕'  --1001D11000000014S9MJ
  where user_code='yy01'           --1001D1100000004ZGACH
   

update ic_generalin_h
   set billmaker = '1001D11000000014S9MJ',
       creator   = '1001D11000000014S9MJ',
       approver  = '1001D11000000014S9MJ',
       modifier  = '1001D11000000014S9MJ'
 where billmaker = '1001D1100000004ZGACH' --库存其他入库单
 
 
update ic_generalout_h
 set billmaker = '1001D11000000014S9MJ',
       creator   = '1001D11000000014S9MJ',
       approver  = '1001D11000000014S9MJ',
       modifier  = '1001D11000000014S9MJ'
 where billmaker = '1001D1100000004ZGACH' --库存其他出库单
 
 update ia_i7bill
    set billmaker = '1001D11000000014S9MJ',
        creator   = '1001D11000000014S9MJ',       
        modifier = '1001D11000000014S9MJ'
  where billmaker = '1001D1100000004ZGACH' --其他出库单
 
 
  update ia_i4bill
    set billmaker = '1001D11000000014S9MJ',
        creator   = '1001D11000000014S9MJ',       
        modifier = '1001D11000000014S9MJ'
  where billmaker = '1001D1100000004ZGACH' --其他入库单
 
 
 update ia_detailledger
   set billmaker = '1001D11000000014S9MJ',
       approver  = '1001D11000000014S9MJ'
 where billmaker = '1001D1100000004ZGACH'
   and pk_org = '1001B11000000000AFMY'
   and dr = 0                                                           --单据明细实体
   

 
 
 
 
 
 
 
 
 
