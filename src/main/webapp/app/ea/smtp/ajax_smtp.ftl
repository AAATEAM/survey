<#include "../../../common/freemarker/macro_common.ftl">
<table   class="table table-bordered table-condensed  table-indie" width="800">

	    <thead>
			<tr>
			    <th width=25px >ID</th>
			    <th width=100><@i18n "title_mail" /></th>
			    <th  width=50><@i18n "title_title" /></th>
			    <th width=50><@i18n "title_mail_server" /></th>
			    <th  width=50><@i18n "title_mail_port" /></th>
			    <th  width=80><@i18n "title_mail_account" /></th>
			    <th  width=50><@i18n "title_mail_password" /></th>
			    <th  width=150><@i18n "title_operation" /></th></tr>

			</tr>
		</thead>
		<tbody>
		<#list rhs["dataList"]?sort_by("sortNob") as x>
			<tr>
				<td class=nob >
					${x_index+1}
				</td>		
					<td onmouseover="rowOver(this)" onmouseout="rowOut(this)"><input  type="text" style="width:140px" value='${x.sender?if_exists}' onchange="javascript:ajax_smtp('${x.id}','sender',this.value)" /></td>
					<td onmouseover="rowOver(this)" onmouseout="rowOut(this)"><input  type="text" style="width:80px" value='${x.title?if_exists}'  onchange="javascript:ajax_smtp('${x.id}','title',this.value)" /></td>
					<td onmouseover="rowOver(this)" onmouseout="rowOut(this)"><input  type="text" style="width:100px" value='${x.host?if_exists}'  onchange="javascript:ajax_smtp('${x.id}','host',this.value)" /></td>
					<td onmouseover="rowOver(this)" onmouseout="rowOut(this)"><input  type="text" style="width:50px" value='${x.port?if_exists}' onchange="javascript:ajax_smtp('${x.id}','port',this.value)" /></td>
					<td onmouseover="rowOver(this)" onmouseout="rowOut(this)"><input  type="text" style="width:100px" value='${x.account?if_exists}'  onchange="javascript:ajax_smtp('${x.id}','account',this.value)" /></td>
					<td onmouseover="rowOver(this)" onmouseout="rowOut(this)"><input  type="text" style="width:100px" value='${x.passwd?if_exists}'  onchange="javascript:ajax_smtp('${x.id}','passwd',this.value)" /></td>
				<td style="width:50px">
					<#--<a href=# onclick="javascript:action_smtp('delete.do','id=${x.id}')" title="删除">删除</a>-->
					    <a title="删除节点" onclick="javascript:action_smtp('delete.do','id=${x.id}');" class="ui-icon ui-icon-trash"  title=删除 ></a>
					    <#if (rhs["dataList"]?size!=1)>
						    <#if (x_index?string=="0")> 
								<a  onclick="javascript:action_smtp('change_rank.do','id_from=${x.id?if_exists}&id_to=${rhs["dataList"]?sort_by("sortNob")[x_index+1].id}')"  class="ui-icon ui-icon-arrowthick-1-s" title=下移></a>
							<#else>
								<a  onclick="javascript:action_smtp('change_rank.do','id_from=${x.id?if_exists}&id_to=${rhs["dataList"]?sort_by("sortNob")[x_index-1].id}')"  class="ui-icon ui-icon-arrowthick-1-n" title=上移></a>
						    	<#if x_has_next>
					 	 			<a  onclick="javascript:action_smtp('change_rank.do','id_from=${x.id?if_exists}&id_to=${rhs["dataList"]?sort_by("sortNob")[x_index+1].id}')"  class="ui-icon ui-icon-arrowthick-1-s" title=下移></a>
						        </#if>
						 	</#if> 				
					    </#if> 				
				</td>
			</tr>
		</#list> 
		</tbody>
	</table>            
	<blockquote class="pull-right" style="border-right: none;">
		Page ${rhs.currentPage}
		<#-- (${rhs.count}/${rhs.maxPage})&nbsp; -->
		<select style="WIDTH: 60px"   onchange="javascript:action_smtp('change_page_number.do','maxSize='+this.value)" >
				    <option value="${rhs.maxSize}">${rhs.maxSize}</option>
	  				<option value="5">5</option>
	  				<option value="10">10</option>
	  				<option value="20">20</option>
	  				<option value="50">50</option>
	  				<option value="50">200</option>
	 	<select>		
			<#if (rhs.currentPage > 1) ><a class="btn btn-link btn-mini" onclick="javascript:action_smtp('ajax_page_data.do','pageId=1')">first</a></#if>
			<#if (rhs.currentPage > 1) ><a class="btn btn-link btn-mini"  onclick="javascript:action_smtp('ajax_page_data.do','pageId=${rhs.currentPage-1}')">pre</a></#if>
			<#if (rhs.currentPage < rhs.maxPage) ><a class="btn btn-link btn-mini" onclick="javascript:action_smtp('ajax_page_data.do','pageId=${rhs.currentPage+1}')">next</a></#if>
			<#if (rhs.currentPage < rhs.maxPage) ><a class="btn btn-link btn-mini"  onclick="javascript:action_smtp('ajax_page_data.do','pageId=${rhs.maxPage}')">last</a></#if>
		
		
	</blockquote>
<span id="div_action_result" style="display:none">${rhs["info"]?if_exists}</span>
