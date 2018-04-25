
select * from fip_operatinglog where SRC_FREEDEF1 = '81300ZS18040067'; --0001D11000000041BZ6Y_1
 
select pk_jkbx
  from er_bxzb
 where djbh = '81300ZS18040067' --0001D1100000003NH2K4
 --银企直连支付的，处理过程表中，来源单据号为SRC_FREEDEF1  ，来源单据主键不是原单据主键，会加上一个标记（坑爹）   
    
select DES_FREEDEF1,SRC_FREEDEF1,src_relationid
  from fip_operatinglog
 where SRC_FREEDEF1 is not null 
 
