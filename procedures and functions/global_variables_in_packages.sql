create or replace procedure write_student_info(p_dir varchar2, p_file_name varchar2)
is
    filex utl_file.file_type;
     
begin
            
    filex := utl_file.fopen(p_dir, p_file_name, 'W');
    
    for std_row in (select * from student) loop
        
        utl_file.put_line(filex, 
            'Name: ' || std_row.name || 
            ', Course: ' || std_row.course_name ||
            ', Class: ' || std_row.class_no);

    end loop;
    
    utl_file.fclose(filex);
    
end;

exec write_student_info('EGITIM_DIR', 'student_info.txt');