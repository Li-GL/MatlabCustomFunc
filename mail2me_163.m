function mail2me(mailaddress, subject, content)
% mail2me(mailaddress, subject, content)
    % Modify these two lines to reflect
    % your account and password.
MailAddress = 'liguoliangfa@163.com';%ÊÖ»úÓÊÏäµØÖ· 
password = '*****';  %ÃÜÂë 
setpref('Internet','E_mail',MailAddress);%ÕÕ³­°É 
setpref('Internet','SMTP_Server','smtp.163.com');%SMTP·şÎñÆ÷ 
setpref('Internet','SMTP_Username',MailAddress);%ÕÕ³­ 
setpref('Internet','SMTP_Password',password);%ÕÕ³­ 
props = java.lang.System.getProperties;%ÕÕ³­ 
props.setProperty('mail.smtp.auth','true');%ÕÕ³­ 


    sendmail(mailaddress, subject, content);
end
