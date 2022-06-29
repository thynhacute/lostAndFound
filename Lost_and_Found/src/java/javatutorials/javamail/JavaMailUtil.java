
package javatutorials.javamail;

import java.sql.PreparedStatement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class JavaMailUtil {
    public  static void sendMail(String recepient) throws MessagingException{
        System.out.println("Preparing to send email ");
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        String myAccountEmail = "synqse151029@fpt.edu.vn";
        String password = "0983709791ad";
        
        Session session = Session.getInstance(properties, new Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail, password);
            }
            
        });
        Message message = prepareMessage(session,myAccountEmail,recepient );
        Transport.send(message);
        System.out.println("Message sent Successfuly ");
    }

    private static Message prepareMessage(Session session, String myAccountEmail, String recepient) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient) );
            message.setSubject(" Warning Email !!!  ");
             String htmlCode = "<h1 style=\"color: orange;\"> Lost and Found  </h1> \n "
                     + "<p> Your Article have a report from another person , please check your article again "
                     + "and any questions or complaints regarding for account deactivation, please reply to this email for consideration! </p>";
            message.setContent(htmlCode , "text/html");
            return message;
        } catch (Exception ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
