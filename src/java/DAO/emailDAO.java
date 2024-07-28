/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import jakarta.websocket.Session;
import java.net.PasswordAuthentication;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class emailDAO {
     public static final String HOST_NAME = "smtp.gmail.com";

    public static final int SSL_PORT = 465; // Port for SSL

    public static final int TSL_PORT = 587; // Port for TLS/STARTTLS

    public static final String APP_EMAIL = "cuongncce171013@fpt.edu.vn"; // your email

    public static final String APP_PASSWORD = "atkj vypi owly hcbm"; // your password
    public boolean send(String to, String subject, String messageContent) {
        // Get properties object
         Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host",HOST_NAME);
        props.put("mail.smtp.socketFactory.port", SSL_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", SSL_PORT);

        // get Session
        javax.mail.Session session = javax.mail.Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(APP_EMAIL, APP_PASSWORD);
            }
        });

        // compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(messageContent);

            // send message
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    
}
