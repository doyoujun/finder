
package com.spring.project.WebConfig;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
@ComponentScan(basePackages = {"com.spring.project.WebConfig"})
public class RootConfig {

	public RootConfig() {
		
	}
	
	public RootConfig(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext;
	}

	@Autowired
	private ApplicationContext applicationContext;
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate() throws Exception {
		return new SqlSessionTemplate((SqlSessionFactory) sqlSessionFactoryBean());
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactoryBean() throws Exception{
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource());
		sqlSessionFactory.setMapperLocations(applicationContext.getResources("classpath:com/spring/project/map/map.xml"));
		
		return (SqlSessionFactory)sqlSessionFactory.getObject();
	}
	@Bean
	public DataSourceTransactionManager transactionManager() {
		DataSourceTransactionManager transaction = new DataSourceTransactionManager();
		transaction.setDataSource(dataSource());
		return transaction;
	}
	
	@Bean
	public DriverManagerDataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
		dataSource.setUrl("jdbc:mariadb://183.111.126.218:3306/finderDB?allowMultiQueries=true");
		dataSource.setUsername("user");
		dataSource.setPassword("code0220!@");
		return dataSource;
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		commonsMultipartResolver.setMaxUploadSize(268435456);
		commonsMultipartResolver.setDefaultEncoding("UTF-8");
		
		return commonsMultipartResolver;
	}
}
