package kr.co.skein.preparer;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.dao.PublicLevelDao;
import kr.co.skein.model.PublicLevel;

import org.apache.ibatis.session.SqlSession;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.springframework.beans.factory.annotation.Autowired;

public class PublicLevelPreparer implements ViewPreparer {

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}



	@Override
	public void execute(TilesRequestContext tilesContext, AttributeContext attributeContext) {
		// TODO Auto-generated method stub
		/*PublicLevelDao publicLevelDao = sqlSession.getMapper(PublicLevelDao.class);
		try {
			List<PublicLevel> publicLevelList =  publicLevelDao.getPublicLevelList();
			tilesContext.getRequestScope().put("publicLevelList", publicLevelList);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	}

}
