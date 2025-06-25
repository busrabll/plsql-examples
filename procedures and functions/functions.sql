create or replace package pck_genel as

function yonetici_getir (p_personel_id number) return varchar2;

end pck_genel;

/

create or replace package body pck_genel as

    function yonetici_getir (p_personel_id number) return varchar2
    as
        v_yonetici_ismi varchar2(100);
    begin
    
        select 
             pry.ad || ' ' ||pry.soyad 
             into v_yonetici_ismi
        from personel pr, yonetici yn, personel pry
        where pr.yonetici_id = yn.yonetici_id
              and pry.personel_id = yn.personel_id
              and pr.personel_id = p_personel_id;
    
        return v_yonetici_ismi;
    
        exception
            when no_data_found then
                return 'Yönetici bulunamadı';
    
    end;
    
end pck_genel;