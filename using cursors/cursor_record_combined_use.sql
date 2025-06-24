DECLARE
    CURSOR c_cars IS
    SELECT
        brand, price, nvl(discount, 0) AS discount,
        price - nvl(discount, 0) AS net_price
    FROM cars;

    v_car_record   c_cars%rowtype;
    v_sum_price    NUMBER := 0;
    v_sum_discount NUMBER := 0;
BEGIN
    OPEN c_cars;
    LOOP
        FETCH c_cars INTO v_car_record;
        EXIT WHEN c_cars%notfound;
        
        v_sum_price := v_sum_price + v_car_record.price;
        v_sum_discount := v_sum_discount + v_car_record.discount;
        
        dbms_output.put_line(v_car_record.brand
                             || ', Price: '
                             || v_car_record.price
                             || ', Discount: '
                             || v_car_record.discount
                             || ', Net Price: '
                             || v_car_record.net_price);

    END LOOP;

    CLOSE c_cars;
    dbms_output.put_line('Sum price is: ' || v_sum_price);
    dbms_output.put_line('Sum discount is: ' || v_sum_discount);
    
END;