package first.sample.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import first.sample.dto.LoginInfo;
import first.sample.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());

	@Inject
	LoginService loginService;
	
	@Autowired
	SampleController sampleController;
	
	//로그인 메인
	@RequestMapping(value="/login/main.do")
	public String loginmain() {
	
		return "/login/loginmain";
	}
	
	
	//로그인 기능
	@RequestMapping(value="/login/login.do" , method=RequestMethod.POST)
	public ModelAndView login(HttpSession session,LoginInfo logininfo,Model model) throws Exception{
		
		boolean result = loginService.login(logininfo, session);
		ModelAndView mv = new ModelAndView();
		
		if (result ==true) {
			Map<String,Object> cmMap = new HashMap<String,Object>(); 
			mv = sampleController.openSampleBoardList(cmMap, session);
			
			String joininfo = (String)session.getAttribute("id");
			
			LoginInfo joininfo2 = loginService.joininfo(joininfo);		
			mv.addObject("joininfo2",joininfo2);
			mv.addObject("msg", "success");
			
		}else {
		mv.setViewName("/login/loginfail");
		mv.addObject("msg", "failure");


	
		}
	
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/login/logout.do")
	public ModelAndView logout(HttpSession session) {
		loginService.logout(session);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/login/loginmain");
		mv.addObject("msg", "logout");
		return mv;
				
	}
	
	//회원가입
	@RequestMapping(value="/login/joingo.do", method=RequestMethod.POST)
	public ModelAndView join(HttpSession session,Model model, LoginInfo logininfo) throws Exception {		
		ModelAndView mv = new ModelAndView("/login/loginmain");


		
		loginService.join(logininfo);
		
		log.info("get controllr");
		
		 
		return mv;
	}
	
	
	//회원가입 메인
	@RequestMapping(value="/login/join.do", method=RequestMethod.GET)
	public String join() {
		return "/login/join";
		
	}
	
	
	@RequestMapping("/login/idcheck.do")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String userid) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
  
        count = loginService.idcheck(userid);
        map.put("cnt", count);
 
        return map;
    }
	
	@RequestMapping(value="/login/joinupdatepage.do" , method=RequestMethod.GET)
	public ModelAndView joinupdatepage(LoginInfo logininfo, Model model, HttpSession session) {
		ModelAndView mv = new ModelAndView("/login/joinupdate");
		
		String joininfo = (String)session.getAttribute("id");
		
		LoginInfo joininfo2 = loginService.joininfo(joininfo);		
		mv.addObject("joininfo2",joininfo2);
	

		 return mv;
	}
	
	@RequestMapping(value="/login/joinupdate.do", method=RequestMethod.POST)
	public <Joininfo> String joinupdate(LoginInfo logininfo , HttpSession session) throws Exception{

		loginService.joinupdate(logininfo);
	
		session.invalidate();
		return "/login/loginmain";
	}
	
}
