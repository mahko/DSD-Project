/**
 * create by Yewon Kim
 * **/
package gradlemvc.pingpop.core;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	//@Autowired(required=true)
	//private IUserManager userManager;
	//have some problem with autowiring..
	private UserManager userManager = new UserManager();
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public HomeController() {
		
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		System.out.println("hello?");
		
		return "main";
	}
	
	//Called only when google login process succeeds
	@RequestMapping(value = "/login", method = RequestMethod.POST, consumes = "application/json")
	public ModelAndView login(@RequestBody User user, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/");
        
        System.out.println("Here is our user:"+user.getUserId()+" "+user.getUserName()+" "+user.getEmail());
        
        //check this user is new or not
        User loginUser = userManager.login(user.getUserId(), user.getUserName(), user.getEmail());
 
        if (loginUser != null) {
        	//save user info into Session object
            session.setAttribute("userLoginInfo", loginUser);
        }
        
		return mv;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public ModelAndView logout(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/");
        
        System.out.println("user logout");

        session.setAttribute("userLoginInfo", null);
        
		return mv;
	}
}

