package com.mobiNxtGen.login.service.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Named;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.mobiNxtGen.login.service.model.LoggedInUser;

@Named
public class LoginServiceDao {

	private static final Logger logger = Logger
			.getLogger(LoginServiceDao.class);

	@Resource
	DataSource dataSource;

	private JdbcTemplate jdbcTemplate;

	public LoggedInUser getUser(String userName, String password) {

		jdbcTemplate = new JdbcTemplate(dataSource);
		List<LoggedInUser> userList = jdbcTemplate.query(
				"Select * from LOGIN_DETAILS where USER_NAME like '" + userName
						+ "' and PASSWORD like '" + password + "'",
				new BeanPropertyRowMapper(LoggedInUser.class));
		if (userList.size() == 1)
			return userList.get(0);
		return null;

	}
}
