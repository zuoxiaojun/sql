select count( *)  from bd_materialconvert where isstockmeasdoc='N';


--�������ϸ�����Ĭ��

update bd_materialconvert
   set ispumeasdoc    = 'Y',--�ɹ�Ĭ�ϵ�λ
       isprodmeasdoc  = 'Y',--����Ĭ�ϵ�λ
       isstockmeasdoc = 'Y',--���Ĭ�ϵ�λ
       issalemeasdoc  = 'Y'--����Ĭ�ϵ�λ
 where ispumeasdoc = 'N';
 
 
 
 
