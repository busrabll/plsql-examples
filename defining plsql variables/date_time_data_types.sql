declare
    v_tarih1 date;
    v_sure interval day to second := '40 01:00:00';

begin

    v_tarih1 := to_date('01.09.’ || to_char(sysdate,'yyyy’) || ' 19:00', 'dd.mm.yyyy hh24:mi');
    
    dbms_output.put_line('1. Seminer Tarihi: ' || to_char(v_tarih1, 'dd.mm.yyyy hh24:mi:ss'));
    dbms_output.put_line('2. Seminer Tarihi: ' || to_char(v_tarih1 + v_sure, 'dd.mm.yyyy hh24:mi:ss'));
    dbms_output.put_line('3. Seminer Tarihi: ' || to_char(v_tarih1 + v_sure + v_sure, 'dd.mm.yyyy hh24:mi:ss'));
  
end;