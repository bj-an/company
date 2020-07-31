package first.sample.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import first.sample.dao.SampleDAO;
import first.sample.dto.LoginInfo;

@Service
public class LoginServiceImpl implements LoginService{

	
	@Inject
	SampleDAO sampleDAO;
	@Override
	public boolean login(LoginInfo logininfo, HttpSession session) {
		boolean result = sampleDAO.login(logininfo);
		
		if(result) {
			LoginInfo info2 = viewMember(logininfo);
			
			session.setAttribute("id", info2.getId());
			session.setAttribute("pw", info2.getPw());
		}
		
		return result;
	}

	@Override
	public LoginInfo viewMember(LoginInfo logininfo) {
		
		return sampleDAO.viewMember(logininfo);
	}

	@Override
	public void join(LoginInfo logininfo) throws Exception {
		sampleDAO.join(logininfo);
		
		
		
	}

	@Override
	public void logout(HttpSession session) {
		
		session.invalidate();
		
	}

	@Override
	public int idcheck(String userid) {
		return sampleDAO.idcheck(userid);
	}

	@Override
	public void joinupdate(LoginInfo logininfo) throws Exception{

		sampleDAO.joinupdate(logininfo);
	}

	@Override
	public LoginInfo joininfo(String joininfo) {
		return sampleDAO.joininfo(joininfo);
	}



	

	
	
}
