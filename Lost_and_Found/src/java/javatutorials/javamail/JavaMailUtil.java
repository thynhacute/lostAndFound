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

    private static Message prepareMessage(Session session, String myAccountEmail, String recepient, String reportContent, String fullName, String articleContent) {

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject(" Warning Email !!!  ");
            String htmlCode = "<h1 style=\"color: orange;\"> Lost and Found  </h1> \n "
                    + "<h2>Hi, " + fullName + " </h2>\n"
                    + "<h4> We received one report request from another person and  reporting about : " + "<h3>" + articleContent + "</h3>" + " </h4> \n"
                    + "<h4> This is the content of your post report : " + "<h3>" + reportContent + "</h3>" + "</h4> \n"
                    + "<h4>  If your post gets more than 5 reports then we have to delete your post </h4> \n"
                    + "<h4> please check your article again and any questions or complaints regarding for account deactivation, please reply to this email for consideration ! </h4>"             
                    + "<h4>  thyhnse151101@fpt.edu.vn </h4> \n";;
            message.setContent(htmlCode, "text/html");
            return message;
        } catch (Exception ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void sendMail(String recepient, String reportContent, String fullName, String articleContent) throws MessagingException {
        System.out.println("Preparing to send email ");
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        String myAccountEmail = "thyhnse151101@fpt.edu.vn ";
        String password = "thyhan2907";

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail, password);
            }
        });

        Message message = prepareMessage(session, myAccountEmail, recepient, reportContent, fullName, articleContent);
        Transport.send(message);
        System.out.println("Message sent Successfuly ");

    }
//------------------------------------------------------ end warning mail

    private static Message prepareMessageBan(Session session, String myAccountEmail, String recepient, String fullName) {

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject(" Ban Email !!!  ");
            String htmlCode = "<h1 style=\"color: orange;\"> Lost and Found  </h1> \n "
                    + "<h2>Hi, " + fullName + " </h2>\n"
                    + "<h3> we received many complaints from other users after review we have decided to temporarily lock your account </h3> \n"
                    + "<h4> the following are possible reasons : </h4> \n"
                    + "<h5> - Using nudity or pornography. </h5> \n"
                    + "<h5> - Using language that incites hatred or intimidation. Or attack a specific person or organization directly. </h5> \n"
                    + "<h5> - Using unsafe content or harm yourself.  </h5> \n"
                    + "<h5> - Using fake or impersonated accounts.  </h5> \n"
                    + "<h5> - Stealing trademarks, copyrights, intellectual property rights.  </h5> \n"
                    + "<h5> - Spam. </h5> \n"
                    + "<h4>  Any questions or complaints regarding for account deactivation, please reply to this email for consideration ! </h4> \n"
                    + "<h4>  thyhnse151101@fpt.edu.vn </h4> \n";
            message.setContent(htmlCode, "text/html");
            return message;
        } catch (Exception ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void sendMailBanMember(String recepient, String fullName) throws MessagingException {
        System.out.println("Preparing to send email ");
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        String myAccountEmail = "thyhnse151101@fpt.edu.vn";
        String password = "thyhan2907";

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail, password);
            }
        });

        Message messageBan = prepareMessageBan(session, myAccountEmail, recepient, fullName);
        Transport.send(messageBan);
        System.out.println("Message sent Successfuly ");

    }

//    ---------------------------------- end send mail BAN of admin
    private static Message prepareMessageActive(Session session, String myAccountEmail, String recepient, String fullName) {

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject(" Active Email !!!  ");
            String htmlCode = "<h1 style=\"color: orange;\"> Lost and Found  </h1> \n "
                    + "<h2>Hi, " + fullName + " </h2>\n"
                    + "<h3> we received many complaints from other users after reviewing your account and we decided to reopen it for you </h3> \n"
                    + "<h4> We deeply apologize for the convenience of your web usage experience </h4> \n"
                    + "<h4>  Any questions or complaints regarding for account deactivation, please reply to this email for consideration ! </h4> \n"
                    + "<h2>  THANKS  </h2> \n"
                    + "<h4>  thyhnse151101@fpt.edu.vn </h4> \n";
            message.setContent(htmlCode, "text/html");
            return message;
        } catch (Exception ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void sendMailActiveMember(String recepient, String fullName) throws MessagingException {
        System.out.println("Preparing to send email ");
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        String myAccountEmail = "thyhnse151101@fpt.edu.vn";
        String password = "thyhan2907";

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail, password);
            }
        });

        Message messageBan = prepareMessageActive(session, myAccountEmail, recepient, fullName);
        Transport.send(messageBan);
        System.out.println("Message sent Successfuly ");

    }
}
