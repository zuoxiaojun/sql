/*����˵��:ģ���ϵĹ�ʽһ����ڣ�pub_billtemplet_b���ű���,loadformula�ֶ�Ϊ��ʾ��ʽ,
editformulaΪ�༭��ʽ,validateformulaΪ��֤��ʽ,һ���������ͨ��ģ�������ҵ�ģ��

select * from pub_billtemplet where bill_templetcaption='Ա��ά��'

Ȼ�����pk_billtemplet�ҵ�ģ��������ֶ�
select * from pub_billtemplet_b where pk_billtemplet='1001Z71000000000QJAL'*/

select PK_BILLTEMPLET, BILL_TEMPLETCAPTION, PK_BILLTYPECODE
  from pub_billtemplet
 where bill_templetcaption like '%ͨ�÷���%' --1001Z31000000000DDNW

select ITEMKEY �ֶ�����,
       DEFAULTSHOWNAME ��ʾ����,
       loadformula ��ʾ��ʽ,
       editformula �༭��ʽ,
       validateformula ��֤��ʽ
  from pub_billtemplet_b
 where pk_billtemplet = '1001B110000000011QED'

select * from pub_billtemplet_b where pk_billtemplet = '1001A110000000004CEJ'
