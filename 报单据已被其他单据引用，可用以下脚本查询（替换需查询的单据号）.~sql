--报单据已被其他单据引用，可用以下脚本查询（替换需查询的单据号）
select pk_flow,vbillcode from ic_flow where vsourcebillcode = '80501FR20181123001'
union 
select pk_flow,vbillcode from ic_flowaccount_his where vsourcebillcode = '80501FR20181123001';
