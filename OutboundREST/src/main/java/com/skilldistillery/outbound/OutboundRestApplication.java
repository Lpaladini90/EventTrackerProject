package com.skilldistillery.outbound;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class OutboundRestApplication extends SpringBootServletInitializer{


	  @Override
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    return application.sources(OutboundRestApplication.class);
	  }
	
	
	public static void main(String[] args) {
		SpringApplication.run(OutboundRestApplication.class, args);
	}

}
