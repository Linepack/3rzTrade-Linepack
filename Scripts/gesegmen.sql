create table gesegmen(
 cd_seguimento   number(5),
 ds_seguimento   varchar2(100) not null);
 
create public synonym gesegmen for gesegmen;

alter table gesegmen
  add constraint pk_gesegmen primary key (cd_seguimento)
      using index;
