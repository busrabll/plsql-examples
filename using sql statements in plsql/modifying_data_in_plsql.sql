declare
    v_max_id smallint;
    v_new_id smallint;
    v_brand varchar2(10) := 'Opel';
    v_price smallint := 12000;
    v_discount smallint;

begin
    
    select max(id) into v_max_id from cars;
    
    insert into cars values(v_max_id + 1, v_brand, v_price, null)
    returning id into v_new_id;
    
    v_discount := v_price * 0.05;
    
    update cars set discount = v_discount where id = v_new_id;
    
    dbms_output.put_line('ID: '|| v_new_id || ', Brand: ' || 
        v_brand ||', Price: '  || v_price  || ', Discount: ' || v_discount);
    
    delete from cars where id = v_new_id;
end;
/