create or replace procedure read_student_info(p_dir varchar2, p_file_name varchar2)
is
    filex utl_file.file_type;
    row_text varchar2(300);
    row_count pls_integer := 0;
    sci_count pls_integer := 0;
begin       
    
    if not utl_file.is_open(filex) then
        filex := utl_file.fopen(p_dir, p_file_name, 'R');
        
        begin 
            loop
                utl_file.get_line(filex, row_text);
                
                if instr(lower(row_text), 'science') > 0 then
                    dbms_output.put_line(row_count || '. ' || row_text); 
                    sci_count := sci_count + 1;
                end if;
                
                row_count := row_count + 1;
                
            end loop;
            
            exception 
                when no_data_found then
                    dbms_output.put_line('--- End of file ---');
                 
        end;
        dbms_output.put_line('Sum of rows: '|| row_count);
        dbms_output.put_line('Sum of science: '|| sci_count); 
        utl_file.fclose(filex);
        
    end if;
    
    exception
    when utl_file.invalid_operation then
        dbms_output.put_line('File not found');
end;