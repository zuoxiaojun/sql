/*契约锁表结构关联关系*/

--文档表与文档参数表;
	
select *from DOCUMENT a left join DOCUMENT_PARAM b on a.id = b.documentId;

	
--合同与合同文档关联信息

	select a.id contractId,a.subject,a.sn ,a.status,businessId,b.id documentId ,b.title from CONTRACT a left join DOCUMENT b on a.id=b.businessId
	where a.id='2601699711495307300'



--公司下建立的业务流程

select a.name gs,a.id gsid , b.name ywlc ,b.id ywlid from COMPANY a left join CATEGORY b  on a.id =b.tenantId

--印章表
select a.id gsid,a.name gsmc,b.id yzid,b.name yzname,b.status from COMPANY a left join SEAL b on a.id=b.owner


--系统配置信息
SELECT * FROM SYS_CONFIG


-- 合同与签署方信息关联表
select
	a.id,
	a.`subject`,
	a.sn,
	a.`status`,
	b.serialNo,
	b.tenantName,
	b.receiverName,
	b.`status` qszt 
from
	contract a
	left join signatory b on a.id = b.contractId

-- 查看已实名认证的用户
select * from user_auth where authStep='PASSED';




