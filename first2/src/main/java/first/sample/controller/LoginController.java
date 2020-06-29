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

import first.common.common.CommandMap;
import first.sample.dto.LoginInfo;
import first.sample.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());

	@Inject
	LoginService loginService;
	
	@Autowired
	SampleController smapleController;
	
	//로그인 메인
	@RequestMapping(value="/login/main.do")
	public String loginmain() {
	
		return "/login/loginmain";
	}
	
	
	//로그인 기능
	@RequestMapping(value="/login/login.do" , method=RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap,HttpSession session,LoginInfo logininfo,Model model) throws Exception{
		logininfo.setId(String.valueOf(commandMap.get("id")));
		logininfo.setName(String.valueOf(commandMap.get("name")));
		
		boolean result = loginService.login(logininfo, session);
		ModelAndView mv = new ModelAndView();
		
		if (result ==true) {
			Map<String,Object> cmMap = new HashMap<String,Object>(); 
			mv = smapleController.openSampleBoardList(cmMap);
			
			mv.addObject("msg", "success");
			
			
		}else {
		mv.setViewName("/login/loginfail");
		mv.addObject("msg", "failure");
		session.setAttribute("id", logininfo.getId());

	
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
	public ModelAndView join(CommandMap commandMap,HttpSession session,Model model, LoginInfo logininfo) throws Exception {		
		ModelAndView mv = new ModelAndView("/login/loginmain");

		logininfo.setId(String.valueOf(commandMap.get("id")));
		logininfo.setPw(String.valueOf(commandMap.get("pw")));
		logininfo.setName(String.valueOf(commandMap.get("name")));
		logininfo.setPhonenum(String.valueOf(commandMap.get("phonenum")));
		logininfo.setEmail(String.valueOf(commandMap.get("email")));
		logininfo.setEmail(String.valueOf(commandMap.get("email2")));
		logininfo.setAddr1(String.valueOf(commandMap.get("addr1")));
		logininfo.setAddr2(String.valueOf(commandMap.get("addr2")));
		logininfo.setAddr3(String.valueOf(commandMap.get("addr3")));
		logininfo.setAddr4(String.valueOf(commandMap.get("addr4")));
		
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
}
