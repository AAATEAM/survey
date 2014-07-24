<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<style type="text/css">
.panel {
	margin-top: 5px;
}
</style>
<div class="panel panel-primary" style="margin-left:15px;">
       
  <div class="panel-heading">
  	<strong>Exam Schedule List</strong>
  </div>
  <div id="div_scoll" style="margin-left:150px;margin-top:-350px; cursor:hander;position:absolute;width:400px;z-index:10000;display:none;" class="panel panel-default"><!--style="border:2px solid #eee;"-->
			 	<div id="operation_title" class="panel-heading"><strong>Log</strong><a class="pull-right" onclick="show_dir();" class="btn btn-xs  btn-default" ><span class=ui-icon ui-icon-close></span></a></div>
			 	<div class="panel-body" id="div_select_item" style="cursor:hander;"> 
			 	
			 	</div>
			</div>
  <div class="panel-body">
		<table class="table table-condensed table-bordered">
				<tr>
					<td width=25px><strong>#</strong></td>
					<td><strong><@i18n "title_name" /></strong></td>
					<td ><strong><@i18n "title_starttime" /></strong></td>
					<td><strong><@i18n "title_join_user" /></strong></td>
					<#--<td ><strong>User ID</strong></td>
					<td ><strong><@i18n "title_passmark" /></strong></td>
					-->
					<td></td>
					<#--<td ><strong><@i18n "title_result" /></strong></td>-->
					<#--<td ><strong><@i18n "title_remark" /></strong></td>-->
				</tr>
				<#assign index=1 />
				<#list rhs["datalist"] as examarrange>
					<tr>
						<td>${index}</td>
						<#--paper information-->
						<#list rhs["paperlist"]?keys as examarrangeid>
							<#if examarrangeid?number == examarrange.id>
								<#assign paperid = rhs["paperlist"][examarrangeid].id />
								<td >${rhs["paperlist"][examarrangeid].name} 
								<small>(<@i18n "title_totalmark" />:${rhs["paperlist"][examarrangeid].totalmark}
								,<@i18n "title_passmark" />:${rhs["paperlist"][examarrangeid].passmark})</small></td>
							</#if>
						</#list>
						<td>${examarrange.starttime}</td>
						<td>${examarrange.userid}</td>
						<td>
							<#list rhs["recordlist"]?keys as examrecordid>
										<#if examrecordid?number == examarrange.id && (rhs["recordlist"][examrecordid]?size > 0)>
											<button onclick="javascript:showresult(${examarrange.id});" class="btn btn-xs btn-primary" name="detail">Detail</button>
										</#if>
							</#list>
							<#if rhs["export"]>
							<#list rhs["recordlist"]?keys as examrecordid>
								<#if examrecordid?number == examarrange.id && (rhs["recordlist"][examrecordid]?size > 0)>
									<a href="exam_exam_export_arrange_record.do?arrangeid=${examarrange.id}&paperid=${paperid}" class="btn btn-xs btn-primary" >Export to Excel</a>
								</#if>
							</#list>
							</#if>
						</td>
					</tr>
					<#assign index=index+1 />
					<tr id="${examarrange.id}" style="display:none;">
						<td colspan="6" style="padding:0;">
							<table class="table table-condensed table-bordered table-hover" style="background:#dfcddd; width:100%; border: none;">
								<#assign i=1>
								<tr style="text-align: center;">
									<td style="border-bottom: 1px solid #fff; border-top: none; border-left:none; border-right:none;"><strong>*</strong></td>
									<td style="border-bottom: 1px solid #fff; border-top: none; border-left:none; border-right:none;"><strong>User ID</strong></td>
									<td style="border-bottom: 1px solid #fff; border-top: none; border-left:none; border-right:none;"><strong><@i18n "title_result" /></strong></td>
									<td style="border-bottom: 1px solid #fff; border-top: none; border-left:none; border-right:none;"><strong><@i18n "title_time" /></strong></td>
									<td style="border-bottom: 1px solid #fff; border-top: none; border-left:none; border-right:none;"></td>
								</tr>
								<#list rhs["recordlist"]?keys as examarrangeid>
									<#if examarrangeid?number == examarrange.id>
										<#assign recordlist = rhs["recordlist"][examarrangeid] />
										<#list recordlist as record>
										<tr style="text-align: center;">
											<td style="border:none;">${i}</td>
											<td style="border:none;">${record.userid}</td>
											<td style="border:none;">${record.singlechoicemark?number + record.multichoicemark?number + record.blankmark?number + record.essaymark?number}</td>
											<td style="border:none;">${record.recorddate?if_exists}</td>
											<td style="border:none;">
												<#--<#list rhs["monitorlist"]?keys as recordid>
													<#if recordid == record.id?string && (rhs["monitorlist"][recordid]?size > 0) >
														<a onclick="javascript:showlog('${record.taskid}','${record.paper.id}','${record.userid}');" class="btn btn-xs btn-info">Show Log</a>
													</#if>
												</#list>-->
											</td>
										</tr>
										</#list>
									</#if>
									<#assign i = i + 1 />
								</#list>
							</table>
						</td>
					</tr>
				</#list>
			</table>
			<form action="exam_exam_exam_record_list.do" id="search_form" method="post" style="display:none;">
				<input type="hidden" name="search" value="search">
				<input type="hidden" name="pageId" id="pageId">
				<input type="hidden" name="maxSize" id="pageMaxSize">
			</form>
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
