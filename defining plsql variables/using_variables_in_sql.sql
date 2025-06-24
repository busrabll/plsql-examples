declare
    v_name varchar2(50);
    v_title varchar2(150);
    v_title_of_courtesy varchar2(50);   
begin

    select e.first_name || ' ' || e.last_name, e.title, e.title_of_courtesy 
        into v_name, v_title, v_title_of_courtesy
    from employees e
    where e.employee_id = 7;
    
    dbms_output.put_line(v_title_of_courtesy || ' ' || v_name||', '||v_title); 
  
end;