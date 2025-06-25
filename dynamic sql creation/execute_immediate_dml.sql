declare
    type cars_type is table of varchar2(30);
    
    v_car_brand cars_type := cars_type('Bugatti', 'McLaren', 'Lamborghini');
    v_car_price cars_type := cars_type('200000', '250000', '300000');
    
    v_sql varchar2(100) := 'insert into cars(id, brand, price) values(:b1, :b2, :b3)';
    v_max_id pls_integer;
    
begin
    
    select max(id) into v_max_id from cars;
    
    for i in v_car_brand.first..v_car_brand.last loop
    
        execute immediate v_sql using v_max_id + i, v_car_brand(i), to_number(v_car_price(i));
    
    end loop;
end;