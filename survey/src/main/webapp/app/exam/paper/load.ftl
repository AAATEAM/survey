<#if rhs["byexcel"]>
	<#include "load_byexcel.ftl">
<#else>
	<#if rhs["method"] == "edit">
		<#include "load_default.ftl">
	</#if>
</#if>
	<#include "preview.ftl">