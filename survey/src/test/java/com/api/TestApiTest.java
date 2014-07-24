package com.api;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;

import com.app.ea.hsql.Hsql;
import com.app.ea.model.Organize;
import com.app.ea.model.Role;
import com.app.ea.model.User;

public class TestApiTest extends ParentTest {


	@Test
	public void test_infEa_getAllUser() throws Exception {
		log.debug("个数=" + infEa.getAllUser().size());
	}
	
	@Test
	public void test_infEa_getQueryUser() throws Exception {
		String hsql = Hsql.All_USER + "where  upper(assessLev) like '%B%'";
		List countList = baseDao.find(hsql);
		log.debug("查询个数"+countList.size());
	}
	
	//根据项目ID取得展开所在项目的 
	@Test
	public void test_userlist_by_roletree() throws Exception {
		List roleList=new ArrayList();
		for (Iterator iterator = infEa.getOrganizeByAlias("organize-project").getChildOrganizes().iterator(); iterator.hasNext();) {
			Organize organize = (Organize) iterator.next();
			roleList.addAll(organize.getRoles());
			log.debug(organize.getName()+"角色个数"+organize.getRoles().size());
		} 
		for (Iterator iterator = roleList.iterator(); iterator.hasNext();) {
			Role role = (Role) iterator.next();
			log.debug("角色名称"+role.getName());
		}
		
	}
	
	@Test
	public void test_infEa_getOrganizeByOrganizegroupAlias() throws Exception {
		//log.debug("个数=" + infEa.getOrganizeByOrganizegroupAlias("company").size());
		
		for (Iterator iterator = infEa.getOrganizeByOrganizegroupAlias("project").iterator(); iterator.hasNext();) {
			Organize organize = (Organize) iterator.next();
			log.debug(organize.getName());
			for (Iterator iterator2 = infEa.getAllUserByOrganize(organize).iterator(); iterator2
					.hasNext();) {
				User user = (User) iterator2.next();
				log.debug(user.getName());
			}
		}
	}


}
