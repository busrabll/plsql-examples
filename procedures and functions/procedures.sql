create or replace procedure top_ten_orders(p_ship_via number)
is
    cursor c_order_info is
        select * from
        (
            select first_name, last_name, freight 
            from orders o, employees e
            where o.ship_via = p_ship_via
                and o.employee_id = e.employee_id
            order by freight desc
        )
        where rownum < 11;
    
begin
    
    for v_order_info in c_order_info loop
        
        dbms_output.put_line(v_order_info.first_name || ' ' || 
            v_order_info.last_name || ': ' || 
            v_order_info.freight);

    end loop;
    
end;