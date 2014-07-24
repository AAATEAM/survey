	<#if Session?exists&&Session["menuList"]?exists>
		
				    <#list  Session["menuList"] as rescource>
			         <br>${rescource.name?if_exists}
				</#list> 	
		
	</#if>