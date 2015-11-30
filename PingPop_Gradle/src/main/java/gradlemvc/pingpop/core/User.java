/**
 * create by Yewon Kim
 * **/
package gradlemvc.pingpop.core;

import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
//bean class to contain user info
public class User implements Serializable{

	private String userId = "test";//unique string id google api creates
	private String userName = "test";
	private String email = "test";

	public User() {
		this.userId = "test";
		this.email = "test";
		this.userName = "test";
	}
	
	public User(String userId, String userName, String email) {
		this.userId = userId;
		this.userName = userName;
		this.email = email;
	}
	
	public void setUserId(String id) {
		this.userId = id;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public String getEmail() {
		return email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
