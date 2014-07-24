package com.app.survey.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.task.Task;
import org.apache.struts2.ServletActionContext;
import org.restlet.representation.Representation;
import org.restlet.resource.ClientResource;
import org.restlet.resource.ResourceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.app.common.activiti.action.BaseProcessAction;
import com.app.common.activiti.api.OaTask;
import com.app.common.base.action.BaseEaAction;
import com.app.common.spring.ssh.page.Pagination;
import com.app.ea.model.User;
import com.app.exam.action.ExamAction;
import com.app.exam.model.Examarrange;
import com.app.exam.model.Examrecord;
import com.app.exam.model.Item;
import com.app.exam.model.Knowledge;
import com.app.exam.model.Monitor;
import com.app.exam.model.Paper;
import com.app.exam.model.Papergroup;
import com.app.exam.model.Result;
import com.app.exam.util.ExcelUtil;
import com.utils.cache.Cache;
import com.utils.hardinfo.HardInfo;
import com.utils.time.TimeUtil;

@Scope("prototype")
@Component("surveyAction")
public class SurveyAction extends ExamAction {
	private static Logger log = LoggerFactory.getLogger(SurveyAction.class);
	
	
	public String survey_list() throws Exception{
		int currentpage = 0, maxSize = 10, count = 0, maxPage = 0;
		if("".equals(getpara("pageId"))) currentpage = 1;
		else currentpage = Integer.parseInt(getpara("pageId")) + 1;
		
		if(!"".equals(getpara("maxSize"))) maxSize = Integer.parseInt(getpara("maxSize"));
		if(!"".equals(getpara("count"))) maxSize = Integer.parseInt(getpara("count"));
		if(!"".equals(getpara("maxPage"))) maxSize = Integer.parseInt(getpara("maxPage"));
		
		
		
		pagination.setMaxSize(maxSize);
		pagination.setTotalSize(count);
		pagination.setCurrentPage(currentpage);
		System.out.println("curepage, maxsize, totalpage, totalsize");
		System.out.println(pagination.getCurrentPage() + "  " + pagination.getMaxSize() + "  " + pagination.getTotalPage() + " " + pagination.getTotalSize());
		try {
			String[] params = {"open", getCurrentAccount()};
			rhs.put("datalist", baseDao.page("from Examarrange a where status = 'open'", pagination));
			rhs.put("examRecordList", baseDao.find("from Examrecord a where userid='"+getCurrentAccount()+"'"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		rhs.put("maxSize", pagination.getMaxSize());
		rhs.put("count", pagination.getTotalSize());
		rhs.put("maxPage", pagination.getTotalPage());
		rhs.put("currentPage", pagination.getCurrentPage());
		return "success";
	}
	
	
	public String survey_home() throws Exception {
		// TODO Auto-generated method stub
		survey_list();
		//exam_record_list();
		return "success";
	}
	
	public String survey_arrange_list() throws Exception{
		
		
		String sql = "from Examarrange";
		Map<String,Paper> paperList = new HashMap<String, Paper>();
		Map<String,List<Examrecord>> recordList = new HashMap<String, List<Examrecord>>();
		getPageData(sql);
		
		List<Examarrange> arrangeList = (List<Examarrange>) rhs.get("dataList");
		
		for (Examarrange examarrange : arrangeList) {
			List<Examrecord> examrecordList = new ArrayList<Examrecord>();
			String paperid = examarrange.getPaperid();
			String arrangeid = String.valueOf(examarrange.getId());
			String[] userid = examarrange.getUserid().split(",");
			Paper paper = (Paper) baseDao.loadById("Paper", Long.valueOf(paperid));
			paperList.put(arrangeid, paper);
			
			if(userid.length > 1){
				for (String user : userid) {
					examrecordList.addAll(getExamRecord(user,paperid,arrangeid));
				}
			}else{
				examrecordList.addAll(getExamRecord(userid[0],paperid,arrangeid));
			}
			recordList.put(arrangeid, examrecordList);
		}
		rhs.put("paperlist", paperList);
		rhs.put("datalist", arrangeList);
		return "success";
	}
	
	public String show_answer(){
		String paperId = getpara("paperId");
		Paper paper = (Paper) baseDao.loadById("Paper", Long.valueOf(paperId));
		Set<Result> list = null;
		Map<String,Set<Result>> singleitems = new HashMap<String,Set<Result>>();
		
		Set<Examrecord> allresults = paper.getResultdetail();
		
		
		Set<Result> results = new HashSet<Result>();
		for (Examrecord examrecord : allresults) {
			results.addAll(examrecord.getResult());
			rhs.put("examrecord", examrecord);
		}
		//上面拿到指定用户的结果
		for (Result result : results) {
			Item item = result.getItem(); 
			Long itemid = item.getId();
			switch (item.getType()) {
			case 1:
				list = (Set<Result>) singleitems.get(String.valueOf(itemid));
				if(list == null){
					list = new HashSet<Result>();
				}
				list.add(result);
				singleitems.put(String.valueOf(itemid), list);
				break;
			}
		}
		rhs.put("singleitems", singleitems);
		rhs.put("paper", paper);
		return "success";
	}
	
	public String complete_task() throws Exception {
		System.out.println("survey complete_task................");
		String page="";
		String method = getpara("method");
		if("assign".equals(method)){
			excute_complete_assign();
			page = "survey_surveyPaper_list.do";
		}else if("start".equals(method)){
			excute_complete_start();
			page = "survey_survey_survey_home.do";
		}else{
			System.out.println("complete_task 未知方法...............");
		}
		
		rhs.put("page", page);
		rhs.put("resultMessage", "成功完成任务。");
		return "success";
		
	}

	private void excute_complete_assign(){
		String paperId = getpara("paperid");
		String status = getpara("svyStatus");
		String title = getpara("title");
		Examarrange examarrange = new Examarrange();
		examarrange.setStatus(status);
		examarrange.setTitle(title);
		examarrange.setPaperid(paperId);
		examarrange.setUserid(getCurrentAccount());
		baseDao.create(examarrange);
	}
	
	
	private void excute_complete_start(){
		Map<String, Object> var = new HashMap<String, Object>();
		String examarrangeid = getpara("examarrangeid");
		String paperId = getpara("paperid");
		Paper paper = (Paper)baseDao.loadById("Paper", Long.valueOf(paperId));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Examrecord record = new Examrecord();
		record.setUserid(getCurrentAccount());
		record.setRecorddate(sdf.format(new Date()));
		record.setPaper(paper);
		record.setExamarrangeid(examarrangeid);
		record.setRemark("done survey..");
		baseDao.create(record);
		
		for (Result res : result) {
			//res.setPaper(paper);
			res.setExamrecord(record);
			res.setUser(getCurrentAccount());
			Item item = (Item) baseDao.loadById("Item", res.getItem().getId());
			res.setItem(item);
			baseDao.create(res);
		}
		
		Set<Result> resultset = new HashSet<Result>();
		resultset.addAll(result);
		record.setResult(resultset);
		baseDao.update(record);
	}
	
	
	public String status_arrange(){
		String arrangeid = getpara("arrangeid");
		Examarrange examarrange = (Examarrange) baseDao.loadById("Examarrange", Long.valueOf(arrangeid));
		if(examarrange.getStatus().equalsIgnoreCase("off")){
			examarrange.setStatus("open");
		}else{
			examarrange.setStatus("off");
		}
		baseDao.update(examarrange);
		
		return "success";
	}
	
	public String show_arrange_answer(){
		String paperId = getpara("paperId");
		String arrangeid = getpara("arrangeid");
		Paper paper = (Paper) baseDao.loadById("Paper", Long.valueOf(paperId));
		
		Set<Examrecord> allresults = paper.getResultdetail();
		
		//根据 arrangeid 筛选 结果
		Set<Result> results = new HashSet<Result>();
		for (Examrecord examrecord : allresults) {
			if(arrangeid.equalsIgnoreCase(examrecord.getExamarrangeid())){
				results.addAll(examrecord.getResult());
			}
		}
		
		Set<Result> list = null;
		Map<String,Set<Result>> singleitems = new HashMap<String,Set<Result>>();
		// 根据问卷称筛选所有单项选题
		for (Result result : results) {
			Item item = result.getItem(); 
			Long itemid = item.getId();
			switch (item.getType()) {
			case 1:
				list = (Set<Result>) singleitems.get(String.valueOf(itemid));
				if(list == null){
					list = new HashSet<Result>();
				}
				list.add(result);
				singleitems.put(String.valueOf(itemid), list);
				break;
			}
		}
		rhs.put("singleitems", singleitems);
		rhs.put("paper", paper);
		return "success";
	}
	
	
}
