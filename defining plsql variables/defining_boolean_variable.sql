declare
    v_hedef integer := 90;
    v_hedef_sonucu boolean := false;
    v_count smallint;
begin

    select count(*) into v_count from customers;
    
    if v_count > v_hedef then 
        v_hedef_sonucu := true;
    end if;
    
    if v_hedef_sonucu then
        dbms_output.put_line('Müşteri hedefine ulaşıldı');
    else 
        dbms_output.put_line('Müşteri hedefine ulaşılamadı');
    end if;
  
end;