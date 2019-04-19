--在没有发生业务数据的情况下执行一下脚本，如果不清楚，请咨询具体业务部门。请谨慎执行，引发问题不做处理
--启用状态
update org_accountingbook
   set enablestate = '2'
 where code = '?' update org_orgs set enablestate = '2'
 where code = '?';

--总账账簿启用期间
update org_accountingbook
   set pk_accountperiod = '?', accountenablestate = '2'
 where code = '?'

--资产账簿启用期间
 update org_accountingbook set pk_assetperiod = '?',
 assetenablestate = '2'
 where code = '?'
--存货账簿启用期间
 update org_accountingbook set pk_materialperiod = '?',
 materialenablestate = '2'
 where code = '?'
--税务账簿启用期间
 update org_accountingbook set pk_taxperiod = '?',
 taxenablestate = '2'
 where code = '?'
--启用会计期间id从以下表查询
  select * from BD_ACCPERIODMONTH
          
         --其中code为核算账簿的编码；pk_preiod为会计期间对应的id
         
         /*账簿类型表：org_setofbook
         责任核算账簿表：org_liabilitybook
         1-未启用 2-启用 3-已停用
         
         
         请在测试环境，做好充分验证。
         请行如下脚本，并仔细参阅，附件文档。
         */
         
         --修改启用状态，请将需要启用的分类设为2。
         update org_accountingbook
            set accountenablestate = '2',
                assetenablestate   = '2',
                enablestate        = '2'
          where code in ('  ');


--修改账簿科目表
update org_accountingbook
   set pk_curraccchart = '科目pk'
 where code = '账簿编码';
--科目pk可从如下表里找到．
select * from bd_accchart
       
 --业务单元期间修改
         select *
           from org_moduleperiod
          where pk_org in
                (select pk_org from org_orgs where code = '业务单元code')
