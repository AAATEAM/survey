package com.old;

import org.junit.Test;

import com.app.ea.hsql.Hsql;


public class TestApiTest extends ParentTest {

	@Test
	public void testApi() throws Exception {
		init();
		log.debug("用户个数=" + baseDao.find(Hsql.All_USER).size());
		log.debug("用户个数=" + infEa.getAllUser().size());
	}

	@Test
	public void testBaseDao() throws Exception {

		baseDao.find("from Test");
		log.debug("个数=" + baseDao.find("from Test").size());
	}

}
