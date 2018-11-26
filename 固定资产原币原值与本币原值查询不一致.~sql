create table fa_cardhistory_20180907 as select * from fa_cardhistory 
-执行脚本使本币与原币相同
update fa_cardhistory set LOCALORIGINVALUE=ORIGINVALUE
where pk_card in(select pk_card from fa_card where card_code='卡片编号')
and pk_org in(select pk_financeorg from org_financeorg where code='组织编码');


select LOCALORIGINVALUE, ORIGINVALUE
  from fa_cardhistory
 where pk_card in
       (select pk_card from fa_card where card_code = '0000000182')
   and pk_org in
       (select pk_financeorg from org_financeorg where code = '80501');
