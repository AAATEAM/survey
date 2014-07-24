<#include "../../../common/freemarker/include_header.ftl">

<script type="text/javascript" src="hrworkshop/hrworkshop.js"></script>

<div id=hrworkshop style="padding:10px ">
<a href="hrworkshop_report.do?year=2012"  target=_blank>2012年报</a>
<a href="hrworkshop_report.do?year=2013"  target=_blank>2013年报</a>
<a href="hrworkshop_report.do?year=2014"  target=_blank>2014年报</a>
<hr>
<table    class="table  table-condensed" style="width:700px">
    <thead>
		<tr>
			<th>WORKSHOP</th>
			<th>讲师</th>
			<th>日期</th>
			<#---->
			<th>开始时间</th>
			<th>结束时间</th>
			
			<th>地址</th>			
			<th>详细内容</th>
			
			
		</tr>
	</thead>

	<tbody>
	<#list rhs["dataList"]?sort_by("id") as x>
		<tr>
			<td style="width:200px>
				<input  style="width:200px" type="text"  value=''  />${x.name?if_exists}
			</td>
			<td>
				${x.teacherName?if_exists}
			</td>
			<td>
				${x.beginDate?if_exists}
			</td>
	
			<td>
				${x.beginTime?if_exists}
			</td>			
			<td>
			${x.beginTime?if_exists}
			</td>
			
			<td>
				${x.address?if_exists}
			</td>	
			
			<td>
			
			${x.description?if_exists}
			
			</td>								
		
		</tr>
	</#list> 
	</tbody>
</table>     

    
</div>
