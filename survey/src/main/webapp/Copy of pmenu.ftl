<#include "common/freemarker/include_header.ftl">
<style>
/* All levels of nav */
.bs-sidebar .nav > li > a {
  display: block;
  color: #716b7a;
  padding: 5px 20px;
}
.bs-sidebar .nav > li > a:hover,
.bs-sidebar .nav > li > a:focus {
  text-decoration: none;
  background-color: #e5e3e9;
  border-right: 1px solid #dbd8e0;
}
.bs-sidebar .nav > .active > a,
.bs-sidebar .nav > .active:hover > a,
.bs-sidebar .nav > .active:focus > a {
  font-weight: bold;
  color: #563d7c;
  background-color: transparent;
  border-right: 1px solid #563d7c;
}

/* Nav: second level (shown on .active) */
.bs-sidebar .nav .nav {
  display: none; /* Hide by default, but at >768px, show it */
  margin-bottom: 8px;
}
.bs-sidebar .nav .nav > li > a {
  padding-top:    3px;
  padding-bottom: 3px;
  padding-left: 30px;
  font-size: 90%;
}


</style>
<body style="background-color: #f7f5fa;">
  <div class="bs-sidebar hidden-print" >
    <ul class="nav bs-sidenav">
	  <li class="nav-header"></li>
		  <li ><a href="ea_organize_index.do" target="mainFrame">组织架构</a></li>
		  <li ><a href="ea_user_menu_user.do" target="mainFrame">用户管理</a></li>
		  <li ><a href="ea_rule_menu_rule.do" target="mainFrame">信息发布</a></li>
		  <li ><a href="ea_smtp_menu_smtp.do" target="mainFrame">邮箱系统</a></li>
		  <li ><a href="ea_systempara_menu_systempara.do" target="mainFrame">系统参数</a></li>
		  <li ><a href="ea_resource_menu_resource.do" target="mainFrame">权限</a></li>
		  <li ><a href="common_activiti_menu_process_definition.do" target="mainFrame">工作流</a></li>
 		  <li ><a href="common_monitor_home.do" target="mainFrame">运行状态</a></li>
 		  <li ><a href="common_activiti_index_demo.do" target="mainFrame">流程启动</a></li>

    </ul>
  </div>
</body> 
 


<#include "common/freemarker/include_header.ftl">
<head>
<style>
body{
	padding:0;
	width:100%;  
	height:100%;  
	margin: 0px auto;  
	background-color:#F5F5F5; 
}
a {
	color: #224888;

}
.container-fluid {
	padding: 0 10px 0 10px;
	margin: 0;
}
.nav-header {
	color: #224888;
	font-size: 14px;
	font-weight: bold;
}
.nav-list > .active > a, .nav-list > .active > a:hover {
	background-color: #456086;
}
</style>
</head>
<div class="container-fluid">
	<!-- <div class="well" style="padding: 12px 0;"> -->
	<div style="padding: 12px 0;">
		<ul class="nav nav-list">
	  <li class="nav-header">System Config</li>
		  <li onclick="menu_active(this)"><a href="ea_organize_index.do" target="mainFrame">organize manager</a></li>
		  <li onclick="menu_active(this)"><a href="ea_user_menu_user.do" target="mainFrame">user manager</a></li>
		  
		  <li onclick="menu_active(this)"><a href="ea_rule_menu_rule.do" target="mainFrame">info center</a></li>
		 <li ><a href="ea_resource_menu_resource.do" target="mainFrame">resource</a></li>
		  <li onclick="menu_active(this)"><a href="ea_smtp_menu_smtp.do" target="mainFrame">email tools</a></li>
		  <li onclick="menu_active(this)"><a href="ea_systempara_menu_systempara.do" target="mainFrame">system para</a></li>
 		  <li onclick="menu_active(this)"><a href="common_monitor_home.do" target="mainFrame">runtime monitor</a></li>
		  <li onclick="menu_active(this)"><a href="common_activiti_menu_process_definition.do" target="mainFrame">process manager</a></li>
		  
 

        <#---
         <li class="nav-header">Report</li>
 		  <li onclick="menu_active(this)"><a href="manager_hrworkshop_menu_hrworkshop.do" target="mainFrame">workshop</a></li>

         <li onclick="menu_active(this)"><a href="ea_report_ipm.do" target="mainFrame">IPM</a></li>

         <li onclick="menu_active(this)"><a href="ea_report_assessment.do" target="mainFrame">Techical assessment</a></li>
         <li onclick="menu_active(this)"><a href="ea_report_tech_member.do" target="mainFrame">Technical Member Team</a></li>
         <li onclick="menu_active(this)"><a href="ea_ea_clean.do" target="mainFrame">清空缓存</a></li>
         <li onclick="menu_active(this)"><a href="ea_report_birt_user.do" target="mainFrame">birt数据源</a></li>
           -->
 		
		</ul>
	</div><!--/.well -->
</div>
<script>
function menu_active(obj){
	$(".active").removeClass("active");
	$(obj).addClass("active")
}
</script>


