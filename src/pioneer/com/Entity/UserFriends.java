package pioneer.com.Entity;
// Generated 2016-2-3 12:08:39 by Hibernate Tools 4.3.1.Final

/**
 * UserFriends generated by hbm2java
 */
public class UserFriends implements java.io.Serializable {

	private Integer fid;
	private int uid;
	private int uinviteId;
	private Integer isInvited;

	public UserFriends() {
	}

	public UserFriends(int uid, int uinviteId) {
		this.uid = uid;
		this.uinviteId = uinviteId;
	}

	public UserFriends(int uid, int uinviteId, Integer isInvited) {
		this.uid = uid;
		this.uinviteId = uinviteId;
		this.isInvited = isInvited;
	}

	public Integer getFid() {
		return this.fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public int getUid() {
		return this.uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getUinviteId() {
		return this.uinviteId;
	}

	public void setUinviteId(int uinviteId) {
		this.uinviteId = uinviteId;
	}

	public Integer getIsInvited() {
		return this.isInvited;
	}

	public void setIsInvited(Integer isInvited) {
		this.isInvited = isInvited;
	}

}