package kr.co.skein.model.vo;

import java.util.Date;

public class MemberBoardCommand {

	/*m.EMAIL, m.FULLNAME, m.BIRTHDAY, m.PERSONALURI,
	b.BOARDSEQ, b.BOARDKINDSEQ, b.CONTENT, b.WRITEDATE,
	b.PUBLICLEVELCODE, b.ISACTIVATED, b.GROUPSEQ,
	h.HISTORYSEQ, h.STARTDATE, h.ENDDATE, h.FEELINGS,
	h.WEATHER, h.ISIMPORTANT, h.ISSHARE, h.KEYWORD, h.PLACE,
	bg.GROUPNAME, bg.ISIMPORTANTGROUP, bg.GROUPSTARTDATE, bg.GROUPENDDATE
	me.MEDIASEQ, me.FILENAME, me.FILESIZE, me.EXTENSION*/
	private int rownum;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	private String email;
	private String fullName;
	private Date birthday;
	private String personaURI;
	
	private String boardSeq;
	private int boardKindSeq;
	private String content;
	private Date writeDate;
	private int publicLevelCode;
	private int isActivated;
	private int groupSeq;

	private Date startDate;
	private Date endDate;
	private String feelings;
	private String weather;
	private int isImportant;
	private int isShare;
	private String keyword;
	private String place;
	
	/*bg.GROUPNAME, bg.ISIMPORTANTGROUP, bg.GROUPSTARTDATE, bg.GROUPENDDATE
	me.MEDIASEQ, me.FILENAME, me.FILESIZE, me.EXTENSION*/
	private String groupName;
	private int isImportantGroup;
	private Date groupStartDate;
	private Date groupEndDate;
	
	private String fileName;
	private int fileSize;
	private String extension;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPersonaURI() {
		return personaURI;
	}
	public void setPersonaURI(String personaURI) {
		this.personaURI = personaURI;
	}

	public int getBoardKindSeq() {
		return boardKindSeq;
	}
	public void setBoardKindSeq(int boardKindSeq) {
		this.boardKindSeq = boardKindSeq;
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
	public int getGroupSeq() {
		return groupSeq;
	}
	public void setGroupSeq(int groupSeq) {
		this.groupSeq = groupSeq;
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

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}

}
