create or replace trigger trg_cars
before insert or update on cars
referencing new as new old as old
for each row

begin

    if INSERTING or UPDATING then
        
        if :new.price not between 10000 and 2000000 then
        
            raise_application_error(-20001, 'Price is out of limits');
        
        end if;
        
        if :new.discount is null then
        
            raise_application_error(-20002, 'Discount can not be null');
        
        end if;
        
    end if;

end;