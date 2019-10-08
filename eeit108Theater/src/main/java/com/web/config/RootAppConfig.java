package com.web.config;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.web")
public class RootAppConfig {
	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		try (InputStream input = getClass().getClassLoader()
				.getResourceAsStream("dataSourceConfig.properties")) {
			Properties prop = new Properties();
			if (input == null)
				System.out.println(
						"=====請自OneDrive下載dataSourceConfig.properties放在src/main/resources內，並修改其中的user & password以對應己身電腦之資料庫=====");
			prop.load(input);
			ds.setUser(prop.getProperty("ds.user"));
			ds.setPassword(prop.getProperty("ds.password"));
			ds.setDriverClass(prop.getProperty("ds.driverClass"));
			ds.setJdbcUrl(prop.getProperty("ds.jdbcUrl"));
			ds.setInitialPoolSize(Integer.valueOf(prop.getProperty("ds.initPoolSize")));
			ds.setMaxPoolSize(Integer.valueOf(prop.getProperty("ds.maxPoolSize")));
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			System.out.println(
					"=====請自OneDrive下載dataSourceConfig.properties放在src/main/resources內，並修改其中的user & password以對應己身電腦之資料庫=====");
			e1.printStackTrace();
		}
		return ds;
	}

	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setPackagesToScan(new String[] { "com.web", "ecpay" });
		factory.setHibernateProperties(additionalProperties());
		return factory;
	}

	@Bean(name = "transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}

	private Properties additionalProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
		properties.put("hibernate.show_sql", Boolean.FALSE);
//		properties.put("hibernate.show_sql", Boolean.TRUE);
		//properties.put("hibernate_format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}
	
	private Properties javaMailProperties() {
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", Boolean.TRUE);
		properties.put("mail.smtp.starttls.enable", Boolean.TRUE);
		return properties;
	}
	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost("smtp.gmail.com");
		sender.setUsername("eeit108sevenminusone@gmail.com");
		sender.setPassword("SevenMinus1");
		sender.setPort(587);
		sender.setJavaMailProperties(javaMailProperties());
		return sender;
	}
}
