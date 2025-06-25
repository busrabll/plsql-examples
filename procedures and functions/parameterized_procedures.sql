create or replace function get_manager (p_emp_id number)
return varchar2
result_cache
is
    v_manager_name varchar2(100);

begin

    select first_name || ' ' || last_name 
        into v_manager_name
    from employees
    where employee_id = p_emp_id;
    
    return v_manager_name;

end;