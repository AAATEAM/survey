
<#include "../../../common/freemarker/include_header.ftl">
试题管理

<#list rhs["organizeRootList"]?sort_by('sortNob') as organize>
  <br><b>${organize.name?if_exists}	</b>		
	<#list organize.getChildOrganizes() as organizesub>
		<br>-  ${organizesub.name?if_exists}	<a href="manager_question_menu_question.do?id=${organizesub.id?if_exists}" >试题管理</a>
	</#list>  	   
</#list>
