select  * from so_saleinvoice_b where nnum='4985.99998' and dr=0;

update so_saleinvoice_b
   set nnum         = '4986.00000', --������
       nastnum      = '1645380.00000', --����
       norigmny     = '506283.43', --��˰���
       norigtaxmny  = '506283.43', --��˰�ϼ�
       nqtunitnum   = '1645380.00000', --��������
       ncaltaxmny   = '3341976.92', --��˰���
       nmny         = '3341976.92', --������˰���
       ntaxmny      = '3341976.92', --���Ҽ�˰�ϼ�
       ngroupmny    = '3341976.92', --���ű�����˰���
       ngrouptaxmny = '3341976.92' --���ű��Ҽ�˰�ϼ�   
 where nnum = '4985.99998'
   and dr = 0;                                                       --��Ʊ����
   
   
update so_saleinvoice
   set ntotalastnum  = '5079360', --������
       ntotalorigmny = '1560915.95'--��˰�ϼ�
 where vbillcode = 'PAN INDIA-5MW' and dr=0   
