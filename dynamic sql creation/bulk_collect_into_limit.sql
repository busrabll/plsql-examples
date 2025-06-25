declare
    cursor crs_stock is
        select product_name, company_name, 
            sum(units_in_stock) stock_amount
        from products p, suppliers s
        where p.supplier_id = s.supplier_id
        group by product_name, company_name
        order by 3 desc;

    type t_stock is table of crs_stock%rowtype;
    v_stock_info t_stock;
    
begin  
    
    open crs_stock;

        fetch crs_stock
            bulk collect into v_stock_info limit 10;

        for i in 1 ..v_stock_info.count
        loop
            dbms_output.put_line('[Product Name:' || v_stock_info(i).product_name ||
                                 '] [Sup. Comp. Name:' || v_stock_info(i).company_name ||
                                 '] [Stock Amunt:' || v_stock_info(i).stock_amount ||']');
        end loop;

   close crs_stock;
   
end;