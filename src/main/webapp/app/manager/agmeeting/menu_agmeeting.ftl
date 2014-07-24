<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="agmeeting/agmeeting.js"></script>
<a onclick="javascript:create_agmeeting('root')" >添加agmeeting</a>
<hr>
<div style="padding:10px">
	<table>
		<tr>
			<td valign=top width=450>
				<div id=div_agmeeting_tree><#include "ajax_agmeeting.ftl"></div>
			</td>
		</tr>
	</table>
</div>