package com.wander.bean;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Notes {
	@Id
	private String title;
	private String description;
	private String creator;
	private Date creation;
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreation() {
		return creation;
	}
	public void setCreation(Date creation) {
		this.creation = creation;
	}
	
	
	public Notes(String title, String description, String creator, Date creation) {
		super();
		this.title = title;
		this.description = description;
		this.creator = creator;
		this.creation = creation;
	}
	@Override
	public String toString() {
		return "Notes [title=" + title + ", description=" + description + ", creator=" + creator + ", creation="
				+ creation + "]";
	}
	public Notes() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
