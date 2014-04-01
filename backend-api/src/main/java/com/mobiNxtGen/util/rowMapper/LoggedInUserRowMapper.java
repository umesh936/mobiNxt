package com.mobiNxtGen.util.rowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mobiNxtGen.login.service.model.LoggedInUser;

public class LoggedInUserRowMapper implements RowMapper<LoggedInUser> {

	@Override
	public LoggedInUser mapRow(ResultSet rs, int rowNum) throws SQLException {
		LoggedInUser user = new LoggedInUser();
		user.setUserId(rs.getLong("USER_ID"));
		user.setUserName(rs.getString("USER_NAME"));
		user.setCompanyId(rs.getLong("COMPANY_ID"));
		user.setIsAllowedCreateUser(rs.getBoolean("IS_ALLOW_CREATE_USER"));
		user.setIsAllowedCreateConf(rs.getBoolean("IS_ALLOW_CREATE_CONF"));
		user.setIsAllowedEditUser(rs.getBoolean("IS_ALLOW_EDIT_USER"));
		user.setIsAllowedEditConf(rs.getBoolean("IS_ALLOW_EDIT_CONF"));
		return user;
	}

}
