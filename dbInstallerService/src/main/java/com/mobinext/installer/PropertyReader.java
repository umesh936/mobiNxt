package com.mobinext.installer;

import java.io.InputStream;
import java.net.URL;
import java.util.Properties;

import org.apache.log4j.Logger;

public class PropertyReader {
	private static final Logger logger = Logger.getLogger(PropertyReader.class);
	private static Properties prop = new Properties();

	/**
	 * Read Properties file
	 */
	public static boolean loadProperties() throws Exception {

		URL resourceUrl = InstallationMain.class.getClassLoader().getResource(
				Constant.PROPERTY_FILE);
		InputStream inStream = resourceUrl.openStream();
		prop.load(inStream);
		logger.debug("Property file Loaded.");
		return true;

	}

	/**
	 * read property from property file
	 */
	public static String readProperty(String key) throws Exception {
		logger.info("Reding Property : " + key);
		String value = null;
		value = prop.getProperty(key);
		if (value == null) {
			logger.error("Property missing : " + key);
		}
		return value;
	}
}
