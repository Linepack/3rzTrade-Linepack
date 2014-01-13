create or replace procedure prc_class_cliente is
 cursor c1 is
   select cd_cliente
     from geclient a
    order by 1;

  vl_venda_Mes     number(14,4);
  va_classificacao char(1);
begin
  for reg in c1 loop

      select sum(b.qt_ped * b.vl_unitario)
        into vl_venda_Mes
        from ftpedido a,
             ftiteped b
       where a.nr_ped = b.nr_ped
         and a.cd_cliente = reg.cd_cliente
         and trunc(a.dt_ped,'mm') = trunc(sysdate,'mm') - 1;

       if vl_venda_mes < 500 then
          va_classificacao := 'B';
       elsif vl_venda_mes  < 1000 then
          va_classificacao := 'P';
       elsif vl_venda_mes > 1000 then
          va_classificacao := 'O';
       end if;

       update geclient
          set st_classificacao = va_classificacao
        where cd_cliente = reg.cd_cliente;

  end loop;
end;
/
