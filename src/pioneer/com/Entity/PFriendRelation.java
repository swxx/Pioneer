package pioneer.com.Entity;
// Generated 2016-2-20 10:42:35 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * PFriendRelation generated by hbm2java
 */
public class PFriendRelation implements java.io.Serializable {

	private Integer id;
	private int UUid;
	private int FUid;
	private Integer isShield;
	private Integer isFriends;
	private Date createdTime;
	private String inviteContent;
	private Integer isPass;

	public PFriendRelation() {
	}

	public PFriendRelation(int UUid, int FUid, Date createdTime) {
		this.UUid = UUid;
		this.FUid = FUid;
		this.createdTime = createdTime;
	}

	public PFriendRelation(int UUid, int FUid, Integer isShield, Integer isFriends, Date createdTime,
			String inviteContent, Integer isPass) {
		this.UUid = UUid;
		this.FUid = FUid;
		this.isShield = isShield;
		this.isFriends = isFriends;
		this.createdTime = createdTime;
		this.inviteContent = inviteContent;
		this.isPass = isPass;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getUUid() {
		return this.UUid;
	}

	public void setUUid(int UUid) {
		this.UUid = UUid;
	}

	public int getFUid() {
		return this.FUid;
	}

	public void setFUid(int FUid) {
		this.FUid = FUid;
	}

	public Integer getIsShield() {
		return this.isShield;
	}

	public void setIsShield(Integer isShield) {
		this.isShield = isShield;
	}

	public Integer getIsFriends() {
		return this.isFriends;
	}

	public void setIsFriends(Integer isFriends) {
		this.isFriends = isFriends;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getInviteContent() {
		return this.inviteContent;
	}

	public void setInviteContent(String inviteContent) {
		this.inviteContent = inviteContent;
	}

	public Integer getIsPass() {
		return this.isPass;
	}

	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}

}
