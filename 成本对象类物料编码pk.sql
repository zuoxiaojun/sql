--�ɱ����������ϱ���pk
select code, name, pk_material
  from bd_material_v
 where pk_marbasclass =
       (select pk_marbasclass from bd_marbasclass where code = '98')
