<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<form name="form_item" action="exam_item_import_itembyxls_save.do" method="post" enctype="multipart/form-data" >
<input type="hidden" name="method" value="${rhs["method"]}" />
	<div class="panel panel-primary"">
		<div class="panel-heading"><strong><@i18n "menu_item_import" /></strong></div>
		<div class="panel-body">
		 
             <table >
                 <tr><td >
					<b>Please select  Excel file that many questions </b><input type="File" style="width:300px" name="file" /> 
					<br>
					<p align=left>&nbsp;<input type="button" class="btn btn-xs btn-primary" value="Submit" id="submitButton"/>	</p>				
                 </td></tr>
				 <tr><td>
				 <hr style="margin: 10px 0;">
				 <#if rhs["exception"]?exists>
					 <div>
						 <#list rhs["exception"]?keys as exception>
						 	${exception} <br/>
						 	<#list rhs["exception"][exception] as status>
						 		${status}<br/>
						 	</#list>
						 	<br/>
						 </#list>
					 </div>
					 <hr style="margin: 10px 0;">
				 </#if>
					<b></b>Sapmle datas of excle file as below:<br><br>
					<a href="exam_item_getItemTemplate.do"><img width=80% src="<@context/>common/images/uploadtemplate.jpg" alt="Upload file template" "/></a></td>
                 </td></tr>
              </table>
             
                <#---
				<tr>
					<td colspan="2">
						1. 上传的excel需根据下面的模板一致。表格头的第一列为"知识领域"、第二列为"题型"、第三列为"题目内容"、第四列为"题目分值"、第五列为"正确答案"、后面的列分别是选项。
						<br/>2. 目前支持的题型为: "1"为单项选择题、"2"为多项选择题、"3"为填空题、"4"为问答题。
						<br/>3. 对于单项选择题，其Answer一列，值应该为1到选项最大个数。不应该超过最大选项个数。
						对于多项选择题，多个选项答案，用英文逗号分隔。
						<br/>4. 对于填空和问答题，不应该有选项列。
					</td>
				</tr>
				-->
		</div>
	</div>
</form>
<script>
	$('#submitButton').click(function () {
		var btn = $(this);
		btn.button('loading');
		$('#dialog').dialog('open');
		document.getElementsByName("form_item")[0].submit();
	});
	
	function gettemplate(){
	  $.ajax({
	         type:"POST",
	         url: "exam_item_getItemTemplate.do",
	         data: "",
	         cache: false,
	         success: function(html){
	        	 //document.getElementById('div_item_table').innerHTML=html;
	          }
	  });  
	}
</script>