create table ftcomven(
  nr_ped                  number(5),
  vl_base_calc_vendedor   number(12,2) not null,
  vl_base_calc_empresa    number(12,2) not null,
  pc_com_vendedor         number(5,2) not null,
  pc_com_empresa          number(5,2) not null,
  vl_com_vendedor         number(12,2) not null,
  vl_com_empresa          number(12,2));
  
alter table ftcomven
  add constraint fk_ftcomven_ftpedido foreign key (nr_ped)
      references ftpedido;  
      
alter table ftcomven 
  add constraint pk_ftcomven primary key (nr_ped)
      using index;
      
create public synonym ftcomven for ftcomven;            


