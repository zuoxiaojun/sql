--���۶�������״̬ת��
select vbillcode,
       case so_saleorder.fstatusflag
         when 1 then
          '����'
         when 2 then
          '����ͨ��'
         when 3 then
          '����'
         when 4 then
          '�ر�'
         when 7 then
          '������'
         when 8 then
          '������ͨ��'
         else
          'ʧЧ'
       end
  from so_saleorder
  
  select vbillcode,
       decode(fstatusflag,
              1,
              '����',
              2,
              '����ͨ��',
              3,
              '����',
              4,
              '�ر�',
              7,
              '������',
              8,
              '������ͨ��',
              'ʧЧ') fstatusflag
  from so_saleorder

  
  
  select  distinct(fstatusflag) from so_saleorder
