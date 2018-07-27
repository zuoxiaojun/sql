--销售订单单据状态转换
select vbillcode,
       case so_saleorder.fstatusflag
         when 1 then
          '自由'
         when 2 then
          '审批通过'
         when 3 then
          '冻结'
         when 4 then
          '关闭'
         when 7 then
          '审批中'
         when 8 then
          '审批不通过'
         else
          '失效'
       end
  from so_saleorder
  
  select vbillcode,
       decode(fstatusflag,
              1,
              '自由',
              2,
              '审批通过',
              3,
              '冻结',
              4,
              '关闭',
              7,
              '审批中',
              8,
              '审批不通过',
              '失效') fstatusflag
  from so_saleorder

  
  
  select  distinct(fstatusflag) from so_saleorder
