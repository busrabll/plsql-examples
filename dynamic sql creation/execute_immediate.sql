declare
    v_sql varchar2(500) := 'select fruit_a from basket_a where id_a = :b1';
    v_fruit varchar2(25);

begin
    
    for i in 1..5 loop
    
        execute immediate v_sql into v_fruit using i;
        dbms_output.put_line(v_fruit);
    
    end loop;

end;