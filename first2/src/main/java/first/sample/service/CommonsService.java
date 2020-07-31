package first.sample.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import first.sample.dto.LoginInfo;
import first.sample.dto.ManageInfo;




@Service
public interface CommonsService {

	List<Map<String, Object>> selectCodeList(Map<String, Object> commandMap) throws Exception;

	void addcode(ManageInfo manageinfo);

	List<Map<String, Object>> selectdetailCodeList(Map<String, Object> commandMap);

	List<Map<String, Object>> selectmanageList(Map<String, Object> commandMap);

	void updatemanaging(LoginInfo logininfo);

	ManageInfo cntcode(ManageInfo manageinfo);

	void updatecode(ManageInfo manageinfo);

	List selectmaincodeList(ManageInfo manageinfo);

	ManageInfo conuntMainCode(ManageInfo manageinfo);

	Map<String, Object> selectmaincode(Object object) throws Exception;


	
}
