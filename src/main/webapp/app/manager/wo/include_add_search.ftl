<p class="pull-right" >
      <div class="panel panel-info pull-right" style="width:auto">
        <div class="panel-heading"><strong>query panel:</strong></div>
        <div class="panel-body">
 			 <form action="manager_wo_list.do" id="search_form" method="post" > <#-- 该ID需当参数传入分页的宏	-->
				<input type="hidden" name="search" value="search">  					<#-- 这里必须加上，不然不会进行条件查询，且name和value不能修改其他值-->
				<input type="hidden" name="pageId" id="pageId">      					<#-- 这里必须加上，不然分页模块会不正常，且id和name不能修改为其他值	-->
				<input type="hidden" name="maxSize" id="pageMaxSize">      		        <#-- 这里必须加上，不然修改显示条数会不正常，且id和name不能修改为其他值	-->
				<input type="hidden" name="orderBy" id="orderBy" value=${rhs["orderBy"]?if_exists}>
				Request Id : <input type="text" class="input-small" name="requestid:like" value='${rhs["requestid"]?if_exists}'  />
				Title : <input type="text" class="input-small" name="title:like" value='${rhs["title"]?if_exists}'  />
				Time Begin: <input type="text" class="input-small" name="begintime" onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd'});" value='' />
				 End :  <input type="text" class="input-small" id="autoEndtime" name="endtime" onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd'});" value='' />
				<input type="button" class="btn btn-default btn-xs" value="Search" onclick="javascript: submit_form('','search')" />
				 <a class="btn btn-default btn-xs" onclick="javascript:submit_form('','export');" >Export</a>
				<#--Order By: 
				<a href="#" onclick="javascript: submit_form('priority')">优先级</a>
				<a href="#" onclick="javascript: submit_form('endTime')">计划结束时间</a>-->
			</form>         
        </div>
      </div>


</p>
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



function submit_form(orderByVal,operation) {

	if("search" == operation){
		form = document.getElementById("search_form");
		form.orderBy.value = orderByVal;
		form.submit();
	}
	if("export" == operation){
		form = document.getElementById("search_form");
		form.action="manager_wo_export.do";
		form.submit();
	}
}
</script>
       