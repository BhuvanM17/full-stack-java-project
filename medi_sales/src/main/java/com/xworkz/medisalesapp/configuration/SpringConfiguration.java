package com.xworkz.medisalesapp.configuration;

import com.xworkz.medisalesapp.constant.Constants;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.templatemode.TemplateMode;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.xworkz.medisalesapp")
public class SpringConfiguration implements WebMvcConfigurer {
    public SpringConfiguration() {

    }

    @Bean
    public LocalContainerEntityManagerFactoryBean managerFactoryBean() {
        LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
        bean.setPackagesToScan("com.xworkz.medisalesapp.entity");
        bean.setDataSource(getDataSource());
        bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        bean.setJpaProperties(getProperties());
        return bean;
    }

    @Bean
    public DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setPassword(System.getenv("DB_PASSWORD"));
        
        String dbUrl = System.getenv("DB_URL");
        if (dbUrl != null) {
            // Remove 'postgres://' or 'postgresql://' and replace with 'jdbc:postgresql://'
            if (dbUrl.startsWith("postgres://")) {
                dbUrl = dbUrl.replace("postgres://", "jdbc:postgresql://");
            } else if (dbUrl.startsWith("postgresql://")) {
                dbUrl = dbUrl.replace("postgresql://", "jdbc:postgresql://");
            } else if (!dbUrl.startsWith("jdbc:")) {
                dbUrl = "jdbc:postgresql://" + dbUrl;
            }

            // If the URL contains credentials (user:pass@host), strip them for the JDBC URL
            // Example: jdbc:postgresql://user:pass@host:port/db -> jdbc:postgresql://host:port/db
            if (dbUrl.contains("@")) {
                int startIndex = dbUrl.indexOf("://") + 3;
                int atIndex = dbUrl.indexOf("@");
                dbUrl = dbUrl.substring(0, startIndex) + dbUrl.substring(atIndex + 1);
            }
        }
        
        dataSource.setUrl(dbUrl);
        dataSource.setUsername(System.getenv("DB_USERNAME"));
        return dataSource;
    }

    @Bean
    public Properties getProperties() {
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        properties.setProperty("hibernate.hbm2ddl.auto", "update");
        return properties;
    }

    @Bean
    public ViewResolver viewResolver() {

        return new InternalResourceViewResolver("/", ".jsp");
    }
    @Bean
    public MultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }
    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername(Constants.FROM_EMAIL.getPath());
        mailSender.setPassword(Constants.PASSWORD.getPath());

        Properties properties = mailSender.getJavaMailProperties();
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.debug", "true");

        return mailSender;
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("/**").addResourceLocations("/");
    }
    @Bean
    public SpringResourceTemplateResolver springResourceTemplateResolver()
    {
        SpringResourceTemplateResolver springResourceTemplateResolver = new SpringResourceTemplateResolver();
        springResourceTemplateResolver.setPrefix("template/");
        springResourceTemplateResolver.setSuffix(".html");
        springResourceTemplateResolver.setTemplateMode(TemplateMode.HTML);
        springResourceTemplateResolver.setCharacterEncoding("UTF-8");
        return springResourceTemplateResolver;
    }


    @Bean
    public TemplateEngine templateEngine()
    {
        TemplateEngine templateEngine = new TemplateEngine();
        templateEngine.setTemplateResolver(springResourceTemplateResolver());
        return templateEngine;
    }
}
