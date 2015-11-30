/**
 * create by Yewon Kim
 * **/
package gradlemvc.pingpop.core;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service("userManager")
public class UserManager implements IUserManager{
	
	@Override
	public User login(String id, String name, String email) {
		
		//it is assumed that user information handed over from client-side is already authenticated by google.
		//check user existance
		//if exists, return user object
		//else, save user info into our database and then return user object
		
		//for now, just return new user object for testing
		return new User(id, name, email);
	}

}
