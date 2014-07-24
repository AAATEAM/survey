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

public class CopyOfSurveyAction extends ExamAction {
	private static Logger log = LoggerFactory.getLogger(CopyOfSurveyAction.class);
		
	public String open_survey() throws ParseException {
		String examId = getpara("exam_id");
		String method = getpara("method");
		
		Examarrange examarrange = (Examarrange) baseDao.loadById("Examarrange", Long.valueOf(examId));
		Paper paper = (Paper) baseDao.loadById("Paper", Long.valueOf(examarrange.getPaperid()));
		
		System.out.println("=========paper.getRmdsinglechoice(): " + paper.getRmdsinglechoice());
		//开始考试
		Set<Item> singleitems = new HashSet<Item>();
		Collection<Item> rmdsingleitems = paper.getRmdItem("1", paper.getRmdsinglechoice());
		Collection<Item> reqsingleitems = paper.getReqItem("1");
		singleitems.addAll(reqsingleitems);
		singleitems.addAll(rmdsingleitems);
		
		Set<Item> multiitems = new HashSet<Item>();
		Collection<Item> rmdmultiitems = paper.getRmdItem("2", paper.getRmdmultichoice());
		Collection<Item> reqmultiitems = paper.getReqItem("2");
		multiitems.addAll(reqmultiitems);
		multiitems.addAll(rmdmultiitems);
		
		Set<Item> blankitems = new HashSet<Item>();
		Collection<Item> rmdblankitems = paper.getRmdItem("3", paper.getRmdblank());
		Collection<Item> reqblankitems = paper.getReqItem("3");
		blankitems.addAll(reqblankitems);
		blankitems.addAll(rmdblankitems);
		
		Set<Item> essayitems = new HashSet<Item>();
		Collection<Item> rmdessayitems = paper.getRmdItem("4", paper.getRmdessay());
		Collection<Item> reqessayitems = paper.getReqItem("4");
		essayitems.addAll(reqessayitems);
		essayitems.addAll(rmdessayitems);
		
		rhs.put("singleitems", singleitems);
		rhs.put("multiitems", multiitems);
		rhs.put("blankitems", blankitems);
		rhs.put("essayitems", essayitems);
		
		rhs.put("paper", paper);
		rhs.put("method", method);
		rhs.put("examarrangeId", examId);
		
		

		return "success";
	}
	
	
	
	
	
	
	
	
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
	
	
	
	
	public String survey_complete() throws Exception {
		return "success";
	}
	
	
	public String show_answer(){
		String paperId = getpara("paperId");
		Paper paper = (Paper) baseDao.loadById("Paper", Long.valueOf(paperId));
		Set<Result> list = null;
		Map<String,Set<Result>> singleitems = new HashMap<String,Set<Result>>();
//		Map<String,Set<Result>> multiitems = new HashMap<String,Set<Result>>();
//		Map<String,Set<Result>> blankitems = new HashMap<String,Set<Result>>();
//		Map<String,Set<Result>> essayitems = new HashMap<String,Set<Result>>();
		
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
		
		rhs.put("export", true);
		rhs.put("recordlist", recordList);
		rhs.put("paperlist", paperList);
		rhs.put("datalist", arrangeList);
		return "success";
	}
	
	
	
	
}
