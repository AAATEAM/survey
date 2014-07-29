<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">

<script type="text/javascript" src="<@context_module/>assign.js"></script>

<form name="form_item" action="survey_survey_complete_task.do" method="post">
<input type="hidden" value="<#if rhs.method?exists >${rhs["method"]}</#if>" name="method"/>
<input type="hidden" value="open" name="svyStatus"/>

<div class="panel panel-primary" style="margin-top: 18px;">
      <div class="panel-heading"><strong>Arrange Examination</strong></div>
      <div class="panel-body">
      	 <table class="table table-condensed table-bordered table-striped">
      		<tr>
      			<td><strong>Paper Name: </strong><#if rhs["paper"]?exists > ${rhs["paper"].name?if_exists} </#if></td>
      			<input type="hidden" value="<#if rhs["paper"]?exists >${rhs["paper"].id?if_exists}</#if>" name="paperid" />
      		</tr>
      		<tr>
      			<td><strong>Survey Title:</strong>
				<textarea class="input-small" id="title" style="height:40px;width:300px;" name="title"></textarea>
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
		
		var status = $('input[name="svyStatus"]:checked').val();
		console.log(status);
		var title = $("#title").val();
		
		
		if(title == null || title == ""){
			alert("Please input Survey Name!");
			return false;
		}
		
		if (confirm("Are you sure start the survey?")){
			btn.button("loading");
			document.getElementsByName("form_item")[0].submit();
		}
		
	});
	
	
</script>