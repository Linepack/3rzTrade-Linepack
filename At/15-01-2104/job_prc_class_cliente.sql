begin
  sys.dbms_job.submit(job => :job,
                      what => 'begin
                                 prc_class_cliente;
                                 commit;
                               end;',
                      next_date => to_date('09-02-2014 14:38:02', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate+30');
  commit;
end;
