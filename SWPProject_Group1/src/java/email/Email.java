
package email;

import dal.AccountDAO;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.SendGoogle;


public class Email {
AccountDAO dao = new AccountDAO();
    //email: tripove.work@gmail.com
    //password: recl ryfo jrju aick
    SendGoogle acc = dao.GetEmail();
    final String from = acc.getEmail() ;
//   final String password = "xgdwcowsiuhubmfz";
       final String password = acc.getPass();

    public void sendEmail(String to, String newPassword) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust","smtp.gmail.com");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        //phiên làm việc
        Session session = Session.getInstance(props, auth);

        //send email:
        MimeMessage msg = new MimeMessage(session);
        try {
            //content style
            msg.addHeader("Content-type", "text/HTML;charset=UTF-8");
            //sender and receiver:
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            //email header:
            msg.setSubject("RESET PASSWORD OTP","UTF-8");
            // email response:
            msg.setReplyTo(InternetAddress.parse(from, false));

            //email content:
            msg.setText("OTP: " + newPassword,"UTF-8");

            //send email:
            Transport.send(msg);

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void sendEmail2(String to, String content) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust","smtp.gmail.com");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        //phiên làm việc
        Session session = Session.getInstance(props, auth);

        //send email:
        MimeMessage msg = new MimeMessage(session);
        try {
            //content style
            msg.addHeader("Content-type", "text/HTML;charset=UTF-8");
            //sender and receiver:
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            //email header:
            msg.setSubject("PURCHASED SUCCESS","UTF-8");
            // email response:
            msg.setReplyTo(InternetAddress.parse(from, false));

            //email content:
            msg.setContent(content,"text/html; charset=UTF-8");

            //send email:
            Transport.send(msg);

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        Email e = new Email();
        e.sendEmail("traintravel238@gmail.com", "123");
    }

}
