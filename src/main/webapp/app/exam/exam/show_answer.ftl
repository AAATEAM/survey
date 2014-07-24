<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<form name="form_item" action="exam_exam_complete_task.do" method="post">
<div class="panel panel-primary" style="margin-top: 5px; margin-left:15px;">
      <div class="panel-heading"><strong>Result Detail</strong></div>
      <div class="panel-body">
      <table class="table table-condensed table-bordered table-striped">
      		<tr>
      			<td><strong><@i18n "title_name" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].name}</#if></td>
      			<td><strong><@i18n "title_examtime" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].time}</#if></td>
      			<td><strong><@i18n "title_totalmark" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].totalmark}</#if></td>
      			<td><strong><@i18n "title_passmark" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].passmark}</#if></td>
      		</tr>
      	</table>
      	<#assign i = 0 >
      	<#if (rhs["singleitems"]?size > 0) >
  		<table class="table table-condensed table-bordered table-striped">
		  	<strong><@i18n "title_single" /></strong>(total:${rhs["paper"].singlechoice + rhs["paper"].rmdsinglechoice}, each: ${rhs["paper"].singlechoicemark})
		  	<#list rhs["singleitems"]?keys as itemid>
		  		<#assign singleitem = rhs["singleitems"][itemid][0] />
				<tr>
					<td><strong>${i+1}.&nbsp;${singleitem.item.content}</strong> </td>
				<tr>
				<#assign total = rhs["singleitems"][itemid]?size >
				<#list singleitem.item.choiceitem?sort_by("id") as choiceitem>
					<#assign select = 0 >
					<tr>
						<td <#if singleitem.item.refkey?number==choiceitem.refid> style='color:red;'</#if> ><input disabled  type="radio" value="${choiceitem.refid}" name="" /> ${choiceitem.value}
						(
						<#list rhs["singleitems"][itemid] as result>
							<#if result.answer?exists>
								<#if result.answer?string == choiceitem.refid?string>
									${result.user} &nbsp;&nbsp;
									<#assign select = select + 1>
								</#if>
							</#if>
						</#list>
						<#assign result = select / total >
						, ${result?string("percent")})
						</td>
					</tr>
				</#list>
				<#assign i = i + 1 > 
		  	</#list>
      	</table>
      	</#if>
      	<#if (rhs["multiitems"]?size > 0) >
      	<table class="table table-condensed table-bordered table-striped">
	      	<strong><@i18n "title_multi" /></strong>(total:${rhs["paper"].multichoice + rhs["paper"].rmdmultichoice}, each: ${rhs["paper"].multichoicemark})
	      	<#list rhs["multiitems"]?keys as itemid>
	      		<#assign multiitem = rhs["multiitems"][itemid][0]>
	      		<tr>
					<td><strong>${multiitem_index+1}.&nbsp;${multiitem.item.content}</strong></td>
				<tr>
				<#assign total = rhs["multiitems"][itemid]?size >
				<#list multiitem.item.choiceitem?sort_by("id") as choiceitem>
					<#assign select = 0 >
					<tr>
						<td <#list multiitem.item.refkey?split(",") as key><#if (key?trim)?number==choiceitem.refid> style='color:red;'</#if> </#list>><input disabled  type="checkbox" value="${choiceitem.refid}" name="" /> ${choiceitem.value}
						(
						<#list rhs["multiitems"][itemid] as result>
							<#if result.answer?exists>
								<#list result.answer?split(",") as key>
									<#if (key?trim)?number==choiceitem.refid>
										${result.user} &nbsp;&nbsp;
										<#assign select = select + 1>
									</#if> 
								</#list>
							</#if>
						</#list>
						<#assign result = select / total >
						, ${result?string("percent")})
						</td>
					</tr>
				</#list>
				<#assign i = i + 1 > 
	      	</#list>
      	</table>
      	</#if>
      	<#--<table class="table table-condensed table-bordered table-striped">
	      	<strong><@i18n "title_blank" /></strong>(total:${rhs["paper"].blank + rhs["paper"].rmdblank}, each: ${rhs["paper"].blankmark})
	      	<#list rhs["blankitems"]?sort_by("id") as blankitem>
	      		<tr>
					<td><strong>${blankitem_index+1}.&nbsp;${blankitem.item.content}</strong> <div class="pull-right"><@i18n "title_score" />：<input disabled type="text" name="blankmark" value="${blankitem.mark}" /></div></td>
				<tr>
				<tr>
					<td><input disabled type="text" value="${blankitem.answer}" name=""/> <@i18n "title_refkey" />: <font color=red>${blankitem.item.refkey}</font></td>
				</tr>
				<#assign i = i + 1 > 
	      	</#list>
      	</table>
      	<table class="table table-condensed table-bordered table-striped">
	      	<strong><@i18n "title_essay" /></strong>(total:${rhs["paper"].essay + rhs["paper"].rmdessay}, each: ${rhs["paper"].essaymark})
	      	<#list rhs["essayitems"]?sort_by("id") as essayitem>
	      		<tr>
					<td><strong>${essayitem_index+1}.&nbsp;${essayitem.item.content}</strong> <div class="pull-right"><@i18n "title_score" />：<input disabled type="text" name="essaymark" value="${essayitem.mark}" /></div></td>
				<tr>
				<tr>
					<td><textarea disabled name="">${essayitem.answer}</textarea> <@i18n "title_refkey" />：<font color=red>${essayitem.item.refkey}</font></td>
				</tr>
				<#assign i = i + 1 > 
	      	</#list>
	    </table>-->
	    <table class="table table-condensed table-bordered table-striped">
	    	<tr>
      			<td>
      				<a  class="btn btn-xs btn-primary" href="exam_exam_exam_record_list.do?groupby=paper">Return</a>
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