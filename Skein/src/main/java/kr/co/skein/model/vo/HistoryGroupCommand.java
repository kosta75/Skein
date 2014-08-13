package kr.co.skein.model.vo;

import java.util.Date;
import java.util.List;

public class HistoryGroupCommand {

	private List<HistoryCommand> list;
	private int groupSeq;
	private String groupName;
	private int isImportantGroup;
	private Date groupStartDate;
	private Date groupEndDate;
	
	public List<HistoryCommand> getList() {
		return list;
	}
	public void setList(List<HistoryCommand> list) {
		this.list = list;
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
