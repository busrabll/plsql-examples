variable v_sum_freight_koln number
set autoprint on

begin

    select sum(freight) into :v_sum_freight_koln 
    from orders 
    where ship_city = 'Köln';

end;
/

select ship_city, sum(freight) from orders 
group by ship_city
having sum(freight) > :v_sum_freight_koln;