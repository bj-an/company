package first.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.sample.dto.LoginInfo;
import first.sample.dto.ManageInfo;
import first.sample.service.CommonsService;
import first.sample.service.LoginService;

@Controller
public class CommonsController {
	@Inject
	CommonsService commonsService;
	@Inject
	LoginService loginService;

	@RequestMapping(value="/manage/commonscodepage.do")
	public ModelAndView commonscodepage(Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/manage/commonscode");

		List<Map<String,Object>> listt = commonsService.selectCodeList(commandMap);
		mv.addObject("listt", listt);

		return mv;

	}



	@RequestMapping(value="/manage/managingpage.do" , method=RequestMethod.GET)
	public ModelAndView managingcodepage(Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/manage/managing");

		List<Map<String,Object>> listinfo = commonsService.selectmanageList(commandMap);
		mv.addObject("listinfo", listinfo);



		return mv;
	}

	@RequestMapping(value="/manage/addcodepage.do" , method=RequestMethod.GET)
	public String addcodepage(Model model, ManageInfo manageinfo) {

		List maincode = commonsService.selectmaincodeList(manageinfo);
		model.addAttribute("maincode", maincode);

		return "/manage/addcode";
	}



	@RequestMapping(value="/manage/addcode.do" , method=RequestMethod.GET)
	public String addcode(HttpSession session, ManageInfo manageinfo, Model model) {

		//중복된 메인코드인지 체크
		
		int cntCode= 0;
		if(commonsService.conuntMainCode(manageinfo) == null){
		
			commonsService.addcode(manageinfo);
		}else {
			cntCode = 1;
		}
		
		model.addAttribute("cntCode", cntCode);
		return "redirect:/manage/commonscodepage.do";
	}


	@RequestMapping(value="/manage/updatemaincodepage.do" , method=RequestMethod.POST)
	public String updatemaincodepage( ManageInfo manageinfo, Model model) {

		return "/manage/updatecode";
	}

	@RequestMapping(value="/manage/updatemaincode.do")
	//public String updatemaincode(@RequestParam(value="updateCode")ManageInfo updateCode , ManageInfo manageinfo, Model model) {
//	public String updatemaincode(@RequestParam Map param, Model model, ManageInfo manageinfo) {
	public ModelAndView updatemaincode(CommandMap commandMap, @RequestParam Map param,ManageInfo manageinfo) throws Exception {
		ModelAndView mv = new ModelAndView("/manage/updatecode");
		Map<String,Object> map = commonsService.selectmaincode(param.get("updtCode"));
		mv.addObject("map", map);
		return mv;
		
		
	}
	
	//수정하기
//			commonsService.updatecode(manageinfo);
			
	

	@ResponseBody
	@RequestMapping(value="/manage/selectdetailcode.do" , method=RequestMethod.POST)
	public List<Map<String,Object>> selectdetailcode(CommandMap commandMap ) throws Exception{
		Map<String, Object> tempMap = new HashMap<String, Object>();
		tempMap.put("maincode", commandMap.get("maincode"));
		List<Map<String,Object>> listts = commonsService.selectdetailCodeList(tempMap);


		return listts;

	}

	@RequestMapping(value="/manage/updatemanagingpage.do" , method=RequestMethod.GET)
	public ModelAndView updatemanagingcodepage(Map<String,Object> commandMap , HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/manage/updatemanaging");

		List<Map<String,Object>> listinfo = commonsService.selectmanageList(commandMap);
		mv.addObject("listinfo", listinfo);
		return mv;
	}


	@RequestMapping(value="/manage/updatemanaging.do" , method=RequestMethod.POST)
	public String updatemanaging(HttpSession session, LoginInfo logininfo, Model model) {

		commonsService.updatemanaging(logininfo);

		return "redirect:/manage/managingpage.do";
	}	


 
}
