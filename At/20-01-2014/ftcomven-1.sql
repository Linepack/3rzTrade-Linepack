alter table ftcomven
 drop constraint pk_ftcomven;
 
alter table ftcomven
  drop column vl_base_calc_vendedor;
      
alter table ftcomven 
  rename column vl_base_calc_empresa to vl_base_calc;   
    
alter table ftcomven
  add sq_com number(2);
  

update ftcomven
   set sq_com = 1;

alter table ftcomven 
  add constraint pk_ftcomven primary key (nr_ped,sq_com)
      using index;  
      
      