<#include "../../../common/freemarker/include_header.ftl">

<script language="javascript">
	function createUserRolegroupRelation(userId,roleId) {
		$.ajax({
	        type:"POST",
	     	url: "ea_ea_create_user_role_relation.do",
	     	data:"userId="+userId+"&roleId="+roleId,
	     	cache: false,
	     	success: function(html){
	     		//document.getElementById('div_user_table').innerHTML=html;
	       }	
	    });  
	}	
</script>
<body style="padding-left:10px">
<div id="div_user_table">
<b>简历预览</b>
<div class="panel panel-default">
<div class="panel-heading">
	<h3 class="panel-title">基本资料</h3>
</div>
<div class="panel-body">
	 <table class="table table-bordered table-striped">

	 <tr>
	 <td>
	<table class="table table-bordered table-striped">
        <tbody>
        <tr>
            <td><strong>中文姓名 :</strong></td>
            <td>${rhs["user"].name?if_exists}</td>
            <td><strong>邮箱:</strong></td>
            <td>${rhs["user"].email?if_exists}</td>
          </tr>
         
          <tr>
            <td><strong>手机号码:</strong></td>
            <td>${rhs["user"].phoneNumber?if_exists}</td>
            <td><strong>QQ号:</strong></td>
            <td>${rhs["user"].qq?if_exists}</td>
          </tr>
          <tr>
            <td><strong>生日:</strong></td>
            <td>${rhs["user"].birthDate?if_exists}</td>
            <td><strong>毕业日期:</strong></td>
            <td>${rhs["user"].graduateDate?if_exists}</td>
          </tr>
          <tr>
            <td><strong>入职日期:</strong></td>
            <td>${rhs["user"].rollDate?if_exists}</td>
            
          </tr>
          </tbody>
      </table>
	 </td>
	 <td width=120px valign=top>
		  <#if  rhs["user"].imgfilename?exists&&rhs["user"].imgfilename!='' ><br><img style="width:100px; height:120px" src="<@context/>file/photo/${rhs["user"].imgfilename?if_exists}" />   
		  <#else> <br><img style="width:100px; height:120px" src="<@context/>common/images/face.jpg" />   
		  </#if>
	 </td>
	 </tr>
	 </table>
</div>
</div>

<#assign findresult=false>
	<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">擅长的技术领域:</h3>
	</div>
	<div class="panel-body">
		<#list rhs["organizelist"] as organize>
			<#list organize.getRoles() as tech>
			<#list rhs["user"].getRoles() as usertech>
				<#if usertech.name == tech.name>
					<input type="checkbox" value="${usertech.id}"  name="tech" style="margin-left:5px;" checked 
					onclick="createUserRolegroupRelation('${rhs["user"].id?if_exists}','${usertech.id}');" >
					${tech.name}</input>
					<#assign findresult=true>
					<#break>
				</#if>
			</#list>
			<#if !findresult>	
				<input type="checkbox" value="${tech.id}" name="tech" style="margin-left:10px;" 
				onclick="createUserRolegroupRelation('${rhs["user"].id?if_exists}','${tech.id}');" >
				${tech.name}</input>
			</#if>
			<#assign findresult=false>
			</#list>
		</#list>
		<#--
		<#list rhs["organizelist"]  as organize>
				<#list organize.getRoles() as role>	
				 <tr>
				 	<td>
					  <input type="checkbox"   style="margin-left:5px;" 
					    		onclick="createUserRolegroupRelation('${rhs["user"].id?if_exists}','${role.id?if_exists}');" 
					  <#list rhs["user"].getRoles()  as x>
			    	   	<#if x.name==role.name>
			    	    checked
			    	    </#if>
		    	    </#list>
					> </input>
					 </td>
					 <td >
					 ${role.name?if_exists}
					</td>
				</tr>
  			     				  
				</#list> 	        		    
			</#list>
			-->
	</div>
	</div>          
    
	<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">项目经验：</h3>
	</div>
	<div class="panel-body">
		${rhs["user"].experience?if_exists}
	</div>
	</div> 

	<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">日常工作：</h3>
	</div>
	<div class="panel-body">
		${rhs["user"].positiondescription?if_exists}
	</div>
	</div> 
 </div>