<div  id=div_hrworkshop_table style="margin:10px">
 <table   class="table  table-condensed" style="width:900px">
    <thead>
		<tr>
			<th>标题</th>
			<th>详细内容</th>
			<th>讲师</th>
			<th>培训日期</th>
			<#--
			<th>开始时间</th>
			<th>结束时间</th>
			-->
			<th>地址</th>			
		
			<th>录入者</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<#list rhs["dataList"]?sort_by("id") as x>
		<#if Session["userlogined"].account=='admin'||(x.inputname?exists&&Session["userlogined"].account==x.inputname) >
	    <tr>
			<td>                                                            
			<textarea   style="width:100px;height:40px" onchange="javascript:action_hrworkshop('manager_hrworkshop_update.do','column=name&id=${x.id?if_exists}&columnValue='+this.value)">${x.name?if_exists}</textarea>

			</td>
			<td>
				<textarea   style="width:200px;height:40px" onchange="javascript:action_hrworkshop('manager_hrworkshop_update.do','column=description&id=${x.id?if_exists}&columnValue='+this.value)">${x.description?if_exists}</textarea>
			</td>			
			<td>
					<input class="user" style="width:120px" type="text"  value='${x.teacherName?if_exists}' onblur="javascript:action_hrworkshop('manager_hrworkshop_update.do','column=teacherName&id=${x.id?if_exists}&columnValue='+this.value)"  />
			</td>
				
			<td>
				<input  size=10 type="text" style="width:120px" value='${x.beginDate?if_exists}'  onchange="javascript:action_hrworkshop('manager_hrworkshop_update.do','column=beginDate&id=${x.id?if_exists}&columnValue='+this.value)" onClick="WdatePicker()"/>
			</td>
	
			<td>
				<input   type="text" style="width:120px" value='${x.address?if_exists}'  onchange="javascript:action_hrworkshop('manager_hrworkshop_update.do','column=address&id=${x.id?if_exists}&columnValue='+this.value)" />
			</td>	

			
			<td >
			${x.inputname?if_exists}
			</td>												
			<td>
				<ul id="icons"> 
					<li>				
						<a class="ui-icon ui-icon-trash" href=# onclick="javascript:action_hrworkshop('manager_hrworkshop_delete.do','id=${x.id}')" title="删除">删除</a>
					</li>
				</ul>				
			</td>
		</tr>
		</#if>
	</#list> 
	</tbody>
</table>     
<span id="div_action_result" style="display:none">${rhs["info"]?if_exists}</span>   
<div>
</body>
    