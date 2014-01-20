alter table geclient
  add cd_seguimento number(6);
  
alter table geclient  
 add constraint fk_geclient_gesegmen foreign key (cd_seguimento)
     references gesegmen;
     
create index fk_geclient_gesegmen_ix on geclient(cd_seguimento);  

alter table geclient
  add st_classificacao  char(1);

alter table geclient
  add constraint ck_st_classificacao check(st_classificacao in ('O','P','B')) ;
  
comment on column geclient.st_classificacao is 'O = OURO, P = PRATA, B = BRONZE';   