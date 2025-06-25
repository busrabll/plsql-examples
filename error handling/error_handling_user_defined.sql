declare
    v_budget number := 15000;
    v_car_brand varchar2(50) := 'Peugeot';
    v_car_price number;
    e_price_exceed exception;
    
begin

    select price into v_car_price from cars
    where brand = v_car_brand;
    
    if v_car_price > v_budget then 
        raise e_price_exceed;
    else
        dbms_output.put_line('Tebrikler');
    end if;

    --Kredi işlemleri...
    
    exception 
        when e_price_exceed then
            dbms_output.put_line('Bu arabanın fiyatı bütçenizi aşıyor');
end;