<#include "../../../common/freemarker/include_header.ftl">
<#assign count = 1 >
 <table class="table table-condensed table-bordered table-striped ">
 	<tbody>
		<#list rhs["dateReport"]?sort_by("id") as dateReport>	
			<#if count==5>
				<tr>							        			
			</#if>	
			<td>	
		        <h4>${dateReport.date}</h4>
		        <br>	        
		        ${dateReport.context}
	        <td>
	        <#if count==5>
				</tr>
				<#assign count = 1 >					        			
			</#if>	
		    <#assign count = count +1 >
		</#list> 
	</tbody>
</table>