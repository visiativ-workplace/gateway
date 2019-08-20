package com.visiativ.moovapps.gateway;

import com.ecwid.consul.v1.ConsulClient;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.consul.ConsulProperties;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Profile;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
@Profile("auto-configure")
public class ConsulConfigurationAutoLoader implements ApplicationRunner {

	private ConsulProperties consulProperties;
	private ConsulClient consulClient;

	public ConsulConfigurationAutoLoader(ConsulProperties consulProperties, ConsulClient consulClient) {
		this.consulProperties = consulProperties;
		this.consulClient = consulClient;
	}

	@Override
	public void run(ApplicationArguments args) throws Exception {
		// the default is to check if
		System.out.println("auto load configuration");

		consulClient.setKVBinaryValue("microservices/gateway,auto-configure/data", IOUtils.toByteArray(
				ConsulConfigurationAutoLoader.class.getResourceAsStream("/auto-configure/application.yml")));
	}
}
