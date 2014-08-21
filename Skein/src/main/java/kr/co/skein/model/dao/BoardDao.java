package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.BoardCommand;
import kr.co.skein.model.vo.BoardDetailView;
import kr.co.skein.model.vo.BoardGroup;
import kr.co.skein.model.vo.HistoryCommand;
import kr.co.skein.model.vo.MemberBoardCommand;

public interface BoardDao {

	//게시물 입력 순서
	//히스토리 : 그룹 등록 > 공통 게시물 등록 > 히스토리 게시물 등록 > 미디어 등록
	//일일 게시물 : 그룹 등록 > 공통 게시물 등록 > 일일 게시물 등록 > 미디어 등록
	
	//1. 그룹 등록
	public int groupReg(BoardCommand command) throws ClassNotFoundException, SQLException;
	
	//1.1 가장 큰 그룹식별번호 얻기
	public String getGroupMaxSequence() throws ClassNotFoundException, SQLException;
	
	//2. 공통 게시물 등록
	public int historyReg(HistoryCommand command)  throws ClassNotFoundException, SQLException;

	//5. 사용자 게시물 조회
	public List<MemberBoardCommand> getBoards(String personalURI) throws ClassNotFoundException, SQLException;
	
	//6. 사용자 게시물 상세조회
	public List<BoardDetailView> getBoardDetail(int groupSeq) throws ClassNotFoundException, SQLException;
	
	//7. 사용자 그룹 게시물 조회
	public List<BoardGroup> getBoardGroup(String email,int startNum, int endNum) throws ClassNotFoundException, SQLException;

////////////////////////////
public List<MemberBoardCommand> getBoardsPage(String personalURI, int startNum, int endNum) throws ClassNotFoundException, SQLException;
	
	
}
