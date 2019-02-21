INSERT INTO bd_defdoc (
code, --编码
name ,--名称
creator ,--创建人 可默认
creationtime ,--创建时间
dataoriginflag ,--默认0
datatype ,--1
enablestate ,--2
pk_defdoc, --自定义档案pk 20位 需生成
pk_defdoclist ,--自定义档案列表主键 默认 1001XX1000000001ZUM9
 pk_group ,--0001W210000000000A1O
  pk_org   --0001W210000000000A1O
)
VALUES
	(
	2,
	'采购类别',
	'1001XX1000000001Z8TS',
	'2019-02-21 13:40:41',
	0,
	1,
	2,
	'12345678901234567891',
	'1001XX1000000001ZUM9',
	'0001W210000000000A1O',
	'0001W210000000000A1O'
	);