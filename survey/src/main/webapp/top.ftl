<#include "common/freemarker/include_header.ftl">
<style type="text/css">
	a{
		color: #224888; 
	}
	.logo{
		padding-top:20px; 
		padding-left:30px;
	}
	#title-text{
		padding: 35px 0 0 30px;
	}
	#title-text span{
		font-size: 30px;
		color: #12175E;
	}
	.pull-right{
		padding-top: 35px;
		margin-right: 30px;
	}

</style>
<body>
<div style="height:114px; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #e2e2e2;">
    <div class="pull-left">
    
    </div>
    
    <div class="pull-left" id="title-text">
    	<span>试题问卷</span>
    </div>
    
    <div class="pull-right">
        <#--<form name="formlang" id="formlang" action="common_edit_lang.do" method="post">
    	Language
	    <select class=input name="lang" size="1" onchange="document.getElementById('formlang').submit();" value="${Session["lang"]}">
			    <option value="${Session["lang"]}">${language_name[Session["lang"]]}</option>
			    <#list language_name?keys as key>
				   <option value="${key}">${language_name[key]}</option>
				</#list> 
		</select> 			                            
    	</form>-->
		<div>
			<#if Session?exists&&Session["userlogined"]?exists>User：${Session["userlogined"].name?if_exists}  </#if><#--<a href="ea_user_profile.do" target=mainFrame></a>-->
				&nbsp;&nbsp;
  	    	<#if Session?exists&&Session["userlogined"]?exists>
			<#--
			<li><a href="ea_ea_menu_workhomepage.do" target=mainFrame>work-handbook</a> </li>
			<li style="padding-top: 10px;"><span>|</span></li>
			-->
			<br/>
        	<a href="reset_password.ftl" target="mainFrame">Change Password</a>
        </div>
        	<#--
        	<li><a href="access.ftl" target="mainFrame">access</a></li>
             -->
        </#if>

	   	<#if Session?exists&&Session["currnetProject"]?exists>
			&nbsp;&nbsp;项目
			<select style="WIDTH: 130px"  id="userid"  onchange="javascript: changeProject(this.value)">
				<option value=${Session["currnetProject"].id?if_exists}>${Session["currnetProject"].name?if_exists}</option>
					<#list  Session["projectList"] as p>
				<option value=${p.id?if_exists}>${p.name?if_exists} </option>
					</#list>
			</select>
		</#if>
		<#if Session?exists&&Session["currnetProject"]?exists>
				&nbsp;&nbsp;部门     
			    <select style="WIDTH: 130px" id="userid"  onchange="javascript: changuser(this.value)">
				    <#list  Session["departmentList"] as department>
				    <option value=${department.id?if_exists}>${department.name?if_exists} </option>
					</#list>          
				</select>
		</#if>
        <br>
		<span id="div_action_result"></span>	
	</div> 
</div>  
</body>
   
</html>






