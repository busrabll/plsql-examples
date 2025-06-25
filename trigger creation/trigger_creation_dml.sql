create or replace trigger trg_product_segment
before insert
on product_segment
declare
    v_count pls_integer;
begin

    select count(*) into v_count from product_segment;
    
    if v_count = 3 then
        raise_application_error(-20001, 'There can be a maximum of 3 segments');
    end if;
    
end;