declare
    type student_type is table of varchar2(50)
        index by varchar2(50);

    v_students student_type;
    v_students_count pls_integer;
    v_engineers_count pls_integer := 0;
    
    v_key varchar2(50);
    
    v_name varchar2(50);
    v_course_name varchar2(50);
  
begin
    
    select count(*) 
    into v_students_count 
    from student;
    
    for i in 1..v_students_count loop
        
        select name, course_name 
        into v_name, v_course_name from student 
        where id = i;
        
        v_students(v_name) := v_course_name;
        
    end loop;

    v_key := v_students.first;
    
    while v_key is not null loop
        
        if (lower(v_students(v_key)) like '%engineer%') then
            dbms_output.put_line(v_key || ': '|| v_students(v_key));
            v_engineers_count := v_engineers_count + 1;
        end if;
        
        v_key := v_students.next(v_key);
        
    end loop;
    
    dbms_output.put_line('----------------------------------');
    dbms_output.put_line('All students count: ' || v_students.count);
    dbms_output.put_line('Engineer students count: ' || v_engineers_count);

end;
