<form id="edit_form" action="manager_wo_complete_task.do" method="post">
	<input type="hidden" id="taskId" name="taskId" value='${rhs["task"].id}'/>
      <div class="panel panel-primary">
        <div class="panel-heading">Business Panel</div>
        <div class="panel-body">
				<font color="grey"><small>
				${rhs["task"].name}
					<!--
					(<a href="common_activiti_process_diagram.do?processInstanceId=${rhs.model.processInstanceId?if_exists}" target="_blank">Process Diagram</a>)
					<a href="manager_customer_list_customer.do" onclick="return hs.htmlExpand(this, { objectType: 'iframe' })" >Contact List</a>
					-->
				</small></font>
        </div>

        <!-- Table -->
        <table class="table table-condensed table-bordered table-striped">
            <tr>
			            <td>Request ID</td>
			            <td>
			              <input type="hidden" id="objectid" name="woobject.id" value='<#if rhs["model"]?exists>${rhs["model"].id?if_exists}</#if>' />
			              <input type="hidden" name="woobject.projectId" value='<#if rhs["model"]?exists>${rhs["model"].projectId?if_exists}</#if>' />
			              <input type="hidden" name="woobject.processInstanceId" value='<#if rhs["model"]?exists>${rhs["model"].processInstanceId?if_exists}</#if>' />
			              <input type="text" name="woobject.requestid" value='<#if rhs["model"]?exists>${rhs["model"].requestid?if_exists}</#if>'
			                ${rhs.formPro.requestid?if_exists} />
			            </td>
			            <td>WO Title</td>
			            <td>
			                <input type="text" id="title" name="woobject.title" value='<#if rhs["model"]?exists>${rhs["model"].title?if_exists}</#if>'${rhs.formPro.title?if_exists} />
			            </td>
			</tr>

            <tr>
			            <td>WO Description</td>
			            <td colspan=3>
			              <textarea style="width:530px" rows="4" id="requestDesc" name="woobject.requestDesc"
								${rhs.formPro.requestDesc?if_exists} ><#if rhs["model"]?exists>${rhs["model"].requestDesc?if_exists}</#if></textarea>
			            </td>
		    </tr>
			          <tr>
			            <td>Business Type</td>
			            <td>
			              <select id="businessType" name="woobject.businessType"
			                  ${rhs.formPro.businessType?if_exists} >
			                    <option value="Change Request">Change Request</option>
			                    <option value="Service Request">Service Request</option>
			                    <option value="Work Package">Work Package</option>
			                  </select>
			            </td>
			            <td>Service Function</td>
			            <td>
			              <select id="serviceFunction" name="woobject.serviceFunction"
			                  ${rhs.formPro.serviceFunction?if_exists} >
			                    <option value="Application Development &amp; 3rd Level Support">Application Development &amp; 3rd Level Support</option>
			                    <option value="2nd Level Operations">2nd Level Operations</option>
			                    <option value="Deployment">Deployment</option>
			                  </select>
			            </td>
			 </tr>
			          <script type="text/javascript">
			            document.getElementById("serviceFunction").value = '${rhs.model.serviceFunction?if_exists}';
			            document.getElementById("businessType").value = '${rhs.model.businessType?if_exists}';
			          </script>
			 <tr>
			              <td>Manday</td>
			              <td>
			                <input type="text" id="manday" name="woobject.manday" value='<#if rhs["model"]?exists>${rhs["model"].manday?if_exists}</#if>'
			                ${rhs.formPro.manday?if_exists} />
			              </td>
			              <td>Actual Manday</td>
			              <td>
			                <input type="text" id="actualManday" name="woobject.actualManday" value='<#if rhs["model"]?exists>${rhs["model"].actualManday?if_exists}</#if>'
			                ${rhs.formPro.actualManday?if_exists} />
			              </td>
			</tr>
			<tr>
			            <td>Reception Date</td>
			              <td>
			                 <input type="text" name="woobject.receiveTime" value='<#if rhs["model"]?exists>${rhs["model"].receiveTime?if_exists}</#if>' ${rhs.formPro.receiveTime?if_exists}
			                    onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ${rhs.readonly?if_exists} />
			                </td>
			            <td>Estimation Date</td>
			              <td>
			                 <input type="text" name="woobject.responseTime" value='<#if rhs["model"]?exists>${rhs["model"].responseTime?if_exists}</#if>' ${rhs.formPro.responseTime?if_exists}
			                    onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"
			                      ${rhs.readonly?if_exists} />
			                </td>
			 </tr>
			 <tr>
			            <td>Requirement Changing Times</td>
			              <td>
			                 <input type="text" name="woobject.changeTimes" value='<#if rhs["model"]?exists>${rhs["model"].changeTimes?if_exists}</#if>' ${rhs.formPro.changeTimes?if_exists}
			                    ${rhs.readonly?if_exists} />
			                </td>
			            <td>Rework Times</td>
			              <td>
			                <input type="text" name="woobject.reworkTimes" value='<#if rhs["model"]?exists>${rhs["model"].reworkTimes?if_exists}</#if>' ${rhs.formPro.reworkTimes?if_exists}
			                    ${rhs.readonly?if_exists} />
			                </td>
			 </tr>
			  <tr>
			   	<td>Planning Start Date</td>
			              <td>
			              <input type="text" id="startTime" name="woobject.startTime" value='<#if rhs["model"]?exists>${rhs["model"].startTime?if_exists}</#if>'
			                onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"
			                ${rhs.formPro.startTime?if_exists} />
			                </td>
			            <td>Planning End Date</td>
			              <td>
			              <input type="text" id="endTime" name="woobject.endTime" value='<#if rhs["model"]?exists>${rhs["model"].endTime?if_exists}</#if>'
			                onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"
			                ${rhs.formPro.endTime?if_exists} />
			                </td>
			 </tr>
			 <tr>
			            <td>Priority</td>
			              <td colspan="3">
			                <input type="text" id="priority" name="woobject.priority" value='<#if rhs["model"]?exists>${rhs["model"].priority?if_exists}</#if>'
			                ${rhs.formPro.priority?if_exists} />
			                </td>
			  </tr>
			  <tr>
			     <td>
        			Process Log
			      </td>
			        <td colspan="3">
			        <!--聊天记录（log）面板 -->
					<div id="task_log_div" style="height:123px">
					
					</div>
					<!-- task log -end -->
			        </td>
			  </tr>
			   <tr>
				<td> Attachments </td>
			      <td colspan="3" >
			          <#include "../../common/uploadfile/macro_uploadfile.ftl"/>
			           <@uploadfile 'wo_${rhs.model.id}', 'activiti', '${rhs.formPro.fileUpload?if_exists}'/>
			       </td>
			  </tr>
        </table>
      </div>

      <div class="panel panel-primary">
        <!-- Default panel contents -->
        <div class="panel-heading">Process Panel</div>

        <!-- Table -->
        <table class="table table-condensed table-bordered table-striped table-hover">
          <tbody>
            <tr class="flag" ${rhs.formPro.flag?if_exists}>
              <td colspan="2"> <label style="float:left; margin-right:8px;" class="control-label">Suggestion:</label> 
              	<select id="flag" name="flag" onchange="javascript:process_show_assignee(this, ['1', '3']);" >
					      			<option value="">- Select -</option>
									<option value="3">Assignment To Design Team Decided</option>
									<option value="1">Assignment To Different Domain Needed</option>
									<option value="5">Out Of Scope</option>
								</select>
				</td>
            </tr>
            <tr ${rhs.formPro.systemCompletion?if_exists}>
              <td colspan="2"><label style="float:left; margin-right:8px;" class="control-label">Evaluate System Completion:</label> 
              	<select id="systemCompletion" name="systemCompletion" onchange="javascript:process_show_assignee(this, ['2']);">
					      <option value="">- Select -</option>
					      <option value="1">System Completed</option>
					      <option value="2">System not Completed</option>
					    </select></td>
            </tr>
            <tr ${rhs.formPro.codeFix?if_exists}>
              <td colspan="2"><label style="float:left; margin-right:8px;" class="control-label">Code Fix:</label> 
              	<select id="codeFix" name="codeFix">
					      <option value="">- Select -</option>
					      <option value="1">Needed</option>
					      <option value="2">Not Needed</option>
					    </select></td>
            </tr>
            <tr ${rhs.formPro.selectAssignee?if_exists}>
              <td colspan="2"><#include "../../common/activiti/include_select_assignee.ftl"/></td>
            </tr>
            <tr>
            	<td colspan="2"><label style="float:left; margin-right:8px;" class="control-label">Input Log:</label>
            		<div style="width:80%;">
          			<#if rhs["task"].id != ''>
					<textarea style="height:30px;border:1px solid #428bca;float:left;width:80%" class="form-control input-sm" id="log_log" name="log" placeholder="Input your log here..."></textarea>
					<input type="hidden" id="log_taskId" name="taskId" value="${rhs["task"].id?if_exists}"/>
					<input type="button" style="display:inline;margin-top:7px;margin-left:8px;" class="btn btn-xs btn-info" value="Add Comment" onclick="add_log('');" style="margin-top:53px;">
		  			</#if>
        		</div>
            	</td>
            </tr>
            <tr>
              <td colspan="2"><input type="button" class="btn btn-xs btn-info" value="Complete Task" class="btn" onclick="process_complete_task('edit_form');"></td>
            </tr>
          </tbody>
        </table>
      </div>
</form>


<script type="text/javascript">
$.ajax({
	type: 'post',
	url: 'common_tasklog_list.do',
	data: 'taskId=${rhs["task"].id}',
	async: false,
	cache: false,
	success: function(data){
		$("#task_log_div").html(data);
	}
});


</script>