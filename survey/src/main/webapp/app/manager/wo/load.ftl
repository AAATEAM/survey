<#include "../../../common/freemarker/include_header.ftl">
			<form name="form_wo" action="manager_wo_save.do" metiod="post">
				<div class="panel panel-primary">
				    <div class="panel-heading">
				    	<#if rhs.readonly?exists> WO Detail<#else>Edit WO</#if>
				    </div>
					<div class="panel-body">
					</div>
				 <table class="table table-condensed table-bordered table-striped">
					<tr>
						<td>Request ID </td>
						<td>
							<input type="hidden" name="woobject.id" value='<#if rhs["wo"]?exists>${rhs["wo"].id?if_exists}</#if>' />
							<input type="hidden" name="woobject.projectId" value='<#if rhs["wo"]?exists>${rhs["wo"].projectId?if_exists}</#if>' />
							<input type="hidden" name="woobject.processInstanceId" value='<#if rhs["wo"]?exists>${rhs["wo"].processInstanceId?if_exists}</#if>' />
							<input type="text" name="woobject.requestid" value='<#if rhs["wo"]?exists>${rhs["wo"].requestid?if_exists}</#if>'${rhs.readonly?if_exists}>
						</td>
						<td >WO Title </td>
						<td>
    						<input type="text"  name="woobject.title" value='<#if rhs["wo"]?exists>${rhs["wo"].title?if_exists}</#if>' ${rhs.readonly?if_exists} />
						</td>
					</tr>
					
					<tr>
						<td>WO Description </td>
						<td colspan=3>
							<textarea style="width:530px" name="woobject.requestDesc" ${rhs.readonly?if_exists} ><#if rhs["wo"]?exists>${rhs["wo"].requestDesc?if_exists}</#if></textarea>
						</td>
					</tr>
					
					<tr>
						<td>Business Type</td>
						<td>
							<select id="businessType" name="woobject.businessType" ${rhs.readonly?if_exists} >
							    <option value="Change Request">Change Request</option>
							    <option value="Service Request">Service Request</option>
							    <option value="Work Package">Work Package</option>
						    </select>
						</td>
						<td>Service Function</td>
						<td>
							<select id="serviceFunction" name="woobject.serviceFunction" ${rhs.readonly?if_exists} >
							    <option value="Application Development &amp; 3rd Level Support">Application Development &amp; 3rd Level Support</option>
							    <option value="2nd Level Operations">2nd Level Operations</option>
							    <option value="Deployment">Deployment</option>
						    </select>
						</td>
					</tr>
					<script language="javascript" type="text/javascript">
						document.getElementById("serviceFunction").value = '<#if rhs["wo"]?exists>${rhs["wo"].serviceFunction?if_exists}</#if>';
						document.getElementById("businessType").value = '<#if rhs["wo"]?exists>${rhs["wo"].businessType?if_exists}</#if>';
					</script>
					
					<tr>
						<td>Manday </td>
  						<td>
   							<input type="text" title="客户给予的Manday" name="woobject.manday" value='<#if rhs["wo"]?exists>${rhs["wo"].manday?if_exists}</#if>'
      							${rhs.readonly?if_exists} />
      					</td>
						<td>Actual ManDay</td>
  						<td>
   							 <input title="完成需求的实际Manday" type="text" name="woobject.actualManday" value='<#if rhs["wo"]?exists>${rhs["wo"].actualManday?if_exists}</#if>' 
      							${rhs.readonly?if_exists} />
      					</td>
      				</tr>
					
					<tr>
						<td>Reception Date </td>
  						<td>
   							 <input type="text"  title="接到需求的时间" name="woobject.receiveTime" value='<#if rhs["wo"]?exists>${rhs["wo"].receiveTime?if_exists}</#if>' 
      							onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ${rhs.readonly?if_exists} />
      					</td>
						<td>Estimation Date </td>
  						<td>
   							 <input title="评估任务反馈给客户的时间" type="text" name="woobject.responseTime" value='<#if rhs["wo"]?exists>${rhs["wo"].responseTime?if_exists}</#if>' 
      							onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" 
      								${rhs.readonly?if_exists} />
      					</td>
      				</tr>
					<tr>
						<td>Planning Start Date </td>
  						<td>
   							 <input type="text" name="woobject.startTime" value='<#if rhs["wo"]?exists>${rhs["wo"].startTime?if_exists}</#if>' 
     				 			onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" 
      								${rhs.readonly?if_exists} />
      					</td>
						<td>Planning End Date </td>
  						<td>
   							<input type="text" name="woobject.endTime" value='<#if rhs["wo"]?exists>${rhs["wo"].endTime?if_exists}</#if>' 
						      onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" 
						      	${rhs.readonly?if_exists} />
      					</td>
      				</tr>
					<tr>
						<td>Requirement Changing Times</td>
  						<td>
   							 <input type="text" name="woobject.changeTimes" value='<#if rhs["wo"]?exists>${rhs["wo"].changeTimes?if_exists}<#else>0</#if>' 
      							${rhs.readonly?if_exists} title="需求变更的次数"/>
      					</td>
						<td>Rework Times</td>
  						<td>
   							<input type="text" name="woobject.reworkTimes" value='<#if rhs["wo"]?exists>${rhs["wo"].reworkTimes?if_exists}<#else>0</#if>' 
      							${rhs.readonly?if_exists} title="返工次数"/>
      					</td>
      				</tr>
      				<#--
					<tr>
						<td>Priority</td>
  						<td colspan="3">
   							<input type="text" name="woobject.priority" value='<#if rhs["wo"]?exists>${rhs["wo"].priority?if_exists}</#if>' 
      							${rhs.readonly?if_exists} />
      					</td>
      				</tr>
      				-->
					<tr>
						<td colspan="1">
        					Process Log
			              </td>
						<td colspan="3">
						<#if rhs["wo"]?exists>
		  <#if rhs["wo"].processInstanceId?exists>
		    <!-- task log -start -->
		    <div class="span4" id="task_log_div" >
		    
		    </div>  
		    <script type="text/javascript">
		    $.ajax({
		      type: 'post',
		      url: 'common_tasklog_list.do',
		      data: 'processInstanceId=${rhs["wo"].processInstanceId}',
		      async: false,
		      cache: false,
		      success: function(data){
		        $("#task_log_div").html(data);
		      }
		    });
		    </script>
		    <!-- task log -end -->
		  </#if>
		</#if>
				<#if !rhs.readonly?exists && rhs["wo"].processInstanceId?exists && rhs["wo"].processInstanceId != "">
                    <textarea style="height:30px;border:1px solid #428bca;float:left;width:80%" class="form-control input-sm" id="log_log" name="log" placeholder="Input your log here..."></textarea>
					<input type="hidden" id="log_taskId" name="processInstanceId" value="${rhs["wo"].processInstanceId}"/>
					<input type="button" style="display:inline;margin-top:7px;margin-left:8px;" class="btn btn-xs btn-info" value="Add Comment" onclick="add_log(${rhs["wo"].processInstanceId});" style="margin-top:53px;">
		  		</#if>		
		
		
						</td>
					</tr>
					<tr>
      					<td>
      						Attachments
      					</td>
      					<td colspan="3">
		      				<#include "../../common/uploadfile/macro_uploadfile.ftl"/>
							<#if rhs.wo?exists>
								<@uploadfile 'wo_${rhs.wo.id?if_exists}', 'activiti', '${rhs.readonly?if_exists}'/>
							</#if>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<#if !rhs.readonly?exists>
						    	<input type="button" class="btn btn-xs btn-info" value="Save" id="submitButton"/>
						    </#if>
						    <a  class="btn btn-xs btn-info" href="manager_wo_list.do">Return</a>
						</td>
					</tr>
				</table>
				</div>
			</form>
<div id="dialog">
	    <div id=div_wo_dialog>
	    	<h3><img src="<@context/>common/images/loading.gif"/>Please wait...</h3>
	    </div>
</div>
<script>
	//function submitForm(){
		//$("#submitButton").val("Please wait...");
		//$("#submitButton").attr("disabled","disabled");
		//$('#dialog').dialog('open');
		//document.getElementsByName("form_wo")[0].submit();
	//}
	
	$('#submitButton').click(function () {
		var btn = $(this);
		btn.button('loading');
		$('#dialog').dialog('open');
		document.getElementsByName("form_wo")[0].submit();
	});
	
	$(function(){
		$('#dialog').dialog({
			autoOpen: false,
			modal: true,
			width: 400
		});
	});
</script>