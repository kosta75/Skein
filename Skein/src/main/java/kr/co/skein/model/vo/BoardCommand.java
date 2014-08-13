package kr.co.skein.model.vo;

import java.util.Date;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class BoardCommand {
	
	@JsonIgnore
	private List<MultipartFile> files;
	
	private int boardSeq;
	private int boardKindSeq;
	private String email;
	private String content;
	private Date writeDate;
	private int publicLevelCode;
	private int isActivated;
	
	private String feelings;
	private String weather;
	private int isImportant;
	private int isShare;
	private String keyword;
	private String place;
	
	private int groupSeq;
	private String groupName;
	private int isImportantGroup;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date groupStartDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date groupEndDate;
	
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
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
	
	
	
}
