<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<script type="text/javascript" src="common/ckeditor441/ckeditor.js"></script>
<script type="text/javascript">
	window.onload = function()
	{
		CKEDITOR.replace( 'text',{
			toolbar : [ 
							
							['Bold','Italic','Underline'] ,
							['Font','FontSize','TextColor','BGColor' ]
					  ]
		});
	}
</script>
			<form name="form_item" action="exam_item_save.do" metiod="post">
				<div class="panel panel-primary">
				    <div class="panel-heading">
				    	<@i18n "menu_item_new" />
				    </div>
					<div class="panel-body">
				 <table class="table table-condensed table-bordered table-striped">
					<tr>
						<td style="text-align: center;"><@i18n "title_type" /> </td>
						<td>
							<input type="radio" name="item.type" value="1" onclick="javascript:generateitem(1)"/>&nbsp;<@i18n "title_single" />
							&nbsp;
							<input type="radio" name="item.type" value="2" onclick="javascript:generateitem(2)"/>&nbsp;<@i18n "title_multi" />
							<#--
							<input type="radio" name="item.type" value="3" onclick="javascript:generateitem(3)"/><@i18n "title_blank" />
							<input type="radio" name="item.type" value="4" onclick="javascript:generateitem(4)"/><@i18n "title_essay" />
						    -->
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center;"><@i18n "title_content" /></td>
						<td>
							<div>
								<textarea class='input' style='width:400px;' type='text' id='text' name='item.content' > </textarea>
							</div>
							<div id="itemcontent">
								
							</div>
						</td>
					</tr>
					
					<tr>
						<td style="text-align: center;"><@i18n "title_knowledge" /></td>
						<td>
							<#list rhs["knowledgeRootList"] as knowledge>
								<#if knowledge.getChildKnowledges()?exists >
									<#list knowledge.getChildKnowledges() as knowledgenode>
										<input type="checkbox" name="knowledgevalue" value="${knowledgenode.id}" />&nbsp;&nbsp;${knowledgenode.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</#list>
								</#if>
							</#list>
						</td>
					</tr>
					<#--<tr>
						<td><@i18n "title_mark" /></td>
						<td>
						</td>
					</tr>-->
					<input class='input' type='hidden' value='0' name='item.mark' />
					<tr>
						<td colspan="2" >
						    <input type="button" class="btn btn-xs btn-primary" value="Save" id="submitButton"/>
						    <a  class="btn btn-xs btn-primary" href="exam_item_list.do">Return</a>
						</td>
					</tr>
				</table>
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
	
	
	function generateitem(type){
		switch(type){
			case 1:
				$("#itemcontent").html("<button style='margin-top:6px;' class='btn btn-xs btn-primary' onclick='javascript:addoption(1);return false;'><@i18n "title_option_new" /></button><div id='choice' ><input type='radio' name='item.refkey' value='1'/><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/><input type='radio' value='2' name='item.refkey' /><input type='text' style='margin-left:3px;width:700px;' name='choiceitemvalue' /><br/><input type='radio' value='3' name='item.refkey' /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/><input type='radio'  value='4' name='item.refkey' /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/></div>");
				break;
			case 2:
				$("#itemcontent").html("<button style='margin-top:6px;' class='btn btn-xs btn-primary' onclick='javascript:addoption(2);return false;'><@i18n "title_option_new" /></button><div id='choice' ><input type='checkbox' name='item.refkey' value='1'/><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/><input type='checkbox' value='2' name='item.refkey' /><input type='text' style='margin-left:3px;width:700px;' name='choiceitemvalue' /><br/><input type='checkbox' value='3' name='item.refkey' /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/><input type='checkbox' value='4' name='item.refkey' /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/></div>");
				break;
			case 3:
				$("#itemcontent").html("<div class='btn btn-xs btn-primary'><@i18n "title_refkey" /><input class='input' style='width:340px;' type='text' value='' name='item.refkey' /></div>");
				break;
			case 4:
				$("#itemcontent").html("<div class='btn btn-xs btn-primary'><@i18n "title_refkey" /><input class='input' style='width:340px;' type='text' value='' name='item.refkey' /></div>");
				break;	
		}
	}
	
	var option_input_num = 4;
	function addoption(type){
		option_input_num += 1;
		var content = $("#choice").html();
		switch(type){
			case 1:
				$("#choice").html(content + "<input type='radio' name='item.refkey' value='"+ option_input_num +"'/><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/>");
				break;
				
			case 2:
				$("#choice").html(content + "<input type='checkbox' name='item.refkey' value='"+ option_input_num +"'/><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/>");
				break;
		
		}
		
		
	
	}
	
	$(function(){
		$('#dialog').dialog({
			autoOpen: false,
			modal: true,
			width: 400
		});
	});
</script>
