package com.kabookja.data.vo;

public class ServiceCenterVO {
	private String helpNum;
	private String helpID;
	private String memberID;
	private String helpTitle;
	private String helpWritedate;
	private String helpContent;
	private int helpSortation;
	
	public ServiceCenterVO() {}
	public ServiceCenterVO(String helpNum,String helpID, String memberID, String helpTitle, String writedate, String helpContent,
			int helpSortation) {
		this.helpNum=helpNum;
		this.helpID = helpID;
		this.memberID = memberID;
		this.helpTitle = helpTitle;
		this.helpWritedate = writedate;
		this.helpContent = helpContent;
		this.helpSortation = helpSortation;
	}
	public String getHelpID() {
		return helpID;
	}
	public void setHelpID(String helpID) {
		this.helpID = helpID;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getHelpTitle() {
		return helpTitle;
	}
	public void setHelpTitle(String helpTitle) {
		this.helpTitle = helpTitle;
	}
	public String getHelpWritedate() {
		return helpWritedate;
	}
	public void setHelpWritedate(String writedate) {
		helpWritedate = writedate;
	}
	public String getHelpContent() {
		return helpContent;
	}
	public void setHelpContent(String helpContent) {
		this.helpContent = helpContent;
	}
	public int getHelpSortation() {
		return helpSortation;
	}
	public void setHelpSortation(int helpSortation) {
		this.helpSortation = helpSortation;
	}
	public String getHelpNum() {
		return helpNum;
	}
	public void setHelpNum(String helpNum) {
		this.helpNum = helpNum;
	}
}
