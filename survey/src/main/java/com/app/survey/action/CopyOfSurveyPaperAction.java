package com.app.survey.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.app.common.activiti.model.BusinessWithProcessModel;
import com.app.common.base.action.BaseEaAction;
import com.app.exam.action.PaperAction;
import com.app.exam.model.Examarrange;
import com.app.exam.model.Examrecord;
import com.app.exam.model.Item;
import com.app.exam.model.Knowledge;
import com.app.exam.model.Paper;
import com.app.exam.model.Papergroup;
import com.app.exam.model.Result;

import edu.emory.mathcs.backport.java.util.Collections;

@Scope("prototype")

public class CopyOfSurveyPaperAction extends PaperAction {

	
	
	@Override
	public String setitem() throws Exception {
		System.out.println("survey setitem................");
		// TODO Auto-generated method stub
		super.setitem();
		return "success";
	}
	
	
	
	
	public String view_examrrange() throws Exception {
		String paperid = getpara("id");
		Paper paper = (Paper) baseDao.loadById("Paper", Long.valueOf(paperid));
		Set<Result> list = null;
		Map<String,Set<Result>> singleitems = new HashMap<String,Set<Result>>();
		Map<String,Set<Result>> multiitems = new HashMap<String,Set<Result>>();
		Map<String,Set<Result>> blankitems = new HashMap<String,Set<Result>>();
		Map<String,Set<Result>> essayitems = new HashMap<String,Set<Result>>();
		
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
			case 2:
				list = (Set<Result>) multiitems.get(String.valueOf(itemid));
				if(list == null){
					list = new HashSet<Result>();
				}
				list.add(result);
				multiitems.put(String.valueOf(itemid), list);
				break;
			case 3:
				list = (Set<Result>) blankitems.get(String.valueOf(itemid));
				if(list == null){
					list = new HashSet<Result>();
				}
				list.add(result);
				blankitems.put(String.valueOf(itemid), list);
				break;
			case 4:
				list = (Set<Result>) essayitems.get(String.valueOf(itemid));
				if(list == null){
					list = new HashSet<Result>();
				}
				list.add(result);
				essayitems.put(String.valueOf(itemid), list);
				break;
			}
		}
		rhs.put("singleitems", singleitems);
		rhs.put("multiitems", multiitems);
		rhs.put("blankitems", blankitems);
		rhs.put("essayitems", essayitems);
		rhs.put("paper", paper);
		return "success";
	}
	
	public String view_examrrangesss() throws Exception {
		String paperid = getpara("id");
		Paper paper = (Paper) baseDao.loadById("Paper", Long.valueOf(paperid));
		
		List<Examarrange> examarrangelist = baseDao.find("from Examarrange where paperid = '"+paperid+"'"); //发布的问卷
		
		Map<Long, List<Result>> items = new HashMap<Long, List<Result>>(); // itemid, 
		
		Set<Item> singleitems = new HashSet<Item>();
		Collection<Item> rmdsingleitems = paper.getRmdItem("1", paper.getRmdsinglechoice());
		Collection<Item> reqsingleitems = paper.getReqItem("1");
		singleitems.addAll(reqsingleitems);
		singleitems.addAll(rmdsingleitems);
		
		
		//统计用户
		
		List<Result> resultlist = new ArrayList<Result>();
		
		for(int i = 0; i < examarrangelist.size(); i++){ 
			Examarrange arrange = examarrangelist.get(i);
			List<Examrecord> examrecordlist = baseDao.find("from Examrecord where examarrangeid = '"+arrange.getId()+"'"); //答题记录
			for(int j = 0; j < examrecordlist.size(); j++){
				resultlist.addAll(examrecordlist.get(j).getResult());
			}
			
		}
		
		
		
		rhs.put("singleitems", singleitems);
		rhs.put("resultlist", resultlist);
		
		
		rhs.put("datalist", examarrangelist);
		
		return "success";
	}
	
	
	
	
}
