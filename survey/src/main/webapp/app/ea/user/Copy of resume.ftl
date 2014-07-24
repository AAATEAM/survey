<#include "../../../common/freemarker/include_header.ftl">
<body style="padding:10px">
<b>简历预览</b>
<table class="table  table-condensed " >
 	    <tr>
	         <td valign=top >
	     		
				中文姓名 :&nbsp;${rhs["user"].name?if_exists} 
				<#if  rhs["user"].imgfilename?exists&&rhs["user"].imgfilename!='' ><br><img style="width:100px; height:120px" src="<@context/>file/photo/${rhs["user"].imgfilename?if_exists}" />   </#if>
				<br>邮箱:&nbsp;${rhs["user"].email?if_exists}
				<br>手机号码:&nbsp;${rhs["user"].phoneNumber?if_exists}
				<br>QQ号:&nbsp;${rhs["user"].qq?if_exists}  
				<br>生日:&nbsp;${rhs["user"].birthDate?if_exists}
			    <br> 毕业日期:&nbsp;${rhs["user"].graduateDate?if_exists}
				<br>入职日期:&nbsp;${rhs["user"].rollDate?if_exists}
				<br>擅长的技术领域:
	    	    
				<#list rhs["organizelist"]  as organize>
					<#list organize.getRoles() as role>	
					<#list rhs["user"].getRoles()  as x>
			    	   	<#if x.name==role.name>
			    	    ${role.name?if_exists}&nbsp;&nbsp;&nbsp;
			    	    </#if>
		    	    </#list>					    		
					 
					</#list> 	        		    
				</#list> 
				
				<p>项目经验：${rhs["user"].experience?if_exists}</p>                       
		    
		    </td>
	    </tr>	
</table>		
</body>

	