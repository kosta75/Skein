package kr.co.skein.model.vo;

import java.util.Date;
import java.util.List;


public class BoardGroup {
	
	/*bg.GroupSeq, bg.GroupName, bg.IsImportantGroup, bg.GroupStartDate, bg.GroupEndDate,
	b.GroupCount, b.BoardSeq, b.Email, b.BOARDKINDSEQ, b.CONTENT, b.WRITEDATE, b.PUBLICLEVELCODE, b.ISACTIVATED,
	h.STARTDATE, h.ENDDATE, h.FEELINGS, h.WEATHER, h.ISIMPORTANT, h.ISSHARE, h.KEYWORD, h.PLACE,
	me.FILENAME, me.FILESIZE, me.EXTENSION*/
	private int replyCount;
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	private int rownum; 
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	private String groupSeq;
	private String groupName;
	private int isImportantGroup;
	private Date groupStartDate;
	private Date groupEndDate;

	private int groupCount;
	private String boardSeq;
	private String email;
	private String content;
	private int boardKindSeq;
	private int publicLevelCode;
	private int isActivated;
	private Date writeDate;
	private Date startDate;
	private Date endDate;
	private String feelings;
	private int isImportant;
	private int isShare;
	private String keyword;
	private String place;
	
	private String fileName;
	private int fileSize;
	private String extension;
	private List<Reply> replyList;
	public List<Reply> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}
	private String fullName;
	private Date birthday;
	private String personalURI;
	
	private String resourceOwnerFullName;
	private String resourceOwnerPersonalURI;
	
	
	
	public String getResourceOwnerFullName() {
		return resourceOwnerFullName;
	}
	public void setResourceOwnerFullName(String resourceOwnerFullName) {
		this.resourceOwnerFullName = resourceOwnerFullName;
	}
	public String getResourceOwnerPersonalURI() {
		return resourceOwnerPersonalURI;
	}
	public void setResourceOwnerPersonalURI(String resourceOwnerPersonalURI) {
		this.resourceOwnerPersonalURI = resourceOwnerPersonalURI;
	}
	public String getGroupSeq() {
		return groupSeq;
	}
	public void setGroupSeq(String groupSeq) {
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
	public int getGroupCount() {
		return groupCount;
	}
	public void setGroupCount(int groupCount) {
		this.groupCount = groupCount;
	}
	public String getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
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
	public int getBoardKindSeq() {
		return boardKindSeq;
	}
	public void setBoardKindSeq(int boardKindSeq) {
		this.boardKindSeq = boardKindSeq;
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
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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
	public String getPersonalURI() {
		return personalURI;
	}
	public void setPersonalURI(String personalURI) {
		this.personalURI = personalURI;
	}
		
}
