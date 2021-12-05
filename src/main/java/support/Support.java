package support;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Date;
import java.util.Properties;

public class Support {
    public void sendEmail(String emailTo, String subject, String content) throws Exception {
        final String username = "hai95.lv@gmail.com";
        final String password = "Quangtan2017";
        try {
            Date date = new Date();
            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true");
            Session session = Session.getInstance(prop, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
            message.setSubject(subject, "utf-8");
            message.setText(content, "utf-8", "html");
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Lỗi gửi mail");
        }
    }
    public String uploadImage(HttpServletRequest request) throws ServletException, IOException {
        File foder = new File(request.getServletContext().getRealPath("/photos"));
        //kiểm tra file có tồn tại hay không. nếu không sẽ tạo file mới
        if (!foder.exists()) {
            foder.mkdirs();
        }
        //Đọc part img từ web
        Part imgPart = request.getPart("poster");
        String imgName = Path.of(imgPart.getSubmittedFileName()).getFileName().toString();
//		tạo file trong thư mục cha (foder)
        File img = new File(foder, imgName);
        imgPart.write(img.getAbsolutePath());
        System.out.println("image " + imgName);
        return imgName;
    }
}
