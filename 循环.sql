--����ѭ��
declare
  v_cnt int := 1;
begin
  loop
    dbms_output.put_line(v_cnt);
    exit when v_cnt = 10;
    v_cnt := v_cnt + 1;
  end loop;
end;

--while ѭ��

declare
  v_cnt int := 1;
begin
  while v_cnt <= 10 loop
    dbms_output.put_line(v_cnt);
    v_cnt := v_cnt + 1;
  end loop;
end;

--for ѭ��

begin
  for i in 1..10 loop
    dbms_output.put_line(i);
  end loop;
end;
