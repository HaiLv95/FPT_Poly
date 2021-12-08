package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class ReportFavoriteUsers {
	@Id
	private String username;
	private String fullname;
	private String emails;
	private LocalDate likeDate;
	
	public ReportFavoriteUsers() {
	}
	public ReportFavoriteUsers(String username, String fullname, String emails, LocalDate likeDate) {
		this.username = username;
		this.fullname = fullname;
		this.emails = emails;
		this.likeDate = likeDate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmails() {
		return emails;
	}
	public void setEmails(String email) {
		this.emails = email;
	}
	public LocalDate getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(LocalDate likeDate) {
		this.likeDate = likeDate;
	}
}
