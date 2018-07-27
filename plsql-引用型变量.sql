declare
  v_code bd_psndoc.code%type;
  v_name bd_psndoc.name%type;
  v_id   bd_psndoc.id%type;
begin
  select code, name, id
    into v_code, v_name, v_id
    from bd_psndoc
   where code = 'at0042';
  dbms_output.put_line(v_code || 'µÄÃû×ÖÊÇ' || 'v_name');
end;
  
  
  
  select code,name,joinworkdate,id   from bd_psndoc
