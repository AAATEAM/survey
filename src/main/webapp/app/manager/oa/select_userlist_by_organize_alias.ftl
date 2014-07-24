<#--
[{"id":"first","pId":"0","name":"Ericsson"}
<#macro digui_role roleNodes  flag >
	<#list roleNodes as role>
  	      <#list role.getUsers() as u>
  	      	  ,{"id":"${role.id}","pId":"${flag}","account":"${u.account}","name":"${u.name}(${role.name?if_exists})"}
  	      </#list>	
		  <#if !(role.getChildRoles()?size<1)> 
		      <@digui_role role.getChildRoles()?sort_by('sortNob'), role.id />	
		  </#if>
	</#list> 
</#macro>
<@digui_role rhs["roleList"]?sort_by('sortNob'), "first" />	
]

-->



<#macro digui_organize organizeNodes  flag >
	<#list organizeNodes as organize>
	      ,{"id":"${organize.id}","pId":"${flag}","name":"${organize.name}"}
	        	 <#list organize.allUser() as u>
	  	      	  ,{"id":"u_${u.id}","pId":"${organize.id}","account":"${u.account}","name":"${u.name}"}
	  	      </#list>	     
	
		  <#if !(organize.getChildOrganizes()?size<1)> 
		      <@digui_organize organize.getChildOrganizes()?sort_by('sortNob'), organize.id/>	
		  </#if>
	</#list> 
</#macro>
[{"id":"0","pId":"0","name":"Ericsson"}	
<#assign organizeRootList=rhs["organizeRootList"]/>
	<@digui_organize organizeRootList?sort_by('sortNob'),"0" />	
]