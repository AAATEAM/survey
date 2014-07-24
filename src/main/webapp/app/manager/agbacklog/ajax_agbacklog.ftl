<#macro digui_agbacklog agbacklogNodes  flag >
	<#list agbacklogNodes as agbacklog>
		<div>${flag}名称		
			    <input value="${agbacklog.name?if_exists}" onclick="javascript:agbacklogId='${agbacklog.id}');" 
			       class=input size=50 onchange="javascript:update_agbacklog('${agbacklog.id}','name',this.value)" /> 
		  	    <a title="添加子节点" onclick="javascript:create_agbacklog(${agbacklog.id})"><img  src="../../common/images/gif/add.gif" /></a> 	
		  	<#if (agbacklog.getChildAgbacklogs()?size<1)> 
				<a title="删除节点" onclick="javascript:delete_agbacklog(${agbacklog.id});"><img  src="../../common/images/gif/delete.gif" /></a>
		  	</#if> 				
			<#if agbacklogNodes?size?string=="1" > 
				<a href="agbacklog_change_level.do?id=${agbacklog.id?if_exists}&beanname=Agbacklog"><img title=前1级 src="../../common/images/gif/up_level.gif" /></a>     
			<#else>
				<#assign index =agbacklog_index>
			 	<#if index?string=="0">
			 	    <a href="agbacklog_change_rank.do?id_from=${agbacklog.id?if_exists}&id_to=${agbacklogNodes[agbacklog_index+1].id}&beanname=Agbacklog" ><img title="下移"  src="../../common/images/gif/down.gif" /></a>
			  	    <a href="agbacklog_change_level.do?id=${agbacklog.id?if_exists}&beanname=Agbacklog"><img title=前1级 src="../../common/images/gif/up_level.gif" /></a>   
			 	<#else>
			 	    <#if agbacklog_has_next>
				 	    <a href="agbacklog_change_rank.do?id_from=${agbacklog.id?if_exists}&id_to=${agbacklogNodes[agbacklog_index-1].id}&beanname=Agbacklog" ><img title=上移  src="../../common/images/gif/up.gif" /></a>
						<a href="agbacklog_change_rank.do?id_from=${agbacklog.id?if_exists}&id_to=${agbacklogNodes[agbacklog_index+1].id}&beanname=Agbacklog" ><img title="下移"  src="../../common/images/gif/down.gif" /></a>
					<#else>
					    <a href="agbacklog_change_rank.do?id_from=${agbacklog.id?if_exists}&id_to=${agbacklogNodes[agbacklog_index-1].id}&beanname=Agbacklog" ><img title=上移   src="../../common/images/gif/up.gif" /></a>
					</#if>
					<a href="agbacklog_change_level.do?id=${agbacklog.id?if_exists}&beanname=Agbacklog"><img title=前1级 src="../../common/images/gif/up_level.gif" /></a>      
	 				<a href="agbacklog_change_level.do?id=${agbacklog.id?if_exists}&parentId=${agbacklogNodes[agbacklog_index-1].id}&beanname=Agbacklog"><img title=后1级 src="../../common/images/gif/down_level.gif" /></a>	
			 	</#if>
			</#if>		  		
		</div>
	  	<#if !(agbacklog.getChildAgbacklogs()?size<1)> 
			<@digui_agbacklog agbacklog.getChildAgbacklogs()?sort_by('sortNob') ,flag+"&nbsp;&nbsp;&nbsp;"/>	
		</#if> 
	</#list> 
</#macro>
<div><@digui_agbacklog rhs["agbacklogRootList"]?sort_by('sortNob'),""/></div>
 <div id="div_agbacklog_result" style="font-weight:bold;color:red;"></div>