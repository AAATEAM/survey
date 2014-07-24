package com.oa;

import java.io.File;
import java.io.FileInputStream;
import java.util.Date;

import org.activiti.engine.RepositoryService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UpdateBpmnFile {

	public static void main(String[] args) {
		String file_name = "src/test/resources/com/app/manager/oa/xml/ag_task_assignment.bpmn20.xml";
		File file = new File(file_name);
		// System.out.println(file.exists());
		// System.out.println(file.getAbsolutePath());
		// String config_file = "spring-activiti.xml";

		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"spring-activiti.xml");
		RepositoryService repSer = (RepositoryService) applicationContext
				.getBean("repositoryService");
		try {
			repSer.createDeployment()
					.addInputStream(file_name, new FileInputStream(file))
					.name(file.getName() + "-" + new Date()).deploy();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
