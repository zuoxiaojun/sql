update scm_batchcode set dr=0 where pk_batchcode  = '1001D11000000093P4UE' 

select dr,
       vsourcebillcode,
       vsourcerowno,
       csourcehid,
       csourcebid,
       cmaterialvid,
       cmaterialoid,
       pk_batchcode
  from scm_batchcode
 where pk_batchcode  = '1001D11000000093P4UE'  --批次档案   HXZ20180207-01

select pk_material from bd_material where  code='0104120162'--1001D11000000014DJEV  
select * from bd_material where pk_material='1001D11000000014DH01'
select  pk_stockorg from org_stockorg where code='813'   --0001B11000000000IIC7

select pk_batchcode
  from ic_onhanddim
 where vbatchcode = 'HXZ20180207-01'
   and cmaterialvid = '1001D11000000014DJEV'
   and pk_org = '0001B11000000000IIC7'
   and pk_onhanddim = '1001D11000000093P4UH'  --现存量维度
     
select * from ic_onhandnum where pk_onhanddim = '1001D11000000093P4UH'  --现存量


