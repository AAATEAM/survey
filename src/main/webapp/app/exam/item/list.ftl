<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<script type="text/javascript" src="<@context_module/>item.js"></script>
<div style="margin:5px; height: 30px;">
	<#include "include_add_search.ftl">
	<div style="position:absolute; ">
		&nbsp;&nbsp;
		<a class="btn btn-xs btn-primary "  href="exam_item_save.do?method=show"><@i18n "menu_item_new" /></a>
		<a class="btn btn-xs btn-primary "  href="exam_item_import_itembyxls.do?method=item">Import by Excel<#---<@i18n "menu_item_new_excel" />--></a>
		<a class="btn btn-xs btn-primary "  href="exam_knowledge_menu_knowledge.do">Knowledge Area Management<#---<@i18n "menu_knowledge" />--></a>
	</div>
</div>

<div style="margin:5px;"> 
	<div class="panel panel-primary" style="clear:both;">
      <div class="panel-heading" style="clear: both;"><strong><@i18n "title_item" /></strong></div>
      <div class="panel-body" id="div_item_table">
		<#include "ajax_item.ftl">
      </div>
    </div>
</div>
