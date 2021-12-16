package model;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ReportSharedFriend {
    @Id
    private String vdTitle;
    private String senderName;
    private String senderMail;
    private String receiverMail;
    private LocalDate sentDate;


    public ReportSharedFriend(String vdTitle, String senderName, String senderMail, String receiverMail, LocalDate sentDate) {
        super();
        this.vdTitle = vdTitle;
        this.senderName = senderName;
        this.senderMail = senderMail;
        this.receiverMail = receiverMail;
        this.sentDate = sentDate;
    }

    public ReportSharedFriend() {
    }

    public String getVdTitle() {
        return vdTitle;
    }

    public void setVdTitle(String vdTitle) {
        this.vdTitle = vdTitle;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getSenderMail() {
        return senderMail;
    }

    public void setSenderMail(String senderMail) {
        this.senderMail = senderMail;
    }

    public String getReceiverMail() {
        return receiverMail;
    }

    public void setReceiverMail(String receiverMail) {
        this.receiverMail = receiverMail;
    }

    public LocalDate getSentDate() {
        return sentDate;
    }

    public void setSentDate(LocalDate sentDate) {
        this.sentDate = sentDate;
    }


}
