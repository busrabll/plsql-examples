declare 
    v_customer_id   customers.customer_id%type; 
    v_company_name  customers.company_name%type; 
    v_order_date    orders.order_date%type; 
    v_freight       orders.freight%type; 
begin 
 
    select c.customer_id, c.company_name, o.order_date, o.freight 
        into v_customer_id, v_company_name, v_order_date, v_freight 
    from orders o, customers c 
    where order_id = 10303 
        and o.customer_id = c.customer_id; 
     
    dbms_output.put_line('Customer ID: '|| v_customer_id); 
    dbms_output.put_line('Company Name: '|| v_company_name);  
    dbms_output.put_line('Order Date: '|| v_order_date);  
    dbms_output.put_line('Order Amount: '|| v_freight);  
   
end;