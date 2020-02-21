package com.reyoung.tools;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;
import java.io.File;
import java.util.Date;
import java.util.Properties;

/**
 * Created by Administrator on 2018-11-26.
 */
public class Mail {

    //发送邮件功能  带附件发送
    public static void sendMail(String send,String psd,String host,String sendemail,String cc1,String subject,String context,File file){

        try{

            Properties props = new Properties();                    // 参数配置
            props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
            props.setProperty("mail.smtp.host", host);   // 发件人的邮箱的 SMTP 服务器地址
            props.setProperty("mail.smtp.auth", "true");

            Session session = Session.getInstance(props);
            session.setDebug(false);
            MimeMessage message = createMimeMessage(session, file,send, sendemail,cc1,subject,context);

            Transport transport = session.getTransport();
            transport.connect(send, psd);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

        }catch (Exception e) {

        }

    }

    public static MimeMessage createMimeMessage(Session session,File file, String sendMail, String sendemail,String rec1,String subject,String context) throws Exception {

        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人
        message.setFrom(new InternetAddress(sendMail, "粉针事业部BPM通知", "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
/*        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "caoke", "UTF-8"));*/

            message.addRecipient(MimeMessage.RecipientType.TO,new InternetAddress(sendemail,sendemail.substring(0,sendemail.indexOf("@")),"UTF-8"));

        //抄送
       // message.setRecipient(MimeMessage.RecipientType.CC,new InternetAddress(rec1,rec1.substring(0,rec1.indexOf("@")),"UTF-8"));

        //抄送
       // message.setRecipient(MimeMessage.RecipientType.CC,new InternetAddress(rec2,"fenzhen","UTF-8"));

        // 4. Subject: 邮件主题
          /* message.setSubject("前五个月五金计划情况表", "UTF-8");*/
        message.setSubject(subject);

        // 5. Content: 邮件正文（可以使用html标签）
        //message.setContent("今天你们的货来了!", "text/html;charset=UTF-8");

        MimeBodyPart text=new MimeBodyPart();
        /*text.setContent("附件为前五个月计划未领取部分，请查收!", "text/html;charset=UTF-8");*/
        text.setContent(context,"text/html;charset=UTF-8");

        MimeMultipart mp=new MimeMultipart();

            MimeBodyPart attach=new MimeBodyPart();
            DataHandler dh=new DataHandler(new FileDataSource(file));
            attach.setDataHandler(dh);
            attach.setFileName(dh.getName());
            attach.setFileName(MimeUtility.encodeWord(file.getName()));
            mp.addBodyPart(attach);

        mp.addBodyPart(text);
        mp.setSubType("mix");

        // 6. 设置发件时间
        message.setSentDate(new Date());
        message.setContent(mp);

        // 7. 保存设置
        message.saveChanges();

        return message;

    }

}
