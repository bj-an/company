package first.sample.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import first.sample.dao.SampleDAO;
import first.sample.dto.LoginInfo;

@Service
public class FindServiceImpl implements FindService{

	
	@Inject
	SampleDAO sampleDAO;

	@Override
	public LoginInfo findid(LoginInfo logininfo) {

		return sampleDAO.findid(logininfo);
	}

	
	@Override
	public LoginInfo findpw(LoginInfo logininfo) {
		return sampleDAO.findpw(logininfo);
	}
}
