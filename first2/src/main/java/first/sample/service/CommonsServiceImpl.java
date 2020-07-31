package first.sample.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import first.sample.dao.SampleDAO;
import first.sample.dto.LoginInfo;
import first.sample.dto.ManageInfo;

@Service
public class CommonsServiceImpl implements CommonsService{
@SuppressWarnings("rawtypes")
@Inject
SampleDAO sampleDao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectCodeList(Map<String, Object> commandMap) throws Exception{
     		return sampleDao.selectCoadList(commandMap);
	}

	@Override
	public void addcode(ManageInfo manageinfo) {
		sampleDao.addcode(manageinfo);
	}

	@Override
	public List<Map<String, Object>> selectdetailCodeList(Map<String, Object> commandMap) {
		return sampleDao.selectdetailcodelist(commandMap);
	}

	@Override
	public List<Map<String, Object>> selectmanageList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return sampleDao.selectmanageList(commandMap);
	}

	@Override
	public void updatemanaging(LoginInfo logininfo) {
			sampleDao.updatemanaging(logininfo);
	}

	@Override
	public ManageInfo cntcode(ManageInfo manageinfo) {
			
			return sampleDao.cntmaincode(manageinfo);
		
	}

	@Override
	public void updatecode(ManageInfo manageinfo) {
		sampleDao.updatecode(manageinfo);
		
	}

	@Override
	public List selectmaincodeList(ManageInfo manageinfo) {
		return sampleDao.selectmaincodeList(manageinfo);
	}

	@Override
	public ManageInfo conuntMainCode(ManageInfo manageinfo) {
		return sampleDao.countMainCode(manageinfo);
		
	}



	@Override
	public Map<String, Object> selectmaincode(Object object) throws Exception{
		// TODO Auto-generated method stub
		return sampleDao.selectmaincode(object);
	}





}
