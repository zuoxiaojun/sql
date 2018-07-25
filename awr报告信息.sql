select * from dba_hist_wr_control;

--修改awr报告参数
begin 
  dbms_workload_repository.modify_snapshot_settings(interval=>60,retention => 10*24*60);
  end;
/
