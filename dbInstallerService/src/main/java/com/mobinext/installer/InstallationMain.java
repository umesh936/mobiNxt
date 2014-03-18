package com.mobinext.installer;

import org.apache.log4j.Logger;

public class InstallationMain {
	private static final Logger logger = Logger
			.getLogger(InstallationMain.class);

	public static void main(String[] args) {
		try {
			if (PropertyReader.loadProperties()) {
				logger.debug("Properties intiliazed.");
			}
			if (DBHelper.initalizeDB()) {
				logger.debug("Database intiliazed.");
			}
			String tableNamesStr = PropertyReader
					.readProperty(Constant.TABLE_NAMES);
			if (tableNamesStr == null) {
				logger.debug(" Property Missing Table Names.");
				return;
			}
			// TODO: change variable name
			String tableNamesArr[] = tableNamesStr.split(Constant.SEPERATOR);
			logger.debug("Total Table Found. " + tableNamesArr.length);
			String query = "";
			for (String tableName : tableNamesArr) {
				logger.debug("Creating Table :" + tableName);
				tableName = tableName.trim();
				query = "Create table " + tableName + " ( ";
				int totalField = Integer.parseInt(PropertyReader
						.readProperty(tableName + Constant.TOTAL_FIELD));
				for (int i = 1; i <= totalField; i++) {
					String fieldStr = PropertyReader.readProperty(tableName
							+ Constant.FIELD + i);
					String fieldArr[] = fieldStr.split(Constant.SEPERATOR);
					for (String temp : fieldArr) {
						query = query + temp.trim() + " ";
					}
					query = query + " " + Constant.SEPERATOR;
				}
				query = query.substring(0,
						query.lastIndexOf(Constant.SEPERATOR) - 1);
				query = query + getForeignKeyInfo(tableName);
				query = query + " );";
				logger.debug("Query is : " + query);
				DBHelper.executeQuery(query, true);
				logger.debug(tableName + " Table created Successfully.");

			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("Exception");
		}
	}

	public static String getForeignKeyInfo(String tableName) throws Exception {
		String queue = "";
		String totalConStr = PropertyReader.readProperty(tableName
				+ Constant.TOTAL_CONSTRAINT);
		if (totalConStr == null)
			return queue;
		queue = ",";
		for (int i = 1; i <= Integer.parseInt(totalConStr); i++) {
			queue = queue
					+ PropertyReader.readProperty(tableName
							+ Constant.CONSTRAINT + i).trim();
			queue = queue + " ";

		}
		logger.debug("Query returning from :  " + queue);
		return queue;
	}
}
