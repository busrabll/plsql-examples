    v_tarih date;
    v_sayac pls_integer := 0;
begin

    v_tarih := to_date('02.01.2024', 'dd.mm.yyyy');
    
    while v_sayac < 10 loop

        if v_tarih != to_date('23.04.2024','dd.mm.yyyy') then
            
            v_sayac := v_sayac + 1;
            dbms_output.put_line(v_sayac || '. Toplantı: ' || 
                to_char(v_tarih, 'dd.mm.yyyy'));
        
        end if;

        v_tarih := v_tarih + 14;
        --exit when v_sayac = 10;

    end loop;
    
end;