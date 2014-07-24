<table class="table table-condensed table-hover">
	    <thead>
			<tr>
			    <td width=40px style="padding-left: 15px;"><strong>#</strong></td>
				<td width=700px><strong> Question  <#--<@i18n "title_title" />--></strong></td>
				<td width=120px><strong><@i18n "title_type" /></strong></td>
				<td></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<#list rhs["dataList"]?sort_by("id") as x>
			 <tr>
			    <td class=nob style="padding-left: 15px;">${x_index+1}</td>
				<td>${x.content?if_exists}</td>
				<td>
					<#if x.type == 1>
						<@i18n "title_single" />
					</#if>
					<#if x.type == 2>
						<@i18n "title_multi" />
					</#if>
					<#if x.type == 3>
						<@i18n "title_blank" />
					</#if>
					<#if x.type == 4>
						<@i18n "title_essay" />
					</#if>
				</td>
				<td><a href="exam_item_load.do?method=edit&id=${x.id}"><@i18n "title_edit" /></a> <!--| <a href="exam_item_load.do?method=show&id=${x.id}"> <@i18n "title_view" /></a> -->| <a onclick="action_item('delete.do','${x.id}');" href="#"><@i18n "title_delete" /></a></td><#--onclick="action_item('delete.do','${x.id}');"  exam_item_delete.do?id=${x.id}-->
				<td></td>
			</tr>
			</#list>
		</tbody>
	</table>
				<form action="exam_item_list.do" id="search_form" method="post" style="display:none;">
				<input type="hidden" name="search" value="search">
				<input type="hidden" name="pageId" id="pageId">
				<input type="hidden" name="maxSize" id="pageMaxSize">
			</form>
		<#include "../../../common/freemarker/macro_pagination.ftl">
		<@pagination  "search_form" />