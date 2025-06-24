declare
    rt_product products%rowtype;
    rt_category categories%rowtype;
    rt_supplier suppliers%rowtype;

begin
    
    select * into rt_product from products 
    where product_id = 1;
    
    select * into rt_category from categories 
    where category_id = rt_product.category_id;
    
    select * into rt_supplier from suppliers 
    where supplier_id = rt_product.supplier_id;

    dbms_output.put_line('Product Name: ' || rt_product.product_name);
    dbms_output.put_line('Product Unit Price: ' || rt_product.unit_price);
    dbms_output.put_line('Category Name: ' || rt_category.category_name);
    dbms_output.put_line('Supplier Name: ' || rt_supplier.company_name);
    dbms_output.put_line('Supplier City: ' || rt_supplier.city);

end;