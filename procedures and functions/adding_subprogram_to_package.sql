create or replace package pck_order_report as

procedure find_good_companys;

end pck_order_report;

/

create or replace package body pck_order_report as

    --global değişkenler tanımlanıyor
    vgb_category_id pls_integer;
    type tgb_order_id_type is varray(3) of integer; 
    vgb_order_ids tgb_order_id_type := tgb_order_id_type(null, null, null);

procedure find_max_category
is
begin

    --stock ücreti en büyük miktara 
    --sahip kategori tespit ediliyor
    select category_id into vgb_category_id from 
    (
        select category_id, 
            unit_price*units_in_stock as stock_price
        from products
        order by 2 desc
    )
    where rownum = 1;
    dbms_output.put_line('Category id: '||vgb_category_id);

end;

procedure find_orders
is
    --Yukarıda bulunan kategorideki en yüksek satış miktarlı 
    --ilk 3 sipariş bulunuyor
    cursor crs_orders is
        select rownum, order_id from
        (
            select order_id, unit_price*quantity 
            from order_details od
            where od.product_id in 
                (
                    select product_id from products p 
                    where category_id = vgb_category_id
                )
            order by 2 desc
        )
        where rownum < 4;
begin

    --Bulunan her bir sipariş id değeri, global 
    --bir varray dizisinin bir elemanına atanıyor
    for crs_row in crs_orders loop
        vgb_order_ids(crs_row.rownum) := crs_row.order_id;
        dbms_output.put_line('Order id: '||crs_row.order_id);
    end loop;

end;

procedure find_companys
is
    --Bulunan herbir siparişi veren şirketler bulunuyor
    --parametreli cursor kullanılıyor
    cursor crs_company(v_order_id integer) is
        select company_name from customers c
        where customer_id in
        (
            select customer_id from orders
            where order_id = v_order_id
        );
begin

    for i in 1..vgb_order_ids.count loop
    
        --Her bir sipariş id, cusror'e parametre olarak gönderiliyor
        for crs_row in crs_company(vgb_order_ids(i)) loop
            
            dbms_output.put_line('Company name: '|| crs_row.company_name);
            
        end loop;
    
    end loop;
    
end;

procedure find_good_companys
is
begin
    --Dışarıdan çağrılacak ana fonksiyon.
    find_max_category;
    find_orders;
    find_companys;
end;

end pck_order_report;
