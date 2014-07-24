<#if rhs["find"]?exists && !rhs["find"]>
	${rhs["info"]?if_exists}
<#else>
	<script type="text/javascript" defer="defer">
		alert("${rhs["result"]}");
	</script>
</#if>