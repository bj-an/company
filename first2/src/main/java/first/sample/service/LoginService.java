package first.sample.service;

import javax.servlet.http.HttpSession;

import first.sample.dto.LoginInfo;

public interface LoginService {

	public boolean login(LoginInfo logininfo , HttpSession session);
	
	public LoginInfo viewMember(LoginInfo logininfo);
	
	public void join(LoginInfo logininfo) throws Exception;

	public void logout(HttpSession session);

	public int idcheck(String userid);

	public void joinupdate(LoginInfo logininfo) throws Exception;

	public LoginInfo joininfo(String joininfo);

	

	
	
}
