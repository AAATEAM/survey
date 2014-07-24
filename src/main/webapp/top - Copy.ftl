



<#include "common/freemarker/include_header.ftl">
<head>

</head>


<div class="navbar navbar-primary navbar-static-top">
<div class="navbar-inner">
   <ul class="nav pull-left">
	<img class="logo" style="height:50px" src="common/images/elogo.png" />
   </ul>


   <ul class="nav pull-right">
     <li><span id="div_action_result"></span></li>
     <#if Session?exists&&Session["currnetProject"]?exists>
	   <li style="padding-top:10px">
			&nbsp;&nbsp;PROJECT：
		
			<select style="WIDTH: 130px"  id="userid"  onchange="javascript: changeProject(this.value)">
				<option value=${Session["currnetProject"].id?if_exists}>${Session["currnetProject"].name?if_exists}</option>
			    <#list  Session["projectList"] as p>
			    <option value=${p.id?if_exists}>${p.name?if_exists} </option>
				</#list>
			</select>
		</li>  
	</#if>
    
	<#if Session?exists&&Session["currnetProject"]?exists>
		<li style="padding-top:10px">
			&nbsp;&nbsp;DEPARTMENT：     
		    <select style="WIDTH: 130px" id="userid"  onchange="javascript: changuser(this.value)">
			    <#list  Session["departmentList"] as department>
			    <option value=${department.id?if_exists}>${department.name?if_exists} </option>
				</#list>          
			</select>
		</li>
	</#if>
		<#if Session?exists&&Session["userlogined"]?exists>
		<#--
		<li><a href="ea_ea_menu_workhomepage.do" target=mainFrame>work-handbook</a> </li>
	
		<li style="padding-top: 10px;"><span>|</span></li>
		-->
      	<li><a href="ea_user_profile.do" target=mainFrame>${Session["userlogined"].name?if_exists}  </a> </li>  
        <li style="padding-top: 10px;"><span>|</span></li>
        <li><a href="reset_password.ftl" target="mainFrame">Change Password</a></li>
        <#--
        <li><a href="access.ftl" target="mainFrame">access</a></li>
             -->
        </#if>
   
    
    </ul>
</div>
</div>
