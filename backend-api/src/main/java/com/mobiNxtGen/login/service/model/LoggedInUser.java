package com.mobiNxtGen.login.service.model;

import org.springframework.stereotype.Repository;

@Repository
public class LoggedInUser {

	Long userId;
	String userName;
	String password;
	Long companyId;
	Boolean isAllowedCreateUser;
	Boolean isAllowedEditUser;
	Boolean isAllowedCreateConf;
	Boolean isAllowedEditConf;
	

	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	public Boolean getIsAllowedCreateUser() {
		return isAllowedCreateUser;
	}
	public void setIsAllowedCreateUser(Boolean isAllowedCreateUser) {
		this.isAllowedCreateUser = isAllowedCreateUser;
	}
	public Boolean getIsAllowedEditUser() {
		return isAllowedEditUser;
	}
	public void setIsAllowedEditUser(Boolean isAllowedEditUser) {
		this.isAllowedEditUser = isAllowedEditUser;
	}
	public Boolean getIsAllowedCreateConf() {
		return isAllowedCreateConf;
	}
	public void setIsAllowedCreateConf(Boolean isAllowedCreateConf) {
		this.isAllowedCreateConf = isAllowedCreateConf;
	}
	public Boolean getIsAllowedEditConf() {
		return isAllowedEditConf;
	}
	public void setIsAllowedEditConf(Boolean isAllowedEditConf) {
		this.isAllowedEditConf = isAllowedEditConf;
	}
	
}
