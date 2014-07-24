
<#macro digui_agsprint agsprintNodes  flag >
	<#list agsprintNodes as agsprint>
	    <tr>
	    	<td width=400px>
			${flag}		
			  <input  value="${agsprint.name?if_exists}" 
			      style="WIDTH: 250px"  onchange="javascript:action_agsprint('agsprint_update.do','column=name&id=${agsprint.id?if_exists}&columnValue='+this.value)" /> 
			</td>
			<td width=200px>
  		  		<a  onclick="javascript:action_agsprint('agsprint_create.do','id=${agsprint.id}');" class="ui-icon ui-icon-plus" ></a>
 			<#if (agsprint.getChildAgsprints()?size<1)> 
				<a title="删除节点" onclick="javascript:action_agsprint('agsprint_delete.do','id=${agsprint.id}');" class="ui-icon ui-icon-trash"  title=删除 ></a>
		  	</#if> 				
			<#if agsprintNodes?size?string=="1" > 
				<a href="agsprint_change_level.do?id=${agsprint.id?if_exists}&beanname=Agsprint" class="ui-icon ui-icon-arrowthick-1-w" title=前1级 ></a>     
			<#else>
				<#assign index =agsprint_index>                                                
			 	<#if index?string=="0">
			 	    <a href="agsprint_change_rank.do?id_from=${agsprint.id?if_exists}&id_to=${agsprintNodes[agsprint_index+1].id}&beanname=Agsprint" class="ui-icon ui-icon-arrowthick-1-s"  title=下移></a>
			  	    <a href="agsprint_change_level.do?id=${agsprint.id?if_exists}&beanname=Agsprint" class="ui-icon ui-icon-arrowthick-1-w" title=前1级></a>   
			 	<#else>
			 	    <#if agsprint_has_next>
				 	    <a href="agsprint_change_rank.do?id_from=${agsprint.id?if_exists}&id_to=${agsprintNodes[agsprint_index-1].id}&beanname=Agsprint" class="ui-icon ui-icon-arrowthick-1-n" title=上移></a>
						<a href="agsprint_change_rank.do?id_from=${agsprint.id?if_exists}&id_to=${agsprintNodes[agsprint_index+1].id}&beanname=Agsprint" class="ui-icon ui-icon-arrowthick-1-s"  title=下移></a>
					<#else>
					    <a href="agsprint_change_rank.do?id_from=${agsprint.id?if_exists}&id_to=${agsprintNodes[agsprint_index-1].id}&beanname=Agsprint" class="ui-icon ui-icon-arrowthick-1-n" title=上移></a>
					</#if>
					<a href="agsprint_change_level.do?id=${agsprint.id?if_exists}&beanname=Agsprint" class="ui-icon ui-icon-arrowthick-1-w" title=前1级></a>      
	 				<a href="agsprint_change_level.do?id=${agsprint.id?if_exists}&parentId=${agsprintNodes[agsprint_index-1].id}&beanname=Agsprint" class="ui-icon ui-icon-arrowthick-1-e" title=后1级></a>	
			 	</#if>
			</#if>
			</td>

        <td>
		 资源:
		 <input class="user" style="width:100px" type="text"  value='${agsprint.resources?if_exists}'  onblur="javascript:action_agsprint('agsprint_update.do','column=resources&id=${agsprint.id?if_exists}&columnValue='+this.value)" />
		</td>
		<td>
		</td>
		<td>
		
			<a href="agsprint_detail_task.do?objectname=Agsprint&id=${agsprint.id}&op=r&propertyname=content"  target=_blank >	
 				查看</a>			
		</td>
		
		</td></tr>
	  	<#if !(agsprint.getChildAgsprints()?size<1)> 
			<@digui_agsprint agsprint.getChildAgsprints()?sort_by('sortNob') ,flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>	
		</#if> 
		
	</#list> 
</#macro>
 
<table    class="table  table-condensed" style="width:1000px">
     <thead>
		<tr>
			<th>sprint标题</th><th>整理</th><th>资源</th><th>完成百分比</th><th>详细任务分配</th>
		</tr>
	</thead>   
    
    
	<@digui_agsprint rhs["agsprintRootList"]?sort_by('sortNob'),""/>
</table>
<span id="div_action_result" class="small text-${rhs["info_type"]?if_exists} ">
	${rhs["info"]?if_exists}
</span>
