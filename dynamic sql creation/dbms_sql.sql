
create or replace function create_email(p_student_name varchar2, p_course_name varchar2)
return varchar2
is
    v_return_value  varchar2(500);
begin
    select 
        lower(replace(p_student_name,' ','.'))||'@'||
        lower(replace(p_course_name,' ','.'))||'.com' 
        into v_return_value
    from dual;
    
    return v_return_value;
end;

create or replace procedure update_email(p_course_name varchar2)
is
    v_cur_id pls_integer;
    v_up_rows number;
    v_sql varchar2(100);

begin
       
    v_sql := 'update student set email = create_email(name, course_name) where course_name = :cn';
    v_cur_id := DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE(v_cur_id, v_sql, DBMS_SQL.NATIVE);
    DBMS_SQL.BIND_VARIABLE(v_cur_id, ':cn', p_course_name);
    v_up_rows := DBMS_SQL.EXECUTE(v_cur_id);
    DBMS_SQL.CLOSE_CURSOR(v_cur_id);
    dbms_output.put_line('Updated rows:' || v_up_rows);
    commit;
end;