/*根据脚本找到凭证被哪引用了，再决定如何处理，注意替换参数
方案说明:*/
select explanation, pk_voucher
from gl_voucher a,org_accountingbook b
where a.pk_accountingbook=b.pk_accountingbook
and a.num = 7
and b.name='有限公司-基准账簿'
and a.period = '11'
and a.year='2014'
--查询的主键替换掉下面的sql中的10028K10000000036YXM就可以知道被什么引用了

select '会计平台-目标系统' || a.des_system || '-单据类型' || a.des_billtype as descname,
a.src_relationid as srcid
from fip_operatinglog a
where a.src_relationid in
(select t.pk_detail
from gl_detail t
where t.pk_voucher = '10028K10000000036YXM')
union
select '协同' as descname, pk_detailself as srcid
from gl_reconoccursub t
where t.pk_detailself in
(select t.pk_detail
from gl_detail t
where t.pk_voucher = '10028K10000000036YXM')
or t.pk_detailother in
(select t.pk_detail
from gl_detail t
where t.pk_voucher = '10028K10000000036YXM')
union
select '核销' as descname, pk_detail as srcid
from gl_verify_log t
where t.pk_detail in
(select t.pk_detail
from gl_detail t
where t.pk_voucher = '10028K10000000036YXM')
union
select '内部交易对账' as descname, pk_detail as srcid
from gl_contrastdata
where iscontrasted = 'Y'
and pk_detail in
(select t.pk_detail
from gl_detail t
where t.pk_voucher = '10028K10000000036YXM')
union
select '现金' as descname, fk_detail as srcid
from gl_contrast
where fk_detail in
(select t.pk_detail
from gl_detail t
where t.pk_voucher = '10028K10000000036YXM');
XM');
