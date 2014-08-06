package kr.co.skein.model;

import java.util.Date;

public class HistoryPost {

	private int boardSeq;
	private String content;
	private Date writeDate;
	private int boardKindSeq;
	private String email;
	private int publicLevelCode;
	
	/*HistorySeq NUMBER NOT NULL,  기록식별번호 
	BoardSeq NUMBER NOT NULL,  글번호 
	StartDate DATE,  발생시작일 
	EndDate DATE,  발생종료일 
	Feelings VARCHAR2(127),  기분 
	Weather VARCHAR2(127),  날씨 
	IsImportant INT,  중요 
	IsShare INT,  공유 
	Keyword VARCHAR2(127),  핵심키워드 
	Place VARCHAR2(255),  장소 
	GroupSeq NUMBER  기록그룹식별번호 */
	
	private int historySeq;
	private Date startDate;
	private Date endDate;
	private String feeling;
	private String weather;
	private int isImportant;
	private int isShare;
	private String keyword;
	private String place;
	private int groupSeq;
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getBoardKindSeq() {
		return boardKindSeq;
	}
	public void setBoardKindSeq(int boardKindSeq) {
		this.boardKindSeq = boardKindSeq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPublicLevelCode() {
		return publicLevelCode;
	}
	public void setPublicLevelCode(int publicLevelCode) {
		this.publicLevelCode = publicLevelCode;
	}
	public int getHistorySeq() {
		return historySeq;
	}
	public void setHistorySeq(int historySeq) {
		this.historySeq = historySeq;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getFeeling() {
		return feeling;
	}
	public void setFeeling(String feeling) {
		this.feeling = feeling;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public int getIsImportant() {
		return isImportant;
	}
	public void setIsImportant(int isImportant) {
		this.isImportant = isImportant;
	}
	public int getIsShare() {
		return isShare;
	}
	public void setIsShare(int isShare) {
		this.isShare = isShare;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getGroupSeq() {
		return groupSeq;
	}
	public void setGroupSeq(int groupSeq) {
		this.groupSeq = groupSeq;
	}
	
	
	
	
}
