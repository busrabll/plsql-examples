declare
  
    ilk_sayi number := 0;
    ikinci_sayi number := 1;
    toplam number;
      
    adet number := 10;
    i number;
      
begin

    for i in 2..adet
    loop
        toplam := ilk_sayi + ikinci_sayi;
  
        ilk_sayi := ikinci_sayi;
        ikinci_sayi := toplam;
  
        dbms_output.put_line(toplam);       
    end loop;
  
end;