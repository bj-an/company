package first.sample.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import first.common.common.CommandMap;
import first.sample.dto.LoginInfo;
import first.sample.service.FindService;

@Controller
public class FindController {

	
	@Inject
	FindService findService;
	
	@Autowired
	SampleController smapleController;
	
	@RequestMapping(value="/login/findidpage.do" , method=RequestMethod.GET)
	public String findidpage() {
		return "/login/findid";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/login/findid.do", method=RequestMethod.POST)
	public String findid(LoginInfo logininfo ,HttpSession session) throws Exception{
		
		LoginInfo findid = findService.findid(logininfo);
		
			 
	
		return findid.getId();
					
			
			//session.setAttribute("id", findid.getId());
			
	}
		
	
	
	@RequestMapping(value="/login/findpwpage.do" , method=RequestMethod.GET)
	public String findpwpage() {
		return "/login/findpw";
	}
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/login/findpw.do", method=RequestMethod.POST)
	public String findpw(LoginInfo logininfo ,HttpSession session) throws Exception{
		
		LoginInfo findpw = findService.findpw(logininfo);
		
			 
	
		return findpw.getPw();
					
			
			//session.setAttribute("id", findid.getId());
			
	}
}
	

