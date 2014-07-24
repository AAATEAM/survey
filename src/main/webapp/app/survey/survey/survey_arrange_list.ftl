<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<style type="text/css">
.panel {
	margin-top: 5px;
}
</style>
<div class="panel panel-primary" style="margin-left:15px;">
       
  <div class="panel-heading">
  	<strong>问卷调查记录</strong>
  </div>
  <div class="panel-body">
		<table class="table table-condensed table-bordered">
				<tr>
					<td width=25px><strong>#</strong></td>
					<td><strong>卷名称</strong></td>
					<td><strong>问卷名称</strong></td>
					<td><strong>状态</strong></td>
					<td><strong>发布者</strong></td>
					<td></td>
					
				</tr>
				<#assign index=1 />
				<#list rhs["datalist"] as examarrange>
					<tr>
						<td>${index}</td>
						<#--paper information-->
						<#list rhs["paperlist"]?keys as examarrangeid>
							<#if examarrangeid?number == examarrange.id>
								<td >${rhs["paperlist"][examarrangeid].name}</td>
							</#if>
						</#list>
						<td>${examarrange.title}</td>
						<td>${examarrange.status}</td>
						<td>${examarrange.userid}</td>
						<td>
							<a href="survey_survey_show_arrange_answer.do?paperId=${examarrange.paperid}&arrangeid=${examarrange.id}">查看</a>
							&nbsp;&nbsp;
							<#if examarrange.status == "open">
								<a href="survey_survey_status_arrange.do?arrangeid=${examarrange.id}">关闭</a>
							<#else>
								<a href="survey_survey_status_arrange.do?arrangeid=${examarrange.id}">打开</a>		
							</#if>
							
							
						</td>
					</tr>
				</#list>
			</table>
			
			<#include "../../../common/freemarker/macro_pagination.ftl">
			<@pagination  "search_form" />
			
  </div>
</div>
<script>
	$(function() {$( "#div_scoll" ).draggable();});  
	function showresult(paperid){
		var resultstyle = $("#"+paperid).attr("style");
		if(resultstyle == null || resultstyle.indexOf("none") < 0){
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
