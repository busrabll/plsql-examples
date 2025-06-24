declare 
   type ay_isim_type is table of varchar2(10); 
   type ay_gun_type is table of integer;  
   
   ay_isimleri ay_isim_type; 
   ay_gunleri ay_gun_type; 
begin 
   
    ay_isimleri := ay_isim_type('Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 
        'Haziran', 'Temmuz', 'Ağustos', 'Eylül', 'Ekim'); 
    
    ay_gunleri := ay_gun_type(31, 28, 31, 30, 31, 30, 31, 31, 30, 31);
    
    ay_isimleri.extend(2);
    ay_isimleri(ay_isimleri.count-1) := 'Kasım';
    ay_isimleri(ay_isimleri.count) := 'Aralık';
    
    ay_gunleri.extend;
    ay_gunleri(ay_gunleri.count) := 30;
    
    ay_gunleri.extend;
    ay_gunleri(ay_gunleri.last) := 31;
    
    for i in ay_isimleri.first..ay_isimleri.last loop
    
        dbms_output.put_line(ay_isimleri(i)||' ayı gün sayısı: ' || ay_gunleri(i)); 
   
    end loop; 
   
end;