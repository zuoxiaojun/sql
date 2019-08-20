/*契约锁表结构关联关系*/

--文档表与文档参数表;
	
select *from DOCUMENT a left join DOCUMENT_PARAM b on a.id = b.documentId;

	
--合同与合同文档关联信息

	select a.id contractId,a.subject,a.sn ,b.businessId,b.id documentId ,b.title from CONTRACT a left join DOCUMENT b on a.id=b.businessId
	where a.id='2599462615030936284'



--公司下建立的业务流程

select a.name gs,a.id gsid , b.name ywlc ,b.id ywlid from COMPANY a left join CATEGORY b  on a.id =b.tenantId

--印章表
select a.id gsid,a.name gsmc,b.id yzid,b.name yzname,b.status from COMPANY a left join SEAL b on a.id=b.owner


--系统配置信息
SELECT * FROM SYS_CONFIG


