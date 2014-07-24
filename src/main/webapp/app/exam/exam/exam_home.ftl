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
		<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Exam Information</span>
	</div>
	<div class="alert alert-info">
		<div class="panel-body">
  			<table class="table table-condensed table-hover table-bordered">
		  		<tr>
		  			<th width=25px>#</th>
					<th ><@i18n "title_name" /></th>
					<th ><@i18n "title_passmark" /></th>
					<th ><@i18n "title_totalmark" /></th>
					<th ><@i18n "title_examtime" /></th>
					<th ><@i18n "title_starttime" /></th>
					<th ><@i18n "title_operation" /></th>
				</tr>
				<#list rhs["oatasklist"] as item>
				<#if item.obj?exists>
				<tr>
					<td>${item_index+1}</td>
					<td>${item.obj.name}</td>
					<td >${item.obj.passmark}</td>
					<td >${item.obj.totalmark}</td>
					<td >${item.obj.time}(minutes)</td>
					<td id="starttime_${item.task.id}">${item.starttime}</td> <#--${item.task.createTime?datetime}-->
					<td >
					<#--<a href="common_activiti_process_diagram.do?processInstanceId=${item.task.processInstanceId}" target=_blank>
							View
						</a>-->
					<a  <#if item.method == "Start"> onclick="javascript:toFull('${item.handleTaskUrl?if_exists}&taskId=${item.task.id}')"<#else>href="${item.handleTaskUrl?if_exists}&taskId=${item.task.id}"</#if> class="btn btn-xs btn-info">
									${item.method}
					</a>
					</td>
				</tr>
				</#if>
				</#list>
			</table>
			<form action="exam_exam_exam_list.do" id="search_form" method="post" style="display:none;">
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
	
	
	$(document).ready(function(){
		<#list rhs["oatasklist"] as item>
			<#if item.obj?exists>
				setInterval("getstarttime('${item.task.id}')",30000);
			</#if>
		</#list>
	});
	
	function getstarttime(taskid){
		$.ajax({
			type : "POST",
			url : "exam_exam_getstarttime.do",
			data : "taskid=" + taskid,
			cache : false,
			success : function(html) {
				document.getElementById("starttime_" + taskid).innerHTML = html;
			}
		});
	}
	
</script>

<div class="exam-frame">
	<div style="margin-bottom:5px;">
		<img style="vertical-align: text-bottom;" src="common/images/e_history_blue.png" />
		<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Exam History</span>
	</div>
	<div class="alert alert-info">
		<div class="panel-body">
			<table class="table table-condensed table-hover table-bordered">
				<tr>
					<th width=25px>#</th>
					<th ><@i18n "title_name" /></th>
					<#--<th >User ID</th>
					<th ><@i18n "title_totalmark" /></th>-->
					<th ><@i18n "title_passmark" /></th>
					<th ><@i18n "title_result" /></th>
					<th><@i18n "title_time" /></th>
					<#--<th ><@i18n "title_result" /></th>-->
					<#--<th ><@i18n "title_remark" /></th>-->
					<th></th>
				</tr>
				<#assign index=1 />
				<#list rhs["datalist"]?keys as papername>
				<#assign index=1>
				<#list (rhs["datalist"][papername]?sort_by("id"))?reverse as record>
				<tr>
					<td>${index}</td>
					<td>${rhs["datalist"][papername][0].paper.name} </td><#--onclick="javascript:showresult(${rhs["datalist"][papername][0].paper.id});"-->
					<td>${rhs["datalist"][papername][0].paper.passmark}</td>
					<td>
					<#if record.remark?exists && record.remark == "Wait for judge">
						${record.remark}
					<#else>
						${record.singlechoicemark?number + record.multichoicemark?number + record.blankmark?number + record.essaymark?number}
					</#if>
					</td>
					<td>${record.recorddate?if_exists}</td><#--<#if rhs["export"]><div class="pull-right"><a href="exam_exam_export_record.do?paperId=${rhs["datalist"][papername][0].paper.id}" class="btn btn-xs btn-primary" >Export to Excel</a></div></#if>-->
					<td><#if rhs["export"]><a onclick="javascript:showlog('${record.taskid}','${record.paper.id}','${record.userid}');" class="btn btn-xs btn-primary">Show Log</a></#if></td>
				</tr>
				<#assign index = index + 1 />
				</#list>
				</#list>
			</table>
			<br/>
			<#if rhs["oatasklist_outdate"]?size gt 0 >	
			<strong style="display:block; padding-bottom: 5px;"> You missed exam: </strong>
			<table class="table table-condensed table-hover table-bordered">
				<tr>
					<th width=25px>#</th>
					<th ><@i18n "title_name" /></th>
					<th ><@i18n "title_examtime" /></th>
					<th ><@i18n "title_starttime" /></th>
				</tr>
				<#list rhs["oatasklist_outdate"] as item>
				<#if item.obj?exists>
				<tr>
					<td>${item_index+1}</td>
					<td>${item.obj.name}</td>
					<td >${item.obj.time}(minutes)</td>
					<td id="starttime_${item.task.id}">${item.starttime}</td>
				</tr>
				</#if>
				</#list>
			</table>			
			</#if>
			
			<form action="exam_exam_exam_record_list.do" id="search_form" method="post" style="display:none;">
				<input type="hidden" name="search" value="search">
				<input type="hidden" name="pageId" id="pageId">
				<input type="hidden" name="maxSize" id="pageMaxSize">
			</form>
			<#include "../../../common/freemarker/macro_pagination.ftl">
			<@pagination  "search_form" />
  		</div>
	</div>
</div>

<div id="div_scoll" style="margin-left:150px;margin-top:-350px; cursor:hander;position:absolute;width:400px;z-index:10000;display:none;" class="panel panel-default"><!--style="border:2px solid #eee;"-->
	<div id="operation_title" class="panel-heading"><strong>Log</strong></div>
	<a class="pull-right" onclick="show_dir();" class="btn btn-xs  btn-default" ><span class=ui-icon ui-icon-close></span></a>
	<div class="panel-body" id="div_select_item" style="cursor:hander;"></div>
</div>

<script>
$(function() {$( "#div_scoll" ).draggable();});  
	function showresult(paperid){
		var resultstyle = $("#"+paperid).attr("style");
		if(resultstyle.indexOf("none") < 0){
			$("#"+paperid).attr("style","display:none;");
		}else{
			$("#"+paperid).attr("style","display:");
		}
	
	}
	function  show_dir(){  //定位层
	  if( document.getElementById('div_scoll').style.display=='none'){
	  	document.getElementById('div_scoll').style.display='block';
	  }else{
	    document.getElementById('div_scoll').style.display='none';
	  }
	}
	function showlog(taskid,paperid,userid){
		$('#div_scoll').attr("style","margin-left:450px;margin-top:50px; cursor:hander;position:absolute;width:400px;z-index:10000;display:block;");
		$.ajax({
			type : "POST",
			url : "exam_exam_showlog.do",
			data : "taskid=" + taskid + "&paperid=" + paperid + "&userid=" +userid,
			cache : false,
			success : function(html) {
				document.getElementById("div_select_item").innerHTML = html;
			}
		});
	}
	
</script>

<#--
<div class="panel panel-primary" style="float:left;position:relative;width:46%;left:5px;">
       
  <div class="panel-heading">
  	<strong>Out of Date List</strong>
  </div>
  <div class="panel-body">
		<table class="table table-condensed table-hover table-bordered">
				<tr>
					<td width=25px><strong>#</strong></td>
					<td ><strong><@i18n "title_name" /></strong></td>
					<td ><strong><@i18n "title_passmark" /></strong></td>
					<td ><strong><@i18n "title_totalmark" /></strong></td>
					<td ><strong><@i18n "title_examtime" /></strong></td>
					<td ><strong><@i18n "title_starttime" /></strong></td>
					<td ><strong><@i18n "title_operation" /></strong></td>
				</tr>
				<#list rhs["oatasklist_outdate"] as item>
					<#if item.obj?exists>
					<tr>
						<td>${item_index+1}</td>
						<td>${item.obj.name}</td>
						<td >${item.obj.passmark}</td>
						<td >${item.obj.totalmark}</td>
						<td >${item.obj.time}(minutes)</td>
						<td id="starttime_${item.task.id}">${item.starttime}</td>
						<td >
							<a  <#if item.method == "Start"> onclick="javascript:toFull('${item.handleTaskUrl?if_exists}&taskId=${item.task.id}')"<#else>href="${item.handleTaskUrl?if_exists}&taskId=${item.task.id}"</#if> class="btn btn-xs btn-primary">
								${item.method}
							</a>
						</td>
					</tr>
					</#if>
				</#list>
			</table>
  </div>
</div>
-->
