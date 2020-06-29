package first.sample.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import first.sample.dto.LoginInfo;

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


	
}
