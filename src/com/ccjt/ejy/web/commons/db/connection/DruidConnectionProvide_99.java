package com.ccjt.ejy.web.commons.db.connection;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.commons.dbutils.DbUtils;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class DruidConnectionProvide_99 implements ConnectionProvide {

	private static Logger log = LogManager.getLogger(DruidConnectionProvide_99.class);

	private static boolean autoCommit = false;
	private static com.alibaba.druid.pool.DruidDataSource cpds = null;
	private static String jdbcUrl = null;
	private static String user = null;
	private static String password = null;
	private static final int initialPoolSize = 10;
	private static final int maxPoolSize = 200;
	private static final int minIdle = 10;

	static {
		InputStream is = null;
		Properties dbProps = new Properties();
		try {

			is = DruidConnectionProvide_99.class.getResourceAsStream("/jdbc.properties");

			dbProps.load(is);
			jdbcUrl = dbProps.getProperty("url_slave");
			user = dbProps.getProperty("user_slave");
			password = dbProps.getProperty("password_slave");
			DruidConnectionProvide_99.cpds = new com.alibaba.druid.pool.DruidDataSource();
			DruidConnectionProvide_99.cpds.setUrl(jdbcUrl);
			DruidConnectionProvide_99.cpds.setUsername(user);
			DruidConnectionProvide_99.cpds.setPassword(password);
			DruidConnectionProvide_99.cpds.setInitialSize(initialPoolSize);
			DruidConnectionProvide_99.cpds.setMinIdle(minIdle);
			DruidConnectionProvide_99.cpds.setMaxActive(maxPoolSize);
			DruidConnectionProvide_99.cpds.setMaxWait(10000);
			DruidConnectionProvide_99.cpds.setTimeBetweenEvictionRunsMillis(60000);
			DruidConnectionProvide_99.cpds.setMinEvictableIdleTimeMillis(300000);
			DruidConnectionProvide_99.cpds.setValidationQuery("SELECT 'x'");
			DruidConnectionProvide_99.cpds.setTestWhileIdle(true);
			DruidConnectionProvide_99.cpds.setTestOnBorrow(false);
			DruidConnectionProvide_99.cpds.setPoolPreparedStatements(true);
			DruidConnectionProvide_99.cpds.setMaxPoolPreparedStatementPerConnectionSize(20);
			log.info("初始化连接池成功:url=" + jdbcUrl + " user = " + user + " passowrd=****");
		} catch (Exception e) {
			log.error("jdbc资源文件load出错:",e);
			e.printStackTrace();
		}finally{
			try{
				if(is!=null)is.close();
			}catch (Exception e) {
			}
			
		}
	}


	public Connection getConnection() {
		Connection conn = null;

			try {
				conn = cpds.getConnection();
				conn.setAutoCommit(autoCommit);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			log.info("获取连接.." + conn.hashCode());

		return conn;
	}


	@Deprecated
	public Connection getJDBCConnection() {
		// TODO Auto-generated method stub
		return null;
	}


	@Deprecated
	public void rollback() {
		// TODO Auto-generated method stub
		
	}


	@Deprecated
	public void commit() {
		// TODO Auto-generated method stub
		
	}


	@Deprecated
	public void close() {
		// TODO Auto-generated method stub
		
	}




}