package com.movie.filmmatch.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {

    private static final String type = "text/html; charset=utf-8";
    private static final String emailAdd = "sm3381343@gmail.com";
    private static final String password = "tbdcfpvkypbqkajn";
    //private static final String to = "mack15@naver.com";

    public static void sendEmail(String toEmail) {

        String code = generateRandomCode();

        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", 587);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication (emailAdd, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emailAdd, "FilmMatch 관리자"));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("이메일 인증번호 확인");
            message.setContent("인증번호 : "+ code , type);
            Transport.send(message);
            System.out.println("이메일 인증");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String generateRandomCode() {
        // Generate random 6-digit code
        Random random = new Random();
        int code = 100000 + random.nextInt(900000); // Generates a random number between 100000 and 999999
        return String.valueOf(code);
       
    }





}
