package kr.co.skein.model.vo;

import java.util.Date;
import java.util.List;

public class HistoryCommand {

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

	private List<History> histories;
	private int groupSeq;
	private String groupName;
	private int isImportantGroup;
	private Date groupStartDate;
	private Date groupEndDate;
		
	public List<History> getHistories() {
		return histories;
	}
	public void setHistories(List<History> histories) {
		this.histories = histories;
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
