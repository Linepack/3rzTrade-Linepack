create or replace procedure prc_calcula_comissao(p_nr_Ped     in   number,
                                                 p_vl_base    in   number,
                                                 p_pc_com_emp in   number,
                                                 p_erro       out  varchar2) is

  va_cd_vendedor    ftpedido.cd_vendedor%type;
  va_pc_com_ven     gevended.comm_vend%type;
  va_sq_com         ftcomven.sq_com%type;
begin

  begin
   select a.cd_vendedor          
     into va_cd_vendedor
     from ftpedido a
    where nr_ped = p_nr_ped;
  end;
  
  begin
   select nvl(a.comm_vend,0)
     into va_pc_com_ven
     from gevended a
    where a.cd_vendedor = va_cd_vendedor;
  end;      
  
  begin
   select nvl(max(sq_com),0) + 1
     into va_sq_com
     from ftcomven
    where nr_ped = p_nr_ped;
  end;
            
  begin
   insert into ftcomven(nr_ped
                       ,sq_com
                       ,vl_base_calc
                       ,pc_com_vendedor
                       ,pc_com_empresa
                       ,vl_com_vendedor
                       ,vl_com_empresa)
                 values(p_nr_ped
                       ,va_sq_com
                       ,p_vl_base
                       ,va_pc_com_ven
                       ,p_pc_com_emp
                       ,round(p_vl_base * (va_pc_com_ven/100),2)
                       ,round(p_vl_base * (p_pc_com_emp/100),2));
  exception
   when others then
        p_erro := 'Erro inserindo FTCOMVEN'||chr(10)||sqlerrm;                                              
  end;
  
  begin
   update ftpedido
      set vl_tot_efetivo = nvl(vl_tot_efetivo,0) + p_vl_base
    where nr_ped = p_nr_ped;
  end;

end prc_calcula_comissao;
/
