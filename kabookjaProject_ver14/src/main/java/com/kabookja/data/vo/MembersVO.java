package com.kabookja.data.vo;

public class MembersVO {
	private String memberID;	//아이디
	private String memberPW;	//비밀번호
	private String nickname;	//닉네임
	private String memberName;	//이름
	private String memberPhoneNumber;	//전화번호
	private String memberAddress;	//주소
	private String memberBirth;	//생년월일
	private String memberGrade;	//회원등급
	private int memberMileage;	//마일리지
	private String ebookMembership;	//ebook멤버쉽구독여부
	
	public MembersVO() {}
	public MembersVO(String memberID, String memberPW, String nickname, String memberName, String memberPhoneNumber,
			String memberAddress, String memberBirth, String memberGrade, int memberMileage, String ebookMembership) {
		this.memberID = memberID;
		this.memberPW = memberPW;
		this.nickname = nickname;
		this.memberName = memberName;
		this.memberPhoneNumber = memberPhoneNumber;
		this.memberAddress = memberAddress;
		this.memberBirth = memberBirth;
		this.memberGrade = memberGrade;
		this.memberMileage = memberMileage;
		this.ebookMembership = ebookMembership;
	}
	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getMemberPW() {
		return memberPW;
	}

	public void setMemberPW(String memberPW) {
		this.memberPW = memberPW;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhoneNumber() {
		return memberPhoneNumber;
	}

	public void setMemberPhoneNumber(String memberPhoneNumber) {
		this.memberPhoneNumber = memberPhoneNumber;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public int getMemberMileage() {
		return memberMileage;
	}

	public void setMemberMileage(int memberMileage) {
		this.memberMileage = memberMileage;
	}

	public String getEbookMembership() {
		return ebookMembership;
	}

	public void setEbookMembership(String ebookMembership) {
		this.ebookMembership = ebookMembership;
	}
}
