/*���ϱ���ǰ���ϣ�����棩*/
--����������ݱ�fcwl

update bd_material
   set name = '������棩' || name 
 where code in
       (select code
          from fcwl
        minus (select code from bd_material where name like '������棩%'))--�ų�ԭ�д�����ǵ�


update bd_material_v
   set name = '������棩' || name
 where code in (select code from bd_material where name like '%�����%')--�������ϰ汾

