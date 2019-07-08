
/*产成品与总账对账不平处理
原因是产成品的单据明细实体金额存了8位小数，总账凭证与前台记录都是2位小数，接口传数问题
*/

--创建对账不平的单据记录表
create table dzbp (
vbillcode varchar(255));



select * from dzbp

--更新存货明细实体金额为2位小数
update ia_detailledger
   set nmny = round(nmny, 2)
 where vbillcode in (select vbillcode from dzbp)
