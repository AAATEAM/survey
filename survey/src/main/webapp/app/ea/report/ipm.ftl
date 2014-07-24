<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="<@context/>app/ea/user/user.js"></script>

 <#assign show=Session["show"]> 
 ${show}
<#macro digui_organize organizeNodes  flag >
	<#list organizeNodes as organize>
	       ${organize.name}<br>
	       		<#if  organize.allUser()?size gt 0>
				   <table   class="table  table-condensed">
				     <thead>
						<tr>
							<th >姓名</th><th>等级</th><th>kso个数</th><th>sog个数</th><th>workshop总数</th><th>workshop名称</th>
						</tr>
					 </thead>	
		           <#list organize.allUser() as x>
		             <#if !(x.account=="xiaojinghan"||x.account=="zhujie")>
		  	      	 <tr>
			  	      	 <td>${x.name}</td>
			  	      	 <td>${x.assessLev?if_exists}</td>
			  	        <#if show=='report'>		
			  	      	  <td>${x.sognumber?default(0)}</td>
			  	      	 <td>${x.ksonumber?default(0)}</td>
			  	      	
			  	      	<#else>
			  	      	  <td><input  style="width:30px"   type="text"  value='${x.sognumber?if_exists}' onchange="javascript:action_user('update.do','column=sognumber&id=${x.id?if_exists}&columnValue='+escape(encodeURIComponent(this.value)))" /></td>					
			              <td><input  style="width:30px"   type="text"  value='${x.ksonumber?if_exists}' onchange="javascript:action_user('update.do','column=ksonumber&id=${x.id?if_exists}&columnValue='+escape(encodeURIComponent(this.value)))" /></td>					
						 </#if>
			  	     	  <#assign total=0>
			  	      	      <#assign workshop_namelist="">
			  	      	  <#list rhs["workshopList"]?sort_by("id") as workshop>
				  	      	  <#if workshop.teacherName?exists&&workshop.teacherName==x.account>
				  	      	   <#assign total=total+1>
				  	      	   <#assign workshop_namelist=workshop_namelist+"《"+workshop.name+"》">
				  	      	  </#if>
			  	      	 </#list>	
			  	      	 	 <td>	
				  	      	  ${total?if_exists}
				  	      	 </td>
				  	      	  <td>	
				  	      	 ${workshop_namelist?if_exists}
				  	      	 </td>
		  	      	 </tr>
		  	      	 </#if>
		  	      	 
	 	  	       </#list>	     
		           </table>
	           </#if>
		  <#if !(organize.getChildOrganizes()?size<1)> 
		      <@digui_organize organize.getChildOrganizes()?sort_by('sortNob'), organize.id/>	
		  </#if>
	</#list> 
</#macro>

<div style="padding:10px">
<a href="report_earpt_ipm.do?show=report" target="mainFrame">报表</a>
<a href="report_earpt_ipm.do?show=" target="mainFrame">编辑</a>
<br>
<#assign organizeRootList=rhs["organizeRootList"]/>

	<@digui_organize organizeRootList?sort_by('sortNob'),"0" />	
</div>