<#include "../../../common/freemarker/include_header.ftl">
<script language="javascript">

    function createUserRolegroupRelation(userId,roleId) {
		$.ajax({
	        type:"POST",
	     	url: "oa_create_user_role_relation.do",
	     	data:"userId="+userId+"&roleId="+roleId,
	     	cache: false,
	     	success: function(html){
	     	  
	       }	
	    });  
	}	
	
</script>
<#macro listrole list_organize>
		<#list list_organize  as organize>
			<#list organize.getRoles() as role>	
		      <br><input type="checkbox"  
			    		onclick="createUserRolegroupRelation('${rhs["user"].id?if_exists}','${role.id?if_exists}');" 
			  <#list rhs["user"].getRoles()   as x>
	    	   	<#if x.name==role.name>
	    	    checked
	    	    </#if>
    	    </#list>					    		
			>${role.name?if_exists}</input>					  
			</#list> 	        		    
		</#list> 
</#macro>

<body style="padding:10px">


<form  name=userRegedit action="oa_regeditSave.do" onsubmit="javascript:return send();" method="POST" enctype="multipart/form-data">
<table class="table  table-condensed " >
    <thead>
		<tr>
			<th>ID${rhs["user"].id?if_exists}-${rhs["user"].name?if_exists}-${rhs["user"].account?if_exists}【调动】</th>
		</tr>
	</thead>
	<tbody>
    <tr>
    	<td>
    	 
		<table>
			<tr><td width=33%>
	    	    <br><b>项目角色</b><br>
	    	    <@listrole rhs["projectlist"]/>
				
			</td>
			<td width=33%>
	    	    <br><b>公司设置</b><br>
	    	     <@listrole rhs["companylist"]/>
				
			</td>
			<td width=33%>
	    	    <br><b>技术领域设置</b><br>
	    	     <@listrole rhs["techlist"]/>
				
			</td>			
			</tr>
		</table>		    
        </td>	    
    </tr>	
</table>		
			
    
<#--
<#list rhs["companylist"]  as organize>
					<#list organize.getRoles() as role>	
				      <br><input type="checkbox"  
					    		onclick="createUserRolegroupRelation('${rhs["user"].id?if_exists}','${role.id?if_exists}');" 
					  <#list rhs["user"].getRoles()   as x>
			    	   	<#if x.name==role.name>
			    	    checked
			    	    </#if>
		    	    </#list>					    		
					>${role.name?if_exists}</input>					  
					</#list> 	        		    
				</#list>  				
-->
			

</body>
	