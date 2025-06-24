declare
    v_date1 date := to_date('19.04.2024','dd.mm.yyyy');
    v_date2 date := to_date('20.05.2024','dd.mm.yyyy');
    v_control boolean := true;
    v_holiday_control smallint;
begin
    
    while v_control loop
        
        v_date1 := v_date1 + 1;
        
        if to_char(v_date1,'d') not in (6,7) then
        
            select count(*) into v_holiday_control
            from holidays
            where holiday_day = to_char(v_date1,'dd')
                and holiday_month = to_char(v_date1,'mm');
            
            if v_holiday_control = 0 then    
                dbms_output.put_line('Çalışma günü: ' || v_date1);
            else 
                dbms_output.put_line('Resmi tatil: ' || v_date1);
                continue;
            end if;
        else
            dbms_output.put_line('Hafta sonu: ' || v_date1);
            continue;
        end if;
        
        if v_date1 = v_date2 then
            v_control := false;
        end if;

    end loop;
end;