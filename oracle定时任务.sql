
--������̨��ʱ����

begin
  sys.dbms_job.submit(job => :job,
                      what => 'GCLSINC.GCL_JOB_EHR_TITLE;',
                      next_date => to_date('08-03-2019 03:00:00',  'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'TRUNC(SYSDATE+1)+3/24');
  commit;
end;
/

--��ѯ��ʱ����

select * from user_jobs
