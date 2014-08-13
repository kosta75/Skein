package kr.co.skein.model.vo;

import java.util.Date;

public class DailyCommand extends BoardCommand {

	private int dailySeq;
	private Date lastUpdateDate;
	
	public int getDailySeq() {
		return dailySeq;
	}
	public void setDailySeq(int dailySeq) {
		this.dailySeq = dailySeq;
	}
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

}
