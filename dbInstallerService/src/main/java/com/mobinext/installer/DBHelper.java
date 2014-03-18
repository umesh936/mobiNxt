package com.mobinext.installer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import org.apache.log4j.Logger;

public class DBHelper {

	private static final Logger logger = Logger.getLogger(DBHelper.class);
	private static Connection con = null;

	/**
	 * Create connection With DB
	 */
	public static boolean initalizeDB() {

		try {
			Class.forName(PropertyReader.readProperty(Constant.DRIVER));
			String url = PropertyReader.readProperty(Constant.URL) + "//"
					+ PropertyReader.readProperty(Constant.IP_PORT) + "/"
					+ PropertyReader.readProperty(Constant.DATABASE_NAME)
					+ "?createDatabaseIfNotExist=true";

			logger.debug(url);
			con = DriverManager.getConnection(url,
					PropertyReader.readProperty(Constant.USER_NAME),
					PropertyReader.readProperty(Constant.PASSWORD));
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * Create table
	 */
	public static boolean executeQuery(String queryToExecute, boolean isDMLQuery) {
		try {
			Statement statement = null;
			// statements allow to issue SQL queries to the database
			statement = con.createStatement();
			// resultSet gets the result of the SQL query
			if (isDMLQuery)
				statement.executeUpdate(queryToExecute);
			else
				statement.executeQuery(queryToExecute);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
}
