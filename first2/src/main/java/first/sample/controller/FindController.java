package first.sample.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import first.sample.service.LoginService;

@Controller
public class FindController {

	
	@Inject
	LoginService loginService;
	
	@Autowired
	SampleController smapleController;
	
	
	
}
