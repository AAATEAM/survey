<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<head>
<script type="text/javascript" src="<@context_module/>knowledge.js"></script>
</head>
<body style="padding-left:30px">
<div class="row">
	<div class="span5">
	<a class="btn btn-xs btn-primary"  onclick="javascript:action_knowledge('create.do','id=root');">Add Knowledge Area<#---<@i18n "menu_knowledge_new" />--></a>
	<a class="btn btn-xs btn-primary"  onclick="javascript:window.location.href='exam_item_list.do';"><@i18n "return" /></a>
	</div>
	<br/>
	<div id="div_knowledge_tree" class="span11">
		<#include "ajax_knowledge.ftl">
	</div>
</div>
</body>