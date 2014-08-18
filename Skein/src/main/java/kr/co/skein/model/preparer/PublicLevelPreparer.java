package kr.co.skein.model.preparer;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.dao.CodeDao;
import kr.co.skein.model.vo.PublicLevelCommand;

import org.apache.ibatis.session.SqlSession;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;
import org.apache.tiles.preparer.ViewPreparer;

public class PublicLevelPreparer implements ViewPreparer {

private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(TilesRequestContext tilesContext, AttributeContext attributeContext) {
		// TODO Auto-generated method stub
		CodeDao codeDao = sqlSession.getMapper(CodeDao.class);
		
		try {
			List<PublicLevelCommand> publicLevelList =  codeDao.getPublicLevelCodes();
			tilesContext.getRequestScope().put("publicLevelList", publicLevelList);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
