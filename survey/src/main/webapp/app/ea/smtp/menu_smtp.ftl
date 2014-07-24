<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<script type="text/javascript" src="<@context_module/>smtp.js"></script>
<div style="margin:5px;" >
	&nbsp;&nbsp;
	<a class="btn btn-xs btn-primary"  onclick="javascript:action_smtp('create.do','');"><@i18n "title_smtp_add" /></a>
	<a class="btn btn-xs btn-primary" href="ea_ea_menu_mail_list.do" target="mainFrame"><@i18n "menu_mail_tool" /></a>
	
	<div class="panel panel-primary" >
		<div class="panel-heading"><strong>Mail List</strong></div>
      	<div class="panel-body" id="div_smtp_table">
			<div id="div_user_table"><#include "ajax_smtp.ftl"></div>
	  	</div>
    </div>
</div>
	
	
	
	
	
</div>

