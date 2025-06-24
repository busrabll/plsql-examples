declare
     
    type v_colors_type is table of varchar2(50);
    v_colors v_colors_type;
    
    v_color varchar2(50);
begin

    v_colors := v_colors_type('Blue', 'Dark Green', 'Yellow');
    
    for i in v_colors.first..v_colors.last 
    loop
        
        begin          
            select color || ' is found in the table' into v_color
            from colors where color = v_colors(i);
    
            dbms_output.put_line(v_color);
            
            exception 
                when NO_DATA_FOUND then
                    dbms_output.put_line(v_colors(i) || ' is not found');

        end;
    end loop;
        
end;
/
