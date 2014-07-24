<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_select_users.ftl">
<script>

	function action_wo_start_process(id, assignee){
		$('#startProcess' + id).text('waitting');
		$("#startProcess" + id).attr("onclick","");
		$.ajax({
			type: 'post',
			url: 'common_activiti_start_process.do',
			data: 'id=' + id + '&assignee=' + assignee + '&processKey=SimpleSolution&model=Wo',
			cache: false,
			success: function(html){
			   document.location.href = "common_activiti_menu_task_list.do";
			}
		});  
	}

</script>
<body> 
   		<#include "include_add_search.ftl">
		<br><br><a style="margin-left:10px;margin-top:5px;" class="btn btn-primary "  href="manager_wo_load.do?id=">Add Work Order</a>
		
	<div class="panel panel-primary" style="margin-top: 18px;">
      <div class="panel-heading"><strong>Work Order List</strong></div>
      <div class="panel-body">
			
			
		
		<table class="table table-condensed table-hover">
	    <thead>
			<tr>
			    <td width=25px><strong>#</strong></td>
				<td><strong>Request Id</strong></td>
				<td><strong>Wo Title</strong></td>
				<td><strong>Manday</strong></td>
				<td><strong>Planning Start / End Date</strong></td>
				<td><strong>Task Name( Process Status )</strong></td>
				<td><strong>Handle</strong></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<#list rhs["dataList"] as x>
				<tr>
					<td class=nob >${x_index+1}</td>		
					<td>${x.businessModel.requestid?if_exists}</td>
					<td>${x.businessModel.title?if_exists}</td>
					<td>${x.businessModel.manday?if_exists}</td>
					<td>${x.businessModel.startTime?if_exists}<#if x.businessModel.endTime?exists && x.businessModel.endTime != ''> / </#if>${x.businessModel.endTime?if_exists}</td>
					<td>${x.processTaskName?if_exists}( ${x.processInstanceStatus?if_exists} )</td>
					<td>
						<a title="Detail" href="manager_wo_load.do?id=${x.businessModel.id}&readonly=true">Detail</a> | 
						<#if x.businessModel.processInstanceId?exists&& x.businessModel.processInstanceId != "" &&x.processInstanceStatus != 'Done' >
						    <!-- If the status was done, the status will throw an NullPointerException  -->
							<a title="Status" 
								href="common_activiti_process_diagram.do?processInstanceId=${x.businessModel.processInstanceId}" target=_blank>
								Status</a> | 
						<#else>
					    	<button id="startProcess${x.businessModel.id}" title="Start Process" class="btn btn-xs btn-primary"
					    		onclick="javascript:action_wo_start_process('${x.businessModel.id}','${Session.userlogined.account?if_exists}');" >
					    		Start</button> | 
						</#if>                                                         
							<a title="Edit" href="manager_wo_load.do?id=${x.businessModel.id}">Edit</a>
							<#if x.processInstanceStatus == 'New' || x.processInstanceStatus == 'Done'>
								| <a title="Delete" href="manager_wo_delete.do?id=${x.businessModel.id}">Delete</a>
							</#if>
					</td>
					<td><#if x.businessModel.alarm?exists&& x.processInstanceStatus != 'Done'>
						<img title="task超时，请注意" src="<@context/>common/images/onFocus.jpg" />
						<#else>
							<#if x.processInstanceStatus == 'Done' >	
							<img title="task已经完成" src="<@context/>common/images/Done.gif" />
							</#if>
						</#if>
					</td>
				</tr>
			</#list> 
		</tbody>
	</table>       
		<#include "../../../common/freemarker/macro_pagination.ftl">
		<@pagination  "search_form" />

			
			
			
      </div>
    </div>
		
		
</body>