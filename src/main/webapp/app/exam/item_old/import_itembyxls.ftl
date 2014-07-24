<#include "../../../common/freemarker/include_header.ftl">
<form name="form_item" action="exam_item_import_itembyxls_save.do" method="post" enctype="multipart/form-data" >
<input type="hidden" mane="method" value="import" />
	<div class="panel panel-primary" style="margin-top: 18px;">
		<div class="panel-heading"><strong><@i18n "menu_paper_new" /></strong></div>
		<div class="panel-body">
			<table class="table table-condensed table-bordered table-striped">
				<tr>
					<td colspan="2" style="color:red">
						<strong>1. The paper template as below:</strong>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					Please upload excel template file.
					<input type="File"  name="file" /> 
					<hr/>
					<img src="<@context/>common/images/uploadtemplate.jpg" alt="Upload file template" />
					</td>
					
				</tr>
				<tr>
					<td>
						<input type="button" class="btn btn-xs btn-info" value="Save" id="submitButton"/>	
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
</script>