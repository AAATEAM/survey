<#if rhs["exception"]?exists>
	<#include "import_itembyxls.ftl">
<#else>
	<script type="text/javascript">
	<#if rhs["method"] == 'item'>
		document.location.href = 'exam_item_list.do';
	</#if>
	<#if rhs["method"] == 'paper'>
		document.location.href = 'exam_paper_list.do';
	</#if>
	</script>
</#if>
