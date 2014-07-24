<#macro digui_user userNodes  flag >
	,{"id":"organize.id","pId":"0","name":"All User"}
	<#list userNodes as u>
	      ,{"id":"u_${u.id}","pId":"organize.id","account":"${u.account}","name":"${u.name}"}
	</#list> 
</#macro>
[{"id":"0","pId":"0","name":"Organize"}	
<#assign userList=rhs["userList"]/>
	<@digui_user userList?sort_by('sortNob'),"0" />	
]