/*
bd_bankdoc ���е����� ��code����  name��������               
bd_asslinenum����������Ϣ��code �������к�    name������������  

��������bd_bankdoc ���е�������code=����������Ϣ���е��������к�  
������   bd_bankdoc���е� name�������ƺ�bd_asslinenum������һ��

*/

select code,name from bd_bankdoc where name='�����˻�';

select code,name from bd_asslinenum where name='�����˻�';

merge into bd_bankdoc a
using bd_asslinenum b
on (a.name = b.name)
when matched then
  update set a.code = b.code
  where a.code<>b.code 
 --where a.code = '001auto1tpm4kua'
