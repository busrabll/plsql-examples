declare
    v_str1 varchar2(20);
    v_str2 varchar2(20);
    v_str3 varchar2(20);

begin

    v_str1    := 'Ankara';
    v_str2    := 'İzmir';
    v_str3    := v_str1 || ',' || v_str2;

    dbms_output.put_line(v_str3);
  
end;