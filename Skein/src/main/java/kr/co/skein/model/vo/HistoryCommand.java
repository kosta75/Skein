package kr.co.skein.model.vo;

import java.util.Date;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class HistoryCommand{

	/*PK	BOARDSEQ	NUMBER		N	글번호
	BOARDKINDSEQ	NUMBER		N	게시판번호
	EMAIL	VARCHAR2(127 BYTE)		N	이메일
	CONTENT	VARCHAR2(127 BYTE)		N	내용
	WRITEDATE	DATE		N	작성일
	PUBLICLEVELCODE	NUMBER	0 	N	공개범위코드
	ISACTIVATED	NUMBER			활성화*/
	
	/*HistorySeq(PK)	기록식별번호(PK)	인덱스	NUMBER	NOT NULL
	BoardSeq(FK)	글번호(FK)	인덱스	NUMBER	NOT NULL
	StartDate	발생시작일	일시	DATE	NULL
	EndDate	발생종료일	일시	DATE	NULL
	Feelings	기분	내용	VARCHAR2(127)	NULL
	Weather	날씨	내용	VARCHAR2(127)	NULL
	IsImportant	중요	Y/N	INT	NULL
	IsShare	공유	Y/N	INT	NULL
	Keyword	핵심키워드	내용	VARCHAR2(127)	NULL
	Place	장소	주소	VARCHAR2(255)	NULL
	GroupSeq(FK)	기록그룹식별번호(FK)	인덱스	NUMBER	NULL*/

	/*GroupSeq(PK)	과거기록그룹식별번호(PK)	인덱스	NUMBER	NOT NULL
	GroupName	과거기록그룹명	이름	VARCHAR2(127)	NOT NULL
	IsImportantGroup	중요그룹	Y/N	INT	NULL
	GroupStartDate	그룹발생시작일	일시	DATE	NULL
	GroupEndDate	그룹발생종료일	일시	DATE	NULL*/
	
	@JsonIgnore
	private List<MultipartFile> files;
	
	private int boardSeq;
	private int boardKindSeq;
	private String email;
	private String content;
	private Date writeDate;
	private int publicLevelCode;
	private int isActivated;
	
	private int historySeq;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	
	private String feelings;
	private String weather;
	private int isImportant;
	private int isShare;
	private String keyword;
	private String place;
	
	private int groupSeq;
	private String groupName;
	private int isImportantGroup;
	private Date groupStartDate;
	private Date groupEndDate;
	
	

	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
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

	public int getPublicLevelCode() {
		return publicLevelCode;
	}

	public void setPublicLevelCode(int publicLevelCode) {
		this.publicLevelCode = publicLevelCode;
	}

	public int getIsActivated() {
		return isActivated;
	}

	public void setIsActivated(int isActivated) {
		this.isActivated = isActivated;
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

	public String getFeelings() {
		return feelings;
	}

	public void setFeelings(String feelings) {
		this.feelings = feelings;
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

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getIsImportantGroup() {
		return isImportantGroup;
	}

	public void setIsImportantGroup(int isImportantGroup) {
		this.isImportantGroup = isImportantGroup;
	}

	public Date getGroupStartDate() {
		return groupStartDate;
	}

	public void setGroupStartDate(Date groupStartDate) {
		this.groupStartDate = groupStartDate;
	}

	public Date getGroupEndDate() {
		return groupEndDate;
	}

	public void setGroupEndDate(Date groupEndDate) {
		this.groupEndDate = groupEndDate;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
}
