

select approvestatus, billstatus         /*approvestatus  审批状态   -1=自由态，0=未通过态，1=通过态，2=进行中态，3=提交态*/
  from ap_paybill                                 /* billstatus  单据状态     9=未确认，-1=保存，1=审批通过，2=审批中，-99=暂存，8=签字*/
 where billno = '80100FK18050141'
   for update



--结算信息
select busistatus, aduitstatus
  from cmp_settlement
 where billcode = '80100FK18050141' /* busistatus  业务单据状态           -99=暂存，-1=保存，1=审核通过，8=签字，0=审批失败，2=审批中，9=未确定 */
                                                                 /* aduitstatus  业务单据审批状态   0=审批通过，1=审批中，3=审批未通过，4=没有配置审批流*/
   for update
