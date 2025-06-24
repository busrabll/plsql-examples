declare
    type cars_type is record
    (
        brand varchar2(30),
        price number,
        discount number
    );
    
    type cars_table_type is table of cars_type
        index by pls_integer; 
        
    v_cars_info cars_table_type;
    v_cars_count pls_integer;
begin

    select count(*) into v_cars_count from cars;
    
    for i in 1..v_cars_count loop
        select brand, price, discount 
        into v_cars_info(i) from cars 
        where id = i;
    end loop;
    
    for i in 1..v_cars_count loop
        dbms_output.put_line('Brand : ' || v_cars_info(i).brand
            || ', Price : ' || v_cars_info(i).price
            || ', Discount : ' || nvl(v_cars_info(i).discount,0));
    end loop;
end;