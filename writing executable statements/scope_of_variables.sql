declare
    v_net_price smallint;
    v_brand varchar2(20) := &brand;
begin

    declare
       v_price smallint; 
       v_discount smallint;   
    begin
        select price, discount into v_price, v_discount
        from cars
        where brand = v_brand;
        
        v_net_price := v_price - v_discount;        
    end;
    
     dbms_output.put_line(v_brand ||'''s net price is: '|| v_net_price);
end;
/