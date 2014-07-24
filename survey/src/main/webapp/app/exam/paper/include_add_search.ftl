<style type="text/css">
.panel {
	margin-top: 0;
	margin-bottom: 0;
}
.panel-info {
	border-color: #c19cbb;
}
.panel-info>.panel-heading {
	color: #8f3f7b;
	background-color: #dfcddd;
	border-color: #c19cbb;
}
</style>
<span class="pull-right" style="z-index: 2000;" >
      <div class="panel panel-info pull-right" style="width:auto;">
        <div class="panel-heading" onclick="javascript:show_dir();" style="cursor: pointer;"><strong><@i18n "title_search" /></strong></div>
        <div class="panel-body" style="display:${rhs["formstyle"]};" id="content">
 			 <form action="exam_paper_list.do" id="search_form" method="post" > <#-- 该ID需当参数传入分页的宏	-->
				<input type="hidden" name="search" value="search">  					<#-- 这里必须加上，不然不会进行条件查询，且name和value不能修改其他值-->
				<input type="hidden" name="pageId" id="pageId">      					<#-- 这里必须加上，不然分页模块会不正常，且id和name不能修改为其他值	-->
				<input type="hidden" name="maxSize" id="pageMaxSize">      		        <#-- 这里必须加上，不然修改显示条数会不正常，且id和name不能修改为其他值	-->
				<input type="hidden" name="formstyle" id="form_style" value="${rhs["formstyle"]}">
				<input type="hidden" name="orderBy" id="orderBy" value=${rhs["orderBy"]?if_exists}>
				<#list rhs["knowledgeRootList"] as knowledge>
					<input type="checkbox" <#list rhs["knowledgevalue"] as val> <#if val?number == knowledge.id >checked</#if> </#list> onclick="document.getElementById('search_form').submit();" name="knowledgevalue" value="${knowledge.id}"/>&nbsp;&nbsp;<font color='red'>${knowledge.name}</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<#if knowledge.getChildKnowledges()?exists >
						<#list knowledge.getChildKnowledges() as knowledgenode>
							<input type="checkbox" <#list rhs["knowledgevalue"] as val> <#if val?number == knowledgenode.id >checked</#if> </#list> onclick="document.getElementById('search_form').submit();" name="knowledgevalue" value="${knowledgenode.id}" />&nbsp;&nbsp;${knowledgenode.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</#list>
					</#if>
				</#list>
				<input type="button" class="btn btn-default btn-xs" value="Search" onclick="javascript: submit_form('','search')" />
				<#--Order By: 
				<a href="#" onclick="javascript: submit_form('priority')">优先级</a>
				<a href="#" onclick="javascript: submit_form('endTime')">计划结束时间</a>-->
			</form>         
        </div>
      </div>
</span>
<script type="text/javascript">

Date.prototype.format =function(format)
{
	var o = {
	"M+" : this.getMonth()+1, //month
	"d+" : this.getDate(), //day
	"h+" : this.getHours(), //hour
	"m+" : this.getMinutes(), //minute
	"s+" : this.getSeconds(), //second
	"q+" : Math.floor((this.getMonth()+3)/3), //quarter
	"S" : this.getMilliseconds() //millisecond
	}
	if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
	(this.getFullYear()+"").substr(4- RegExp.$1.length));
	for(var k in o)if(new RegExp("("+ k +")").test(format))
	format = format.replace(RegExp.$1,
	RegExp.$1.length==1? o[k] :
	("00"+ o[k]).substr((""+ o[k]).length));
	return format;
}

	$(document).ready(function(){
		var myDate = new Date().format('yyyy-MM-dd');
		$("#autoEndtime").val(myDate);
	});

function  show_dir(){  //定位层
	  if( document.getElementById('content').style.display=='none'){
	  	document.getElementById('content').style.display='block';
	  	document.getElementById('form_style').value = 'block';
	  }else{
	    document.getElementById('content').style.display='none';
	    document.getElementById('form_style').value = 'none';
	  }
}

function submit_form(orderByVal,operation) {

	if("search" == operation){
		form = document.getElementById("search_form");
		form.orderBy.value = orderByVal;
		form.submit();
	}
}
</script>
       