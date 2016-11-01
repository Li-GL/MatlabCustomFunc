function mail2me(mailaddress, subject, content)
% mail2me(mailaddress, subject, content)
    % Modify these two lines to reflect
    % your account and password.
    myaddress = 'lglfa666@gmail.com';
    mypassword = 'lgl521521';

    setpref('Internet','E_mail',myaddress);
    setpref('Internet','SMTP_Server','smtp.gmail.com');
    setpref('Internet','SMTP_Username',myaddress);
    setpref('Internet','SMTP_Password',mypassword);

    props = java.lang.System.getProperties;
    props.setProperty('mail.smtp.auth','true');
    props.setProperty('mail.smtp.socketFactory.class', ...
                      'javax.net.ssl.SSLSocketFactory');
    props.setProperty('mail.smtp.socketFactory.port','465');

    sendmail(mailaddress, subject, content);
end
