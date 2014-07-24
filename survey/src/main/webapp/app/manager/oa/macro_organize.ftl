
<#macro digui_orgnaize treeNodes  flag type>
	<#list treeNodes as node>
		  <#if  type="data"> 
			  <#if flag==""> 
			 	<b>${node.name}</b><br>
			  <#else>
			  	<br>${flag}${node.name}
			  </#if>
		  </#if>
		  <#--能力评估时要映射到角色-->
		  <#if  type="organize-competence"> 
  			  <#if flag==""> 
			  	  <br><b>${node.name}</b>
			  <#else>
			 	  <br>${flag}${node.name} 
			 	  
				  <#list node.getRoles() as role>
				     <br>${flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}${role.name} <a href="competence!loadCheckPoint.do?filename=${role.alias}" target=_blank>评估考核项</a>：<#list role.getUsers() as u>[${u.name}]</#list>
				  </#list>			  
			  </#if>
		  </#if>		  	
		  <#if  type="map"> 
			  <#if flag==""> 
			  	  <br><b>${node.name}</b>
			  <#else>
				  <br>${flag}${node.name}
				  <#list node.getRoles() as role>    
				     <br>${flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}--<#list role.getRolegroups() as rolegroup>${rolegroup.name?if_exists}</#list>：<#list role.getUsers() as u>[${u.name}]</#list>
				  </#list>
			  </#if>
		  </#if>			  
          <#--人员部署-->
		  <#if  type="map_person_deploy"> 
		      <#if flag==""> 
		         <td valign=top width=700 > <img src=../../common/images/gif/organize.gif /><b>${node.name}</b>
			  <#else>
				  <br>${flag}<img src=../../common/images/gif/organize.gif />${node.name}
				  <#list node.getRoles() as role>
				     <br>${flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}
				     <span id=${role.id} ><img src=../../common/images/gif/role.gif />${role.name}</span>
				     <a href="ea_iframe_get_userlist_of_role.do?roleId=${role.id}" onclick="return hs.htmlExpand(this, { objectType: 'iframe' })" >
						设置
					 </a>	
					 <BR>
				     	<div style="background-color: #F6F7FB;border:1px solid #c3d9ff;padding:10px">
				        (${role.getUsers()?size}人)<#list role.getUsers() as u>${u.name} &nbsp;&nbsp</#list>
				        </div>
				  </#list>
			  </#if>
		  </#if>			  
          <#--邮件列表-->
		  <#if  type="map_mail_list"> 
		      <#if flag==""> 
		         <td valign=top width=700 > <img src=../../common/images/gif/organize.gif /><b>${node.name}</b>
			  <#else>
				  <br>${flag}<img src=../../common/images/gif/organize.gif />${node.name}
				  <#list node.getRoles() as role>
				     <br>${flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}
				     <span id=${role.id} ><img src=../../common/images/gif/role.gif />${role.name}</span>
				     <!--<a href="ea_iframe_get_userlist_of_role.do?roleId=${role.id}" onclick="return hs.htmlExpand(this, { objectType: 'iframe' })" class="button">
						设置
					 </a>	-->
					 <BR>
				     	<div style="background-color: #F6F7FB;border:1px solid #c3d9ff;padding:10px">
				         <#list role.getUsers() as u>${u.email?if_exists};</#list>
				        </div>
				  </#list>
			  </#if>
		  </#if>			  
          <#--邮件列表-->
		  <#if  type="map_regedit_list"> 
		      <#if flag==""> 
		         <td valign=top width=700 > <img src=../../common/images/gif/organize.gif /><b>${node.name}</b>
			  <#else>
				  <br>${flag}<img src=../../common/images/gif/organize.gif />${node.name}
				  <#list node.getRoles() as role>
				     <br>${flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}
				     <span id=${role.id} ><img src=../../common/images/gif/role.gif />${role.name}</span>
				     <!--<a href="ea_iframe_get_userlist_of_role.do?roleId=${role.id}" onclick="return hs.htmlExpand(this, { objectType: 'iframe' })" class="button">
						设置
					 </a>	-->
					 <BR>
				     	<div style="background-color: #F6F7FB;border:1px solid #c3d9ff;padding:10px">
				         <#list role.getUsers() as u> 
				         <a target=_blank href="http://192.168.10.136:9090/ea/app/manager/user_regedit.do?account=${u.account?if_exists}">${u.name?if_exists}</a>
						 http://192.168.10.136:9090/ea/app/manager/user_regedit.do?account=${u.account?if_exists}
						 填下这个，公司要收集
						 <br>
						 </#list>
				        </div>
				  </#list>
			  </#if>
		  </#if>	
		  <#if  type="input"> 
			  <br>${flag} 
			     <label>名称</lable><input id="${node.id}name"   value='${node.name}' onchange="javascript:update_orgnaize('${node.id}','name',this.value)" /> 
			     <label>别名</lable><input id="${node.id}alias"  value='${node.alias}' onchange="javascript:update_orgnaize('${node.id}','alias',this.value)"/>
		 	     
		 	     <a   title="添加子节点" onclick="javascript:create_orgnaize(${node.id})"><img src=../../common/images/gif/add.gif /></a>
		 	  <#if  (node.getChildOrganizes()?size<1)>
 	
			    <a  title="添加子节点" onclick="javascript:delete_orgnaize(${node.id})"><img src=../../common/images/gif/delete.gif /></a>
			  </#if>
		  </#if>
		  
		  <#if  type="radio"> 
			  <#if flag==""> 
			  <br><b>${node.name}</b>
			  <#else>
			  <br>${flag}<input name=organize type="radio" onclick="javascript:get_organize_role_list('${node.id}')"   value=${node.id} />${node.name}
			  </#if>	
		  </#if>
		  
		  <#if !(node.getChildOrganizes()?size<1)> 
		      <@digui_orgnaize node.getChildOrganizes()?sort_by("id") ,flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" ,type/>	
		  </#if>
	</#list> 
</#macro>