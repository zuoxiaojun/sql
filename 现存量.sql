SELECT
    A .pk_org,--�����֯
    A .cwarehouseid ,--�ֿ�
    A.cmaterialoid,--����
    B.nonhandastnum,--�������
    B.nonhandnum --���������  
FROM
    ic_onhanddim A
LEFT JOIN ic_onhandnum B ON A .pk_onhanddim = B.pk_onhanddim
where A.pk_org=(select pk_org from org_stockorg where name ='����Э�μ��ɿƼ����޹�˾')
and A.cmaterialoid=(select pk_material from bd_material where code ='0105030053')
