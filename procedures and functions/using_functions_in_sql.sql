create or replace function get_total_orders(
    p_year pls_integer
) 
return number
is
    v_total_orders number := 0;

begin
    -- get total sales
    select sum(unit_price * quantity)
        into v_total_orders
    from order_details
        inner join orders using (order_id)
    where shipped_date is not null
    group by extract(year from order_date)
    having extract(year from order_date) = p_year;
    
    return v_total_orders;
end;