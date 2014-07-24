<#include "../../../common/freemarker/include_header.ftl">
<body style="padding:10px">
<#macro digui_orgnaize treeNodes  flag type>
	<#list treeNodes as node>
		<div class="panel panel-primary">
		<#list node.getRoles() as role>
			<div class="panel-heading">
				<strong><b><span id=${role.id} >${role.name}(${role.getUsers()?size}人)</span></b></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="panel-body">
					 <table   class="table  table-condensed table-hover" >
					    <thead>
					    <tr>
				        	<th width=80px>姓名</th>
				        	<th width=40px>年龄</th>
				        	<th width=60px>工作年限</th>
				        	<th width=90px>公司</th>
				        	<th width=80px>team</th>
				        	<#if show=='all'>
								<th>评语</th>
								<th>项目经验</th>
							</#if>
				        	<th>星座</th>
					    </tr>
					    </thead>
					    <#list role.getUsers()?sort_by("teamname") as u>
					    <tr>
				        	<td> 
				        	<a title="显示所属组织组织节点"  href="ea_view_picture_user_in_organize.do?userId=${u.id}" target=_blank>
				        	${u.name}
				        	</a>
				        	</td>
					    	<td>${javacall["com.utils.time.TimeUtil"].getStrHowManyYearToNow(u.birthDate)}岁</td>
					    	<td style="width:90px;">${javacall["com.utils.time.TimeUtil"].getStrHowManyYearToNow(u.graduateDate)}年</td>
					    	<td> ${u.companyname}</td>
					    	<td> ${u.teamname}</td>
					    	<#if show=='all'>
				     			<td style="width:190px;table-layout:fixed;word-break:break-all;">${u.mark?if_exists?trim}</td><!--${(u.mark?if_exists)?trim}-->
				    			<td style="table-layout:fixed;word-break:break-all;">${u.experience?if_exists?trim}</td><!--${(u.experience?if_exists)?trim}-->
				    		</#if>
					    	
					    	<td title="<#if javacall["com.utils.time.TimeUtil"].getConstellationNumber(u.birthDate)!=""><#if rhs["system_para_map"]["constellation"]?exists>${rhs["system_para_map"]["constellation"][javacall["com.utils.time.TimeUtil"].getConstellationNumber(u.birthDate)]}</#if></#if>">
					    	${javacall["com.utils.time.TimeUtil"].getConstellation(u.birthDate)}
					    	</td>
					    	<#--
					    	<td>
					    	<#if  rhs["system_para_map"]["constellation"]?exists>
					    		<#if javacall["com.utils.time.TimeUtil"].getConstellationNumber(u.birthDate)!="">${rhs["system_para_map"]["constellation"][javacall["com.utils.time.TimeUtil"].getConstellationNumber(u.birthDate)]}</#if>
					    	</#if>
					    	</td>
					    	-->
					    </tr>
					    </#list>
				      </table>
			</div>
		  </#list>
	</div>
		  <#if !(node.getChildOrganizes()?size<1)> 
		      <@digui_orgnaize node.getChildOrganizes()?sort_by('sortNob') ,flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" ,type/>	
		  </#if>
	</#list>
</#macro>



		    <@digui_orgnaize rhs["organizeRootList"],"","map_person_deploy"/>
</body>

