create table gecrm(
 sq_crm       number(6),
 dt_hr        date not null,    
 dt_retorno   date not null,
 cd_cliente   number(4) not null,
 cd_vendedor  number(4) not null,
 ds_crm       varchar2(4000) not null);
 
create public synonym gecrm for gecrm;

alter table gecrm 
  add constraint pk_gecrm primary key (sq_crm)
     using index;
     
alter table gecrm 
  add constraint fk_gecrm_geclient foreign key (cd_cliente)
      references geclient;
      
create index fk_gecrm_geclient_ix on gecrm(cd_cliente);

alter table gecrm 
  add constraint fk_gecrm_gevended foreign key (cd_vendedor)       
      references gevended;
      
create index fk_gecrm_gevended_ix on gecrm(cd_vendedor);      


