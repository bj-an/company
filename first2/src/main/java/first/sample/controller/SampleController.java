package first.sample.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.sample.dto.LoginInfo;
import first.sample.service.LoginService;
import first.sample.service.SampleService;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());

	@Inject
	SampleService sampleService;
	@Inject
	LoginService loginService;

		@RequestMapping(value="/sample/adminBoard.do")
		public ModelAndView adminBoard(Map<String,Object> commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/sample/adminBoard");
			//commandMap.put("BGNO","00");
			List<Map<String,Object>> lists = sampleService.selectBoardsList(commandMap);
			mv.addObject("lists", lists);
			
			return mv;
		}

		
		
		
		@RequestMapping(value="/layout/header.do")
		public ModelAndView selectAdminBoard(Map<String,Object> commandMap, HttpSession session) throws Exception{
			ModelAndView mv = new ModelAndView("/layout/header");
			//commandMap.put("BGNO","00");
			List<Map<String,Object>> listss = sampleService.selectAdminBoardsList(commandMap);
			mv.addObject("listss", listss);
			
			String joininfo = (String)session.getAttribute("id");
			LoginInfo joininfo2 = loginService.joininfo(joininfo);		
			mv.addObject("joininfo2",joininfo2);
			
			return mv;
		}
		
		@RequestMapping(value="/layout/header2.do")
		public ModelAndView selectAdminBoar(Map<String,Object> commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/layout/header2");

			
			return mv;
		}
		
		@RequestMapping(value="/layout/adminBody.do")
		public ModelAndView adminBody(Map<String,Object> commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/layout/adminBody");

			
			return mv;
		}
		@RequestMapping(value="/layout/adminHeader.do")
		public ModelAndView adminHeader(Map<String,Object> commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/layout/adminHeader");

			
			return mv;
		}
		
		
		@RequestMapping(value="/sample/addBoard.do")
		public ModelAndView openaddBoard(CommandMap commandMap) throws Exception{ 

			ModelAndView mv = new ModelAndView("/sample/addBoard");

			return mv; 
		}
		
		@RequestMapping(value="/sample/adddBoard.do")
		public ModelAndView insertAddBoard(CommandMap commandMap) throws Exception{

			ModelAndView mv = new ModelAndView("redirect:/sample/adminBoard.do");
			sampleService.insertAddBoard(commandMap.getMap());

			return mv;
		}
		

	@RequestMapping(value="/sample/openBoardList.do")
	public ModelAndView openSampleBoardList(Map<String,Object> commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/firstBoardList");
		
		List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
		mv.addObject("list", list);
		
		
		String joininfo = (String)session.getAttribute("id");
		
		LoginInfo joininfo2 = loginService.joininfo(joininfo);		
		mv.addObject("joininfo2",joininfo2);
		mv.addObject("msg", "success");
		return mv;
	}
	
	@RequestMapping(value="/sample/testMapArgumentResolver.do") 
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{ 
		ModelAndView mv = new ModelAndView(""); 

		if(commandMap.isEmpty() == false){ 
			Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator(); 
			Entry<String,Object> entry = null; 


			while(iterator.hasNext()){ 
				entry = iterator.next(); 
				log.debug("key : "+entry.getKey()+", value : "+entry.getValue()); 
			}
		} return mv; 
	}



	@RequestMapping(value="/sample/openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{ 

		ModelAndView mv = new ModelAndView("/sample/boardWrite");

		return mv; 
	}
	@RequestMapping(value="/sample/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");

		sampleService.insertBoard(commandMap.getMap());

		return mv;
	}


	@RequestMapping(value="/sample/openBoardDetail.do") 
	public ModelAndView openBoardDetail(CommandMap commandMap, HttpSession session) throws Exception{ 
		ModelAndView mv = new ModelAndView("/sample/boardDetail"); 
		Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		
		String joininfo = (String)session.getAttribute("id");
		
		LoginInfo joininfo2 = loginService.joininfo(joininfo);		
		mv.addObject("joininfo2",joininfo2);

		mv.addObject("map", map);
		return mv; 

	}

	@RequestMapping(value="/sample/openBoardUpdate.do") 
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{ 
		ModelAndView mv = new ModelAndView("/sample/boardUpdate"); 
		Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap()); 
		mv.addObject("map", map); return mv;
	} 

	@RequestMapping(value="/sample/updateBoard.do") 
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception{ 
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do"); 
		sampleService.updateBoard(commandMap.getMap()); 

		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}

	@RequestMapping(value="/sample/deleteBoard.do") 
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{ 
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do"); 
		sampleService.deleteBoard(commandMap.getMap()); 
		
		return mv;  
		
	}
	

	@RequestMapping(value="/layout/goBoardpage.do")
	public ModelAndView goBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/layout/header.do");
		
		Map<String,Object> map = sampleService.goBoard(commandMap.getMap());
	    mv.addObject("map", map);
	    System.out.println("map : "+map);
		return mv;
	}
}
