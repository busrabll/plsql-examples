create or replace procedure write_dml_log
(
    p_dml_type varchar2,
    p_table_name varchar2,
    p_column_name varchar2,
    p_column_old_value varchar2,
    p_column_new_value varchar2
)
is

begin

    insert into table_dml_log(dml_type, table_name, 
	column_name, column_old_value, column_new_value)
    values(p_dml_type, p_table_name, p_column_name, 
	p_column_old_value, p_column_new_value);
    
end;

create or replace trigger trg_cars
before update on cars
referencing new as new old as old
for each row

begin

    if UPDATING then

        if :new.brand <> :old.brand then
            write_dml_log('U', 'CARS', 'BRAND', :old.brand, :new.brand);
        end if;
        if :new.price <> :old.price then
            write_dml_log('U', 'CARS', 'PRICE', :old.price, :new.price);
        end if;
        if :new.discount <> :old.discount then
            write_dml_log('U', 'CARS', 'DISCOUNT', :old.discount, :new.discount);
        end if;

    end if;

end;