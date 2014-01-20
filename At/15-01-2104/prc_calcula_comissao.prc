create or replace procedure prc_calcula_comissao(p_nr_Ped  in   number,
                                                 p_erro    out  varchar2) is

  va_vl_base_ven    ftpedido.vl_tot_efetivo_vendedor%type;
  va_vl_base_emp    ftpedido.vl_tot_efetivo_empresa%type;
  va_cd_vendedor    ftpedido.cd_vendedor%type;
  va_cd_forn        ftpedido.cd_forn%type;
  va_pc_com_ven     gevended.comm_vend%type;
  va_pc_com_emp     gefornec.comm%type;
begin

  begin
   select a.vl_tot_efetivo_vendedor,
          a.vl_tot_efetivo_empresa,
          a.cd_vendedor,
          a.cd_forn
     into va_vl_base_ven,
          va_vl_base_emp,
          va_cd_vendedor,
          va_cd_forn
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
   select nvl(a.comm,0)
     into va_pc_com_emp
     from gefornec a
    where a.cd_forn = va_cd_forn;      
  end;   
        
  begin
   insert into ftcomven(nr_ped
                       ,vl_base_calc_vendedor
                       ,vl_base_calc_empresa
                       ,pc_com_vendedor
                       ,pc_com_empresa
                       ,vl_com_vendedor
                       ,vl_com_empresa)
                 values(p_nr_ped
                       ,va_vl_base_ven
                       ,va_vl_base_emp
                       ,va_pc_com_ven
                       ,va_pc_com_emp
                       ,round(va_vl_base_ven * (va_pc_com_ven/100),2)
                       ,round(va_vl_base_emp * (va_pc_com_emp/100),2));
  exception
   when others then
        p_erro := 'Erro inserindo FTCOMVEN'||chr(10)||sqlerrm;                                              
  end;

end prc_calcula_comissao;
/
