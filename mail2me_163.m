function mail2me(mailaddress, subject, content)
% mail2me(mailaddress, subject, content)
    % Modify these two lines to reflect
    % your account and password.
MailAddress = 'liguoliangfa@163.com';%�ֻ������ַ 
password = '*****';  %���� 
setpref('Internet','E_mail',MailAddress);%�ճ��� 
setpref('Internet','SMTP_Server','smtp.163.com');%SMTP������ 
setpref('Internet','SMTP_Username',MailAddress);%�ճ� 
setpref('Internet','SMTP_Password',password);%�ճ� 
props = java.lang.System.getProperties;%�ճ� 
props.setProperty('mail.smtp.auth','true');%�ճ� 


    sendmail(mailaddress, subject, content);
end
