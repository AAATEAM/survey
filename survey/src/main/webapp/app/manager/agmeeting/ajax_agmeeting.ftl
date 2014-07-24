<#macro digui_agmeeting agmeetingNodes  flag >
	<#list agmeetingNodes as agmeeting>
		<div>${flag}名称		
			    <input value="${agmeeting.name?if_exists}" onclick="javascript:agmeetingId='${agmeeting.id}');" 
			       class=input size=50 onchange="javascript:update_agmeeting('${agmeeting.id}','name',this.value)" /> 
		  	    <a title="添加子节点" onclick="javascript:create_agmeeting(${agmeeting.id})"><img  src="../../common/images/gif/add.gif" /></a> 	
		  	<#if (agmeeting.getChildAgmeetings()?size<1)> 
				<a title="删除节点" onclick="javascript:delete_agmeeting(${agmeeting.id});"><img  src="../../common/images/gif/delete.gif" /></a>
		  	</#if> 				
			<#if agmeetingNodes?size?string=="1" > 
				<a href="agmeeting_change_level.do?id=${agmeeting.id?if_exists}&beanname=Agmeeting"><img title=前1级 src="../../common/images/gif/up_level.gif" /></a>     
			<#else>
				<#assign index =agmeeting_index>
			 	<#if index?string=="0">
			 	    <a href="agmeeting_change_rank.do?id_from=${agmeeting.id?if_exists}&id_to=${agmeetingNodes[agmeeting_index+1].id}&beanname=Agmeeting" ><img title="下移"  src="../../common/images/gif/down.gif" /></a>
			  	    <a href="agmeeting_change_level.do?id=${agmeeting.id?if_exists}&beanname=Agmeeting"><img title=前1级 src="../../common/images/gif/up_level.gif" /></a>   
			 	<#else>
			 	    <#if agmeeting_has_next>
				 	    <a href="agmeeting_change_rank.do?id_from=${agmeeting.id?if_exists}&id_to=${agmeetingNodes[agmeeting_index-1].id}&beanname=Agmeeting" ><img title=上移  src="../../common/images/gif/up.gif" /></a>
						<a href="agmeeting_change_rank.do?id_from=${agmeeting.id?if_exists}&id_to=${agmeetingNodes[agmeeting_index+1].id}&beanname=Agmeeting" ><img title="下移"  src="../../common/images/gif/down.gif" /></a>
					<#else>
					    <a href="agmeeting_change_rank.do?id_from=${agmeeting.id?if_exists}&id_to=${agmeetingNodes[agmeeting_index-1].id}&beanname=Agmeeting" ><img title=上移   src="../../common/images/gif/up.gif" /></a>
					</#if>
					<a href="agmeeting_change_level.do?id=${agmeeting.id?if_exists}&beanname=Agmeeting"><img title=前1级 src="../../common/images/gif/up_level.gif" /></a>      
	 				<a href="agmeeting_change_level.do?id=${agmeeting.id?if_exists}&parentId=${agmeetingNodes[agmeeting_index-1].id}&beanname=Agmeeting"><img title=后1级 src="../../common/images/gif/down_level.gif" /></a>	
			 	</#if>
			</#if>		  		
		</div>
	  	<#if !(agmeeting.getChildAgmeetings()?size<1)> 
			<@digui_agmeeting agmeeting.getChildAgmeetings()?sort_by('sortNob') ,flag+"&nbsp;&nbsp;&nbsp;"/>	
		</#if> 
	</#list> 
</#macro>
<div><@digui_agmeeting rhs["agmeetingRootList"]?sort_by('sortNob'),""/></div>
 <div id="div_agmeeting_result" style="font-weight:bold;color:red;"></div>