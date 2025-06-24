declare
    type customer_info_type is record
    (
        customer_id customers.customer_id%type,
        company_name customers.company_name%type,
        city customers.city%type
    ); 
    v_customer_info customer_info_type;
    
    type customers_type is varray(5) 
        of customer_info_type;
    
    v_customers customers_type := customers_type();

    type t_customerid_type is varray(3) of varchar2(20);
    v_customer_ids t_customerid_type  := t_customerid_type('BERGS','CACTU','TOMSP');

begin

    for i in v_customer_ids.first..v_customer_ids.last loop
        
        select customer_id, company_name, city into v_customer_info
        from customers
        where customer_id = v_customer_ids(i);
        
        v_customers.extend;
        v_customers(v_customers.last).customer_id := v_customer_info.customer_id;
        v_customers(v_customers.last).company_name := v_customer_info.company_name;
        v_customers(v_customers.last).city := v_customer_info.city;

    end loop;

    -- show all customers
    for j in v_customers.first..v_customers.last loop
        dbms_output.put_line(
            'Customer id: ' || v_customers(j).customer_id ||
            ', Comapny name: ' || v_customers(j).company_name ||
            ', City: ' || v_customers(j).city
        );
    end loop;

end;