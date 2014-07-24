<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" defer="defer">
<#if rhs["flag"]>
		alert("${rhs["info"]}");
</#if>
</script>
<#include "ajax_item.ftl">