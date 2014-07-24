<#assign show=Session["show"]?default("all")> 
<table class="table table-condensed table-hover">
	<thead>
	<tr>
	<th>teamname</th>
	<th>name</th>
	<th>level</th>
	<th>分数 </th>
	<#if show=='all'>
		<th>评语</th>
		<th>项目经验</th>
	</#if>
	</tr>
	</thead>
	<tbody>
	<#list rhs["dataList"]?sort_by("teamname") as x>
		   <#if x.teamname!=''>
			<tr style="width:100%"> <#--${rhs["dataList"][x_index+1]}-->
				 <td style="width:90px;">
				<#if lastobject.teamname==x.teamname>
				<#else>
					 <strong>${x.teamname?if_exists}</strong>
				</#if>
				    </td>
					<td style="width:150px;">${x.name?if_exists}(${x.companyname?if_exists})</td>
				    <td style="width:90px;">${x.assessLev?if_exists}</td>
				    <td style="width:70px;">${x.score?if_exists}</td>
		            <#if show=='all'>
				     	<td style="width:190px;table-layout:fixed;word-break:break-all;">${x.mark?if_exists?trim}</td><!--${(x.mark?if_exists)?trim}-->
				    	<td style="table-layout:fixed;word-break:break-all;">${x.experience?if_exists?trim}</td><!--${(x.experience?if_exists)?trim}-->
				    </#if>
				</tr>
			</#if>
			<#assign lastobject=x />
		</#list>
		</tbody>
		</table>