<#include "../../../common/freemarker/include_header.ftl">
试卷管理 （请设置试题考核类别的个数）
<#list rhs["organizeRootList"]?sort_by('sortNob') as organize>
<table> 
	  <tr>
	  	  <td><br><b>${organize.name?if_exists}	</b></td>
	  	  <td></td>
	  </tr>		
	  <#list organize.getChildOrganizes() as topic>
	  <tr>
	      <td>--${topic.name?if_exists}</td>
	      <td><input  type="text"  onchange="javascript:action_testpaper('change_topic_number.do','number='+this.value);" value='<#if rhs["value"][topic.id?string]?exists><#else>空</#if>' />个题</td>
	  </tr>
	  </#list>
</table>	   
</#list>

<#--${rhs["value"][topic.id]}-->