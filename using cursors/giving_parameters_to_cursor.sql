declare
    cursor c_student (cv_course_name varchar2) is
        select name, gender from student
        where course_name = cv_course_name;  
begin

    dbms_output.put_line('------Computer Engineer------');

    for v_stud_record in c_student('Computer Engineer') loop
        
        dbms_output.put_line(v_stud_record.name ||', Gender: '||
                             v_stud_record.gender);
        if c_student%rowcount > 2 then exit; end if;
        
    end loop;

    dbms_output.put_line('');
    dbms_output.put_line('------Computer Science-----');

    for v_stud_record in c_student('Computer Science') loop
        
        dbms_output.put_line(v_stud_record.name ||', Gender: '||
                             v_stud_record.gender);
        if c_student%rowcount > 2 then exit; end if;
        
    end loop;
    
end;