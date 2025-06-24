declare
    v_car_name varchar2(50) := 'Ferrari';
    v_mesaj varchar2(100);
begin

      
    select brand || ' is found in the table' into v_mesaj
    from cars where brand = v_car_name;

    dbms_output.put_line(v_mesaj);
    
    exception 
        when NO_DATA_FOUND then
            dbms_output.put_line(v_car_name || ' is not found');

end;
/