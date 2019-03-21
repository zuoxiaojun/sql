select * from to_settlerule where csettleruleid='0001A110000000002G76'

--调拨出库单签字报错：不支持此种业务，请检查
select *
  from to_settlerule_b
 where csettleruleid = '0001A110000000002G76' --0001A110000000002G7C

/*内部交易信息子表里面只有结算规则主表信息，没有子表信息
导致后面签字的生成内部交易待结算单的时候，因为没有结算规则子表pk报错了
刚才执行的语句，是把内部交易子表里面结算规则子表信息缺失的给补上了
就两条缺了

*/

select *
  from to_businessinfo_b
 where csettleruleid = '0001A110000000002G76'
   and dr = 0
   and csettlerule_bid != '0001A110000000002G7C'

update to_businessinfo_b
   set csettlerule_bid = '0001A110000000002G7C'
 where csettleruleid = '0001A110000000002G76'
   and dr = 0
   and csettlerule_bid != '0001A110000000002G7C'
   and csettlerule_bid = '~'; --1001D110000000G3GZ0A   1001D110000000G0YZ38
