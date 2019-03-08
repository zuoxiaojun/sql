/*
bd_bankdoc 银行档案表 中code编码  name银行名称               
bd_asslinenum人行联行信息表，code 人行联行号    name人行联行名称  

更新数据bd_bankdoc 银行档案表中code=人行联行信息表中的人行联行号  
条件是   bd_bankdoc表中的 name银行名称和bd_asslinenum中名称一致

*/

select code,name from bd_bankdoc where name='虚拟账户';

select code,name from bd_asslinenum where name='虚拟账户';

merge into bd_bankdoc a
using bd_asslinenum b
on (a.name = b.name)
when matched then
  update set a.code = b.code 
 --where a.code = '001auto1tpm4kua'
