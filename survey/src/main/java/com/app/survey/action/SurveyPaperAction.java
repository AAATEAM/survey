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
@Component("surveyPaperAction")
public class SurveyPaperAction extends PaperAction {
	
	public String list() throws Exception {
		super.list();
		return "success";
	}
	
	public String create() throws Exception {
		super.create();
		return "success";
	}
	
	public String assign(){
		
		String id = getpara("id");
		Paper paper = (Paper) baseDao.loadById("Paper", Long.parseLong(id));
		
		rhs.put("paper", paper);
		rhs.put("method", "assign");
		return "success";
	}
	
	
}
