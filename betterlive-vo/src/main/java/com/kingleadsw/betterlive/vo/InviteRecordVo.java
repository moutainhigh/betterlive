package com.kingleadsw.betterlive.vo;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.kingleadsw.betterlive.core.dto.BaseVO;

import java.io.Serializable;


/**
 * 邀请记录
 */
@JsonSerialize(include=JsonSerialize.Inclusion.NON_EMPTY)
public class InviteRecordVo  extends BaseVO implements Serializable{
	
	private static final long serialVersionUID = -6684653438894879990L;
	
	private int recordId;		//id
    private int customerId;		//被邀请人ID
    private int inviteId;		//邀请人ID
    private String createTime;	
    private int inviteReasonId;	//邀请理由id
    private int inviteFlag;		//邀请状态：0默认， 1已发出邀请， 2已完成邀请
    
	public int getRecordId() {
		return recordId;
	}
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getInviteId() {
		return inviteId;
	}
	public void setInviteId(int inviteId) {
		this.inviteId = inviteId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getInviteFlag() {
		return inviteFlag;
	}
	public void setInviteFlag(int inviteFlag) {
		this.inviteFlag = inviteFlag;
	}
	public int getInviteReasonId() {
		return inviteReasonId;
	}
	public void setInviteReasonId(int inviteReasonId) {
		this.inviteReasonId = inviteReasonId;
	}
    
}