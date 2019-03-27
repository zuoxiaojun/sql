select * from cmp_settlement
--结算信息子表本方银行账户错误
select pk_account , pk_bank ,accountnum 
  from cmp_detail
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '84000BX19010013')  --1001D110000000C9HTRA

--修复数据
update cmp_detail
   set pk_account = '1001D110000000CA3YIC'
 where pk_account = '1001D110000000C9HTRA'
and accountnum='3050020010120100247366'


select fkyhzh  from er_bxzb where djbh='84000BX19010013'

--单据模板上的取值公式
fkyhzh->getcolvalue(bd_bankaccsub,pk_bankaccsub,accnum,getcolvalue(org_adminorg,def1,pk_vid,dwbm_v))

--经检查，发现是accnum值在子户中有两个，修改掉错误的那个即可
select code,accnum from bd_bankaccsub where accnum ='3050020010120100247366' for update 


