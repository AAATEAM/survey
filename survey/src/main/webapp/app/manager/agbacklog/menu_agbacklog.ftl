<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="agbacklog/agbacklog.js"></script>

<div id="tabs">
	<#include "../include_tab.ftl">	  
	<div id="tabs-1">
		<a onclick="javascript:create_agbacklog('root')" >添加agbacklog</a>
		
		<div style="padding:10px">
			<table>
				<tr>
					<td valign=top width=450>
						<div id=div_agbacklog_tree><#include "ajax_agbacklog.ftl"></div>
					</td>
				</tr>
			</table>
		</div>

	</div>
</div>




