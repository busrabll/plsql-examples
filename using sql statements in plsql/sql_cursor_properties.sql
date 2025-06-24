begin
    
    update student set course_name = 'Accountancy and Finance'
    where course_name = 'Economics';
    
    if sql%notfound then
       dbms_output.put_line('Herhangi bir satır güncellenmedi, lütfen kontrol ediniz! ');
    else
       dbms_output.put_line('Güncellenen Kayıt Sayısı: '|| SQL%ROWCOUNT);
    end if; 

end;
/