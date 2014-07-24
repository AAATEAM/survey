<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<#include "include_select_users.ftl">
<script type="text/javascript" src="<@context_module/>assign.js"></script>

<form name="form_item" action="exam_exam_complete_task.do" method="post">
<input type="hidden" value="<#if rhs.method?exists >${rhs["method"]}</#if>" name="method"/>
<div class="panel panel-primary" style="margin-top: 18px;">
      <div class="panel-heading"><strong>Arrange Examination</strong></div>
      <div class="panel-body">
      	 <table class="table table-condensed table-bordered table-striped">
      		<tr>
      			<td><strong>Paper Name: </strong><#if rhs["paper"]?exists > ${rhs["paper"].name?if_exists} </#if></td>
      			<input type="hidden" value="<#if rhs["paper"]?exists >${rhs["paper"].id?if_exists}</#if>" name="paperid" />
      		</tr>
      		<tr>
      			<td>
      			<strong>Start Time from: <input type="text"  style="width:135px" class="input-small" id="starttime" name="starttime" onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'});" value='' />
				 to <input type="text"  style="width:135px" class="input-small" id="endtime" name="endtime" onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'});" value='' />
      			</strong>
      			</td>
      		</tr>
      		<tr>
      			<td><strong>Nomination:</strong>
      			<#--<br><@i18n "title_candidate" />-->
      			<input type="hidden" id="assignee" name="assignee"/>
				<textarea class="input-small" id="assigneeText" style="height:40px;width:300px;"
					onclick="javascript:open_select_users_dialog(document.getElementById('assigneeText'),document.getElementById('assignee'),2);" ></textarea>
      			</td>
      		</tr>
      		<#if rhs["autojudge"]?exists>	
      		<tr>
      			<td><@i18n "title_judge" />: 
      			<input type="hidden" id="judge" name="judge"/>
				<input type="text" class="input-small" id="assigneejudgeText" 
					onclick="javascript:open_select_users_dialog(document.getElementById('assigneejudgeText'),document.getElementById('judge'),1);" />
      			</td>
      			<input type="hidden" value="${rhs["autojudge"]?string}" name="autojudge" />
      		</tr>
      		</#if>
      		<tr>
      			<td><input type="button" class="btn btn-xs btn-primary" value="Save" id="submitButton"/></td>
      		</tr>
      	</table>
      
      </div>
</div>
</form>
<script>
	$('#submitButton').click(function () {
		var btn = $(this);
		var starttime = $("#starttime").val();
		var endtime = $("#endtime").val();
		var assignee = $("#assignee").val();
		var judge = $("#judge").val();
		
		if((endtime < starttime) || starttime == "" || endtime == ""){
			alert("Invalid Time!");
			return false;
		}
		
		if(assignee == null || assignee == ""){
			alert("Please select one candidate!");
			return false;
		}
		if(judge == ""){
			alert("Please select one judge!");
			return false;
		}
		if (confirm("Are you sure start the exam?")){
			$("#dialog").dialog("open");
			btn.button("loading");
			document.getElementsByName("form_item")[0].submit();
		}
	});
	
	
</script>