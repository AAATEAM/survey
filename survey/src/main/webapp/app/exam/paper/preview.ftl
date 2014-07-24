<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<#include "../../../common/freemarker/include_exam.ftl">
<style type="text/css">
p {
	display: inline;
}
</style>
<div class="panel panel-primary" style="margin-top: 18px;">
	<div class="panel-heading"><strong><@i18n "menu_paper_view" /></strong></div>
	
    <div class="exam-frame">
    	<div class="panel-body">
    		<div style="height: 70px;">
    		<div style="float:right;">
				<span style="padding-right: 30px;"><@i18n "title_name" />: <#if rhs["paper"]?exists > ${rhs["paper"].name}</#if><br/>
				   <@i18n "title_examtime" />: <#if rhs["paper"]?exists > ${rhs["paper"].time}</#if><br/>
				   <@i18n "title_totalmark" />: <#if rhs["paper"]?exists > ${rhs["paper"].totalmark}</#if><br/>
				   <@i18n "title_passmark" />: <#if rhs["paper"]?exists > ${rhs["paper"].passmark}</#if>
				</span>
			</div>
    		
    		</div>
    		
    		<#assign i = 0 >
	
			<div style="margin:5px 0 5px 0;">
				<img style="vertical-align: text-bottom;" src="common/images/e_note_orange.png" />
				<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Notice</span>
			</div>
			
			<div class="alert alert-warning">
				<p>1. Do NOT press WIN button and ALT button, or the exam will commit automatic! </p><br/>
				<p>2. Do NOT CLOSE window before done the exam!</p><br/>
				<p>3. Every keyboard during exam will be record!</p>
			</div>
	
			<div style="margin-bottom:5px;">
				<img style="vertical-align: text-bottom;" src="common/images/e_answer_green.png" />
				<span style="padding-left:5px; font-size:18px; color:#c6c6c6;"><@i18n "title_single" /></span>
			</div>
	
			<div class="alert alert-success">
				<table width="100%">
				<#list rhs["singleitems"] as singleitem>
					<tr>
						<td><strong>${singleitem_index+1}.&nbsp;${singleitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if singleitem.mark?exists&&singleitem.mark!="0">${singleitem.mark}<#else>${rhs["paper"].singlechoicemark}</#if></div></td>
					<tr>
					<#list singleitem.choiceitem as choiceitem>
						<tr>
		
							<td><input type="radio" value="${choiceitem.refid}" name="result[${i}].answer"/> ${choiceitem.value}</td>
						</tr>
					</#list>
					<input type="hidden" value="${singleitem.id}" name="result[${i}].item.id" />
					<input type="hidden" value="<#if singleitem.mark?exists >${singleitem.mark}<#else>${rhs["paper"].singlechoicemark}</#if>" name="result[${i}].mark" />
					<#assign i = i + 1 >
					<tr>
						<td><hr></td>
					</tr> 
				 </#list> 	
		      	 </table>
		     </div>

		     <#if (rhs["multiitems"]?size > 0) >
			     <div style="margin-bottom:5px;">
					<img style="vertical-align: text-bottom;" src="common/images/e_answer_green.png" />
					<span style="padding-left:5px; font-size:18px; color:#c6c6c6;"><@i18n "title_multi" /></span>
				 </div>
				
			     <div class="alert alert-success">
					<table width="100%">
				    <#list rhs["multiitems"] as multiitem>
				    	<tr>
		
							<td><strong>${multiitem_index+1}.&nbsp;${multiitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if multiitem.mark?exists&&multiitem.mark!="0">${multiitem.mark}<#else>${rhs["paper"].multichoicemark}</#if></div></td>
						<tr>
						<#list multiitem.choiceitem as choiceitem>
							<tr>
								<td><input type="checkbox" value="${choiceitem.refid}" name="result[${i}].answer"/> ${choiceitem.value}</td>
							</tr>
						</#list>
						<input type="hidden" value="${multiitem.id}" name="result[${i}].item.id" />
						<input type="hidden" value="<#if multiitem.mark?exists>${multiitem.mark}<#else>${rhs["paper"].multichoicemark}</#if>" name="result[${i}].mark" />
						<#assign i = i + 1 > 
		
				      	</#list>
			      	</table>
			     </div>
		     </#if>
      	
		     <#if (rhs["blankitems"]?size > 0 )>
			     <div style="margin-bottom:5px;">
					<img style="vertical-align: text-bottom;" src="common/images/e_answer_green.png" />
					<span style="padding-left:5px; font-size:18px; color:#c6c6c6;"><@i18n "title_blank" /></span>
				 </div>
				
			     <div class="alert alert-success">
					<table width="100%">
				    <#list rhs["blankitems"]?sort_by("id") as blankitem>
				    	<tr>
							<td><strong>${blankitem_index+1}.&nbsp;${blankitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if blankitem.mark?exists&&blankitem.mark!="0">${blankitem.mark}<#else>${rhs["paper"].blankmark}</#if></div></td>
						<tr>
						<tr>
							<td><input type="text"  name="result[${i}].answer"/></td>
							<input type="hidden" value="${blankitem.id}" name="result[${i}].item.id" />
							<input type="hidden" value="<#if blankitem.mark?exists >${blankitem.mark}<#else>${rhs["paper"].blankmark}</#if>" name="result[${i}].mark" />
						</tr>
						<#assign i = i + 1 > 
		
				    </#list>
			      	</table>
			     </div>
		     </#if>
      
		     <#if (rhs["essayitems"]?size > 0) >
		         <div style="margin-bottom:5px;">
					<img style="vertical-align: text-bottom;" src="common/images/e_answer_green.png" />
					<span style="padding-left:5px; font-size:18px; color:#c6c6c6;"><@i18n "title_essay" /></span>
				 </div>
				
			     <div class="alert alert-success">
			     	<table width="100%">  
			      	<#list rhs["essayitems"]?sort_by("id") as essayitem>
			      		<tr>
							<td><strong>${essayitem_index+1}.&nbsp;${essayitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if essayitem.mark?exists&&essayitem.mark!="0">${essayitem.mark}<#else>${rhs["paper"].essaymark}</#if></div></td>
						<tr>
						<tr>
							<td><textarea name="result[${i}].answer"> </textarea></td>
							<input type="hidden" value="${essayitem.id}" name="result[${i}].item.id" />
							<input type="hidden" value="<#if essayitem.mark?exists>${essayitem.mark}<#else>${rhs["paper"].essaymark}</#if>" name="result[${i}].mark" />
						</tr>
						<#assign i = i + 1 > 
			      	</#list>
			    	</table>
			     </div>
			 </#if>
      </div>
	</div>
</div>
