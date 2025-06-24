declare
    v_customer_id   orders.customer_id%type;
    v_order_date    orders.order_date%type;
    v_shipped_date  orders.shipped_date%type;
    v_ship_via      varchar2(50);
    v_freight       orders.freight%type;
    v_output_text   varchar2(500);
    c_new_line      char(1) := CHR(10);
    
begin

    select 
        customer_id, order_date, shipped_date, 
        decode(ship_via, 1, 'Airway', 2, 'Seaway', 3, 'Roadway'), freight
        into v_customer_id, v_order_date, v_shipped_date, v_ship_via, v_freight
    from orders 
    where order_id = 10538;
    
    v_output_text := 
        'Customer ID: '  || lower(v_customer_id) || c_new_line ||
        'Order Month: '  || to_char(v_order_date, 'Month') || c_new_line ||
        'Shiiped Date: ' || to_char(v_shipped_date, 'dd.mm.yyyy') || c_new_line ||
        'Ship Via: '     || v_ship_via || c_new_line ||
        'Order Amount: ' || to_char(round(v_freight));
        
    dbms_output.put_line(v_output_text);
end;