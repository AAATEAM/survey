<#include "../../../common/freemarker/include_header.ftl">

<#macro digui_orgnaize treeNodes  flag type>
	<#list treeNodes as node>
		
		  <#if  type="map_regedit_list"> 
		      <#if flag==""> 
		         <td valign=top width=700 > <img src=../../common/images/gif/organize.gif /><b>${node.name}</b>
			  <#else>
				  <br>${flag}<img src=../../common/images/gif/organize.gif />${node.name}
				  <#list node.getRoles() as role>
				     <br>${flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}
				     <span id=${role.id} ><img src=../../common/images/gif/role.gif />${role.name}</span>
				     <!--<a href="oa_user_deploy.do?account=${role.id}" onclick="return hs.htmlExpand(this, { objectType: 'iframe' })" class="button">
						设置
					 </a> 
					 -->	
					 <BR>
				     	<div style="background-color: #F6F7FB;border:1px solid #c3d9ff;padding:10px">
				         <#list role.getUsers() as u> 
				         <a target=_blank href="oa_user_deploy.do?account=${u.account?if_exists}">${u.name?if_exists}</a>
						 </#list>
				        </div>
				  </#list>
			  </#if>
		  </#if>	
		 
		  
		  <#if !(node.getChildOrganizes()?size<1)> 
		      <@digui_orgnaize node.getChildOrganizes()?sort_by("id") ,flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" ,type/>	
		  </#if>
	</#list> 
</#macro>
<div class="capabilityTitle">员工部署调整</div>

<a  href="oa_regedit_sum.do">刷新</a>
<a  href="ea_menu_person_deploy.do">添加新员工</a>

<p>
未分配的人员名单：

<#list rhs["userlist"] as u>
   <#if u.getRoles()?size==0> 
   	  <a target=_blank href="oa_user_deploy.do?account=${u.account?if_exists}">${u.name?if_exists}</a>
   	 </#if>
</#list>
</p>	     
<span id=div_person_deploy_info></span>
<div style="padding:10px">
	<table id=panle_role>
		<tr>
			<@digui_orgnaize rhs["organizeRootList"],"","map_regedit_list"/>
		</tr>
	</table>
</div>
