package first.sample.service;

import org.springframework.stereotype.Service;

import first.sample.dto.LoginInfo;


@Service
public interface FindService {

	public LoginInfo findid(LoginInfo logininfo);

	public LoginInfo findpw(LoginInfo logininfo);

}
