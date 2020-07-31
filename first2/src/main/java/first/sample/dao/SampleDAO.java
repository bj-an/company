package first.sample.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import first.sample.dto.LoginInfo;
import first.sample.dto.ManageInfo;

@Repository("sampleDAO")
public class SampleDAO<User> extends AbstractDAO{

	@Inject
	SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{ 
		insert("sample.insertBoard", map); 
		
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("sample.updateHitCnt" , map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardsList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectBoardsList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
			return (Map<String, Object>) selectOne("sample.selectBoardDetail"  ,map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("sample.updateBoard" , map);
		
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{

		update("sample.deleteBoard", map);
	}

	public void insertAddBoard(Map<String, Object> map) throws Exception{
		insert("sample.insertAddBoard", map);
		
	}
	
	public boolean login(LoginInfo logininfo) {
		LoginInfo logRet= sqlSession.selectOne("sample.login", logininfo);
		return (logRet == null) ? false : true;
		
	}
	
	public LoginInfo viewMember(LoginInfo logininfo) {
		return sqlSession.selectOne("sample.viewMember", logininfo);
	}
	
	public void join(LoginInfo logininfo) throws Exception{
		sqlSession.insert("sample.join", logininfo);
		
	}
	
	public void logout(HttpSession session) {
		
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminBoardsList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectAdminBoardsList", map);
	}

	public int idcheck(String userid) {
		System.out.println("d");
		return sqlSession.selectOne("sample.idcheck", userid);
	}

	public LoginInfo findid(LoginInfo logininfo) {

		return sqlSession.selectOne("sample.findid" , logininfo);
	}

	public LoginInfo findpw(LoginInfo logininfo) {
		return sqlSession.selectOne("sample.findpw" , logininfo);
	}


	public void joinupdate(LoginInfo logininfo) throws Exception{
		sqlSession.update("sample.joinupdate" , logininfo);
		
	}



	public LoginInfo joininfo(String joininfo) {
		return sqlSession.selectOne("sample.joininfo" ,joininfo);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCoadList(Map<String, Object> commandMap) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectCodeList", commandMap);
	}

	public void addcode(ManageInfo manageinfo) {
		sqlSession.insert("sample.addcode", manageinfo);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectdetailcodelist(Map<String, Object> commandMap) {
		return (List<Map<String, Object>>)selectList("sample.selectdetailcodelist", commandMap);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectmanageList(Map<String, Object> commandMap) {
		return (List<Map<String,Object>>)selectList("sample.selectmanageList", commandMap);
	}

	public void updatemanaging(LoginInfo logininfo) {

		sqlSession.update("sample.updatemanaging" , logininfo);
	}

	public ManageInfo cntmaincode(ManageInfo manageinfo) {
		
		return sqlSession.selectOne("sample.cntmaincode" , manageinfo);
	}

	public void updatecode(ManageInfo manageinfo) {
		sqlSession.update("sample.updatecode", manageinfo);
	}

	public List<Object> selectmaincodeList(ManageInfo manageinfo) {
		return sqlSession.selectList("sample.selectmaincodeList", manageinfo);
	}

	public ManageInfo countMainCode(ManageInfo manageinfo) {
		return sqlSession.selectOne("sample.countMainCode", manageinfo);
	}

	public Map<String, Object> selectmaincode(Object object) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sample.selectmaincode", object);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> goBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("sample.goBoard" ,map);
	}

		
	

	
}
