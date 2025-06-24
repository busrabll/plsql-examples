
declare
    type type_order_info is record
        (
            first_name    employees.first_name%type,
            last_name     employees.last_name%type,
            order_count   number,
            order_sum     number
        );
    
    v_order_info type_order_info;
      
begin

    select e.first_name, e.last_name, 
        count(*) order_count,
        sum(freight) order_sum
        into v_order_info
    from employees e, orders o
    where e.employee_id = 3
        and o.employee_id = e.employee_id
    group by e.first_name, e.last_name;       

    dbms_output.put_line('First name: '|| v_order_info.first_name); 
    dbms_output.put_line('Last name: '|| v_order_info.last_name); 
    dbms_output.put_line('Order count: '|| v_order_info.order_count); 
    dbms_output.put_line('Order sum: '|| v_order_info.order_sum); 
end;