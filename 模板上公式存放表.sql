/*����˵��:ģ���ϵĹ�ʽһ����ڣ�pub_billtemplet_b���ű���,loadformula�ֶ�Ϊ��ʾ��ʽ,
editformulaΪ�༭��ʽ,validateformulaΪ��֤��ʽ,һ���������ͨ��ģ�������ҵ�ģ��

select * from pub_billtemplet where bill_templetcaption='Ա��ά��'

Ȼ�����pk_billtemplet�ҵ�ģ��������ֶ�
select * from pub_billtemplet_b where pk_billtemplet='1001Z71000000000QJAL'*/

select PK_BILLTEMPLET, BILL_TEMPLETCAPTION, PK_BILLTYPECODE
  from pub_billtemplet
 where bill_templetcaption like '%���÷ѱ���%'--1001A110000000004CEJ

select ITEMKEY �ֶ�����,
       DEFAULTSHOWNAME,
       loadformula ��ʾ��ʽ,
       editformula �༭��ʽ,
       validateformula ��֤��ʽ
  from pub_billtemplet_b
 where pk_billtemplet = '1001A110000000004CEJ'

select * from pub_billtemplet_b where pk_billtemplet = '1001A110000000004CEJ'
