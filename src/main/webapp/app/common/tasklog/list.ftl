
<form >
      <div class="panel panel-default">

        <div class="panel-body" style="position:relative;height:105px;background-color: #F7F7F7;">
			<#--<div style="float:left;  width:34%;">
          			<#if rhs.taskId != ''>
					<textarea style="height:80px;border:1px solid #428bca;float:left;width:65%" class="form-control input-sm" id="log_log" name="log" placeholder="Input your log here..."></textarea>
					<input type="hidden" id="log_taskId" name="taskId" value="${rhs.taskId?if_exists}"/>
					<input type="button" style="display:inline;margin-top:57px;margin-left:8px;" class="btn btn-xs btn-info" value="Add Comment" onclick="add_log();" style="margin-top:53px;">
		  			</#if>
        		</div>-->
		        <!-- Table -->
       <div id="div_scoll" style="height:80px;width:63%;overflow:auto;float:left;padding:10px;margin-left:20px;">
       <#assign i=0 >
       <#list rhs["list"] as x>
		        <#if i<4>
		        	<#if x.log != "Task is OK.">
		    		<#assign i=i+1 >
				      <div style="border-bottom:1px solid #C1CDC1;" >
				    	
				        <strong>
								${x.userName?if_exists}&nbsp;&nbsp;&nbsp;&nbsp;
						</strong>
						<font color="grey" size="1"><small>For Task '${x.taskName?if_exists}'</small></font>&nbsp;&nbsp;
							   <font color="grey" size="1"><small>${x.createTime?if_exists}</small>&nbsp;&nbsp;&nbsp;&nbsp;
								
								<#if x.taskId?exists && x.taskId==rhs.taskId && x.userAccount==Session.userlogined.account>
								<a href='javascript:void(0);' onclick="javascript:del_log('${x.id?if_exists}')" >
									<i class='icon-remove'></i>&nbsp;Delete
								</a>
								</#if>
								
								</font>
						  <br/>
				          ${x.log?if_exists}
				     </div>
					</#if>
	        	</#if>
	        	
       </#list> 
        </div>
        
		<div id="div_all" style="padding:10px;display:none;position:absolute;width:60%;top:-170px;left:130px;z-index:10000;float:right;background-color: #EEEEE0;">
			<a  style="float:right" href="#" onclick="showhide('div_all');" ><span class=ui-icon ui-icon-close></span></a>
				<#list rhs["list"] as x>
				<#if x.log != "Task is OK.">
				      <div style="border-bottom:1px solid #C1CDC1;" >
				        <strong>
								${x.userName?if_exists}&nbsp;&nbsp;&nbsp;&nbsp;
						</strong>
							   <font color="grey" size="1"><small>For Task '${x.taskName?if_exists}'</small></font>&nbsp;&nbsp;
							   <font  color="grey" size="1"><small>${x.createTime?if_exists}</small>&nbsp;&nbsp;&nbsp;&nbsp;
								<#if  x.taskId?exists&&x.taskId==rhs.taskId && x.userAccount==Session.userlogined.account>
								<a href='javascript:void(0);' onclick="javascript:del_log('${x.id?if_exists}')" >
									<i class='icon-remove'></i>&nbsp;Delete
								</a>
								</#if>
								</font>
						  <br/>		
				          ${x.log?if_exists}
				      </div>
					</#if>
				</#list>
		</div>	
			 	
        <div style=" float:left;margin-top:12px; margin-left:4px;">
		<!--<a  class="btn btn-xs btn-info" href="common_tasklog_export.do?taskId=${rhs.taskId?if_exists}&processInstanceId=${rhs.processInstanceId?if_exists}" target="_blank" style="margin-top:42px;">Show All</a>-->
		<#if 1<i >	
			<a  class="btn btn-xs btn-info" href=# onclick="javascript:showhide('div_all');"  style="margin-top:42px;">All Log</a>
         </#if>
         </div>
         </div>
      </div>
</form>



<script type="text/javascript">
function add_log(processInstanceId,woId){
	var log = $("#log_log").val();
	if(log == ''){
		$("#log_log").focus();
		return;
	}
	$.ajax({
		type: 'post',
		url: 'common_tasklog_save.do',
		data: 'log=' + log + '&taskId=${rhs.taskId?if_exists}&processInstanceId=' + processInstanceId,
		async: false,
		cache: false,
		success: function(data){
			$("#task_log_div").html(data);
		}
	});
}

function del_log(id){
	$.ajax({
		type: 'post',
		url: 'common_tasklog_delete.do',
		data: 'id=' + id + '&taskId=${rhs.taskId?if_exists}',
		async: false,
		cache: false,
		success: function(data){
			$("#task_log_div").html(data);
		}
	});
}
	$(function(){$( "#div_all" ).draggable();});  
	function showhide(id){
		if(document.getElementById(id).style.display=="block"){
			document.getElementById(id).style.display="none";
		}else{
			document.getElementById(id).style.display="block";
		}
		return true;
	}
	
	
</script>