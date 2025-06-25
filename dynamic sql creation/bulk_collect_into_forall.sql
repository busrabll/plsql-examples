--alter table order_details add last_price number;
--alter table order_details add order_details_id number;
--update order_details set order_details_id=rownum;

declare
  cursor crs_order_details is
     select * from order_details;

    type t_order_details is table of crs_order_details%rowtype;
    v_order_details t_order_details;
    
    v_time_start number;
    v_time_end number;
    
begin  
   
    v_time_start := DBMS_UTILITY.get_time;
    
    for order_detail_row in crs_order_details loop
        update order_details set last_price = round(unit_price*quantity*(100-discount)/100,2)
        where order_details_id = order_detail_row.order_details_id;  
    end loop;
    
    v_time_end := DBMS_UTILITY.get_time;
    dbms_output.put_line('For loop inserts: ' || (v_time_end - v_time_start));
    
    v_time_start := DBMS_UTILITY.get_time;
    open crs_order_details;

        fetch crs_order_details
            bulk collect into v_order_details;

        forall i in v_order_details.first..v_order_details.last
            update order_details set last_price = round(unit_price*quantity*(100-discount)/100,2)
            where order_details_id = v_order_details(i).order_details_id;

    close crs_order_details;
    v_time_end := DBMS_UTILITY.get_time;
    dbms_output.put_line('Forall inserts: ' || (v_time_end - v_time_start));
   
   commit;
   
end;