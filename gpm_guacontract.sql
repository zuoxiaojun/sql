--担保表
create or replace view v_gpm_guacontract as (
select a.pk_group,
       a.pk_org,
       a.guarantor, --担保单位
       a.vdef8, --融资单位
       a.contractno, --担保合同号
       substr(a.guastartdate,1,10) guastartdate, --起始日
       substr(a.guaenddate,1,10) guaenddate, --到期日
       decode(a.busistatus,
              0,
              '待提交',
              1,
              '待审批',
              2,
              '待执行',
              3,
              '在执行',
              4,
              '已中止',
              5,
              '已结束') busistatus, --状态
       a.pk_guacurrtype, --币种
       guaamount, --担保总额
       a.guaamountdivcapital, --担保比例
       a.gualcamount, --担保金额
       decode(a.warliability,
              'NORMAL',
              '一般保证',
              'RALATED',
              '连带责任保证') warliability, --连带责任
       decode(a.guatype,
              'warrant',
              '保证',
              'guaranty',
              '抵押',
              'pledge',
              '质押',
              'mixed',
              '混合') guatype, --担保方式 
       a.dr adr,
       b.dr bdr,
       b.pk_guaproperty,        --担保物权标识   
       b.usingamount --评估值
  from gpm_guacontract a
  left join GPM_GUARANTYINFO b --抵押信息
    on a. pk_guacontract = b.pk_guacontract
 where a.dr = 0
   and a.ifecqr = 'N' --二次确认
   and nvl(b.dr, 0) = 0
   );


select * from v_gpm_guacontract
