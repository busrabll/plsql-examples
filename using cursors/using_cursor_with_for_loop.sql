declare
    cursor c_product is
        select segment as segment_name, 
            count(*) product_count,
            sum(price) sum_price
        from product p, product_segment ps
        where p.segment_id = ps.id
        group by segment;
     
begin

    for v_product in c_product loop
        
        dbms_output.put_line(
            v_product.segment_name ||': Count: '||
            v_product.product_count || ', Sum Price: '||
            v_product.sum_price);
    end loop;
     
end;