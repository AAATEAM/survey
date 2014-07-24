<#include "../../../common/freemarker/include_header.ftl">
<div class="span12 content" id=div_customer_table>
		
   <table   class="table  table-condensed">
	    <thead>
			<tr>
				<th>姓名</th>
				<th>性别</th>
				<th>联系电话</th>
				<th>邮箱</th>
			</tr>
		</thead>
		<tbody>
		<#list rhs["dataList"]?sort_by("sortNob") as x>
			<tr>
				<td>${x.name?if_exists}</td>
				<td>${x.sex?if_exists}</td>
				<td>${x.phone?if_exists}</td>
				<td>${x.email?if_exists}</td>
			</tr>
		</#list> 
		</tbody>
	</table> 
</div>
