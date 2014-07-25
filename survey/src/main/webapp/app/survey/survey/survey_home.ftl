<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_exam.ftl">
<style type="text/css">
.table th {
	background-color: #fff;
	text-align: center;
}
.table-bordered>tbody>tr>td {
	text-align: center;
}
.table-hover>tbody>tr:hover>th {
	background-color: #fff;
}
.table-hover>tbody>tr:hover>td {
	background-color: #CAEAFA;
}
.table-bordered>thead>tr>th, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td {
	border: 1px solid #bce8f1;
	vertical-align: middle;
}
</style>
<div class="exam-frame">
	<div style="margin-bottom:5px;">
		<img style="vertical-align: text-bottom;" src="common/images/e_note_orange.png" />
		<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Notice</span>
	</div>
	<div class="alert alert-warning">
		<p>1. You can take an examination through <strong>Exam Information List</strong>.</p>
		<p>2. You can check all examinations which you had taken through <strong>Exam History List</strong>.</p>
	</div>
</div>

<div class="exam-frame">
	<div style="margin-bottom:5px;">
		<img style="vertical-align: text-bottom;" src="common/images/e_paper_blue.png" />
		<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Exam Information </span>
	</div>
	<div class="alert alert-info">
		<div class="panel-body">
  			<table class="table table-condensed table-hover table-bordered">
		  		<tr>
		  			<th width=25px>#</th>
					<th ><@i18n "title_name" /></th>
					<th ><@i18n "title_operation" /></th>
				</tr>
				<#list rhs["datalist"] as item>
				<tr>
					<td>${item_index+1}</td>
					<td>${item.title}</td>
					<td >
					<#assign flag = true>
					<#list rhs["recordList"] as record>
						<#if record.examarrangeid?string == item.id?string >
							 已经答过卷
							 <#assign flag = false>
							 <#break>
						</#if>
					</#list>
					<#if flag ><a  onclick="javascript:toFull('survey_survey_open_survey.do?method=start&amp;taskPage=survey/start.ftl&amp;model=Paper&examarrangeid=${item.id}')" class="btn btn-xs btn-info">Start</a></#if>
					</td>
				</tr>
				</#list>
			</table>
			<form action="survey_survey_survey_list.do" id="search_form" method="post" style="display:none;">
				<input type="hidden" name="search" value="search">
				<input type="hidden" name="pageId" id="pageId">
				<input type="hidden" name="maxSize" id="pageMaxSize">
			</form>
			<#include "../../../common/freemarker/macro_pagination.ftl">
			<@pagination  "search_form" />
        </div>
	</div>
</div>

<script>
	function isIE() { //ie?  
    	if (!!window.ActiveXObject || "ActiveXObject" in window)  
        	return true;  
    	else  
        	return false;  
	}
	function   toFull(url){
		if(!isIE()){
			alert("Please starting exam in IE!");
			return false;
		}
	  if(window.name=="fullscreen")
	  	return; 
	  var a =window.open(url,"fullscreen","fullscreen=1,scrollbars=yes");
	}
	
	

	
</script>

