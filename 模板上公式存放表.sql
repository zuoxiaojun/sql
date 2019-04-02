/*方案说明:模板上的公式一般放在，pub_billtemplet_b这张表上,loadformula字段为显示公式,
editformula为编辑公式,validateformula为验证公式,一般情况可以通过模板名称找到模板

select * from pub_billtemplet where bill_templetcaption='员工维护'

然后根据pk_billtemplet找到模板的所有字段
select * from pub_billtemplet_b where pk_billtemplet='1001Z71000000000QJAL'*/

select PK_BILLTEMPLET, BILL_TEMPLETCAPTION, PK_BILLTYPECODE
  from pub_billtemplet
 where bill_templetcaption like '%差旅费报销%'--1001A110000000004CEJ

select ITEMKEY 字段名称,
       DEFAULTSHOWNAME,
       loadformula 显示公式,
       editformula 编辑公式,
       validateformula 验证公式
  from pub_billtemplet_b
 where pk_billtemplet = '1001A110000000004CEJ'

select * from pub_billtemplet_b where pk_billtemplet = '1001A110000000004CEJ'
