<#include "../../../common/freemarker/include_header.ftl">

<form action="manager_test_day_grid.do" id="search_form" method="post" class="form-search breadcrumb"> <#-- 该ID需当参数传入分页的宏	-->
	Start Date : <input type="text" class="input-small" name="startDate" value='${rhs["startDate"]?if_exists}' onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd'});" />
	Show Days: <select style="width: 60px" id="showDays" name="showDays" onchange="javascript:submit_form();">
				   <option value="10">10</option>
				   <option value="20">20</option>
				   <option value="30">30</option>
			   </select>
			   <script language="javascript" type="text/javascript">
				   document.getElementById("showDays").value = '${rhs["showDays"]?if_exists}';
			   </script>
    <input type="Button" class="btn" value="Submit" onclick="javascript:submit_form();">
</form>

<table class="table table-bordered" >
<tr>
<#list rhs["dayList"] as x>
	<td align="center">${x}</td>
</#list>
</tr>
</table>

<script language="javascript" type="text/javascript">
	
function submit_form() {
	var form = document.getElementById("search_form");
	form.submit();
}	
</script>		