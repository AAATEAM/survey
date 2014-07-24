<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript">
	<#if !rhs["flag"]>
	<#else>
		alert('${rhs["info"]}');
	</#if>
	document.location.href =  "exam_paper_list.do";
</script>
