alter table ftpedido
  drop column vl_tot_efetivo_vendedor;
  
alter table ftpedido
  rename column vl_tot_efetivo_empresa to vl_tot_efetivo;
  
alter table ftpedido 
  add vl_tot number(12,2);