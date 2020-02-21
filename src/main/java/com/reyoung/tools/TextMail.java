package com.reyoung.tools;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Date;
import java.util.List;
import java.util.Properties;

/**
 * Created by Administrator on 2018-11-27.
 */
public class TextMail {

    //发送邮件功能  带附件发送
    public static void sendMail(String send,String psd,String host,List<String> list,String cc,String subject,String content) throws Exception {

        Properties props = new Properties();                    // 参数配置
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", host);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");

        Session session = Session.getInstance(props);
        session.setDebug(false);
        MimeMessage message = createMimeMessage(session, send, list,cc,subject,content);

        Transport transport = session.getTransport();
        transport.connect(send, psd);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

    }

    public static MimeMessage createMimeMessage(Session session, String sendMail, List<String> list,String cc,String subject,String content) throws Exception {

        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人
        message.setFrom(new InternetAddress(sendMail, "粉针事业部BPM通知", "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）

        for (String name:list) {
            message.addRecipient(MimeMessage.RecipientType.TO,new InternetAddress(name,name.substring(0,name.lastIndexOf("@")),"UTF-8"));
        }

        //抄送
         message.setRecipient(MimeMessage.RecipientType.BCC,new InternetAddress(cc,"yangtao","UTF-8"));

        // 4. Subject: 邮件主题
        message.setSubject(subject, "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）
        //      message.setContent("今天你们的货来了!", "text/html;charset=UTF-8");

        MimeBodyPart text=new MimeBodyPart();
        text.setContent(content, "text/html;charset=UTF-8");

        MimeMultipart mp=new MimeMultipart();
        mp.addBodyPart(text);


        // 6. 设置发件时间
        message.setSentDate(new Date());
        message.setContent(mp);

        // 7. 保存设置
        message.saveChanges();

        return message;
    }

}
