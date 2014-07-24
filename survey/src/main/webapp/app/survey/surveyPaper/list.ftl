<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<script>
	function action_paper_start_process(id, assignee){
		$('#startProcess' + id).text('waitting');
		$("#startProcess" + id).attr("onclick","");
		$.ajax({
			type: 'post',
			url: 'survey_surveyPaper_paper_assign.do',
			data: 'id=' + id,
			cache: false,
			success: function(html){
			   document.location.href = "survey_surveyPaper_paper_list.do";
			}
		});  
	}
</script>

<div style="margin:5px; height: 30px;">
	<#include "include_add_search.ftl">
	<div style="position:absolute;">
		&nbsp;&nbsp;
		<a class="btn btn-xs btn-primary "  href="survey_surveyPaper_create.do?method=newpaper"><@i18n "menu_paper_new" /> _ Survey</a>
	</div>
</div>

<div style="margin:5px">
	<div class="panel panel-primary" style="clear:both;">
      <div class="panel-heading"><strong><@i18n "title_paper" /></strong></div>
      <div class="panel-body">
		<table class="table table-condensed table-hover">
	    <thead>
			<tr>
			    <td width=25px><strong>#</strong></td>
				<td width=250px><strong>Paper Name</strong></td>
			<#--	<td width=150px><strong><@i18n "title_createtime" /></strong></td>-->
				<td width=120px><strong>Certification Score<#--<@i18n "title_passmark" />--></strong></td>
				<td width=100px><strong>Total Score <#--<@i18n "title_totalmark" />--></strong></td>
				<td width=100px><strong><@i18n "title_examtime" /></strong></td>
				<#--<td width=100px><strong><@i18n "title_status" /></strong></td>-->
				<td><strong></strong></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<#assign index=1 />
			<#list rhs["dataList"]?keys as papergroup>
			<#list rhs["dataList"][papergroup] as x>
			 <tr>
			    <td class=nob >${index}</td>
				<td><#if x.businessModel.papergroup?exists>[${x.businessModel.papergroup.name}]</#if>&nbsp;${x.businessModel.name?if_exists}</td>
				<#--<td>${x.businessModel.createdate?if_exists}</td>-->
				<td>${x.businessModel.passmark?if_exists}</td>
				<td>${x.businessModel.totalmark?if_exists}</td>
				<td>${x.businessModel.time?if_exists} &nbsp;(Minutes)</td>
				<#--<td>${x.processInstanceStatus}</td>-->
				<td><a href="survey_surveyPaper_load.do?method=edit&id=${x.businessModel.id}"><@i18n "title_edit" /></a> <#--| <a href="survey_surveyPaper_load.do?method=show&id=${x.businessModel.id}"> <@i18n "title_view" /></a>--> <#if (!(x.businessModel.processInstanceId?exists&&x.businessModel.processInstanceId != "") && x.processInstanceStatus == 'New' || x.processInstanceStatus == 'Done') >| <a href="survey_surveyPaper_delete.do?id=${x.businessModel.id}"><@i18n "title_delete" /></a> </#if> </td>
				<td>	    		
				<a id="startProcess${x.businessModel.id}" title="Start Process" class="btn btn-xs btn-primary" href="survey_surveyPaper_assign.do?id=${x.businessModel.id}">
					    		Schedule _ survey</a>
				<a  title="View Paper" class="btn btn-xs btn-primary" href="survey_survey_show_answer.do?paperId=${x.businessModel.id}">Show Answer</a>
					    		
				</td>
			</tr>
			<#assign index=index+1 />
			</#list>
			</#list>
		</tbody>
	</table>
		<#include "../../../common/freemarker/macro_pagination.ftl">
		<@pagination  "search_form" />
      </div>
    </div>
</div>	