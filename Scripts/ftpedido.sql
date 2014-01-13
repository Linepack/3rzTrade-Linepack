alter table ftpedido
  add vl_tot_efetivo_vendedor number(12,2);
    
alter table ftpedido
  add vl_tot_efetivo_empresa number(12,2);  
  
alter table ftpedido  
  add dt_base_efetivacao  date;