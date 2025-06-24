declare
    cursor c_emp is
        select 
            title_of_courtesy || ' ' || 
            first_name        || ' ' || 
            last_name         || ' ' || 
            birth_date as emp_info
        from employees e;
    
    v_emp_info varchar(500);
    
begin

    open c_emp;
    
    loop
        fetch c_emp into v_emp_info;
        exit when c_emp%notfound;
        
        dbms_output.put_line(v_emp_info);
        
    end loop;
     
end;