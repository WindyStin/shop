package utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class MailUtil {
    public static void sendEmail(String recipient, String subject, String content) throws MessagingException {
    final String senderEmail = "1509778357@qq.com";
    final String senderPassword = "qygfuvlkvcmsggee";

    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.qq.com");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");

    Session session = Session.getInstance(props, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(senderEmail, senderPassword);
        }
    });

    Message message = new MimeMessage(session);
    message.setFrom(new InternetAddress(senderEmail));
    message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
    message.setSubject(subject);
    message.setText(content);

    Transport.send(message);
}
}
