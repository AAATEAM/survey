
<script src="common/raphael212/raphael.min.js" type="text/javascript"></script>
<script src="common/elycharts/elycharts.js" type="text/javascript"></script>

<script>

	
</script>

<style>

.choiceitem0{
background-color: #E5E5E5;
}
.choiceitem1{
background-color: #EFEFEF;
}
</style>

<div id="test"></div>



<div class="panel panel-primary" style="margin-top: 5px; margin-left:15px;">
	<div class="panel-heading"><strong>Result Detail</strong></div>
	<div class="panel-body">
		<#if (rhs["singleitems"]?size > 0) >
		<table class="table table-condensed table-bordered table-striped">
			<#assign i = 0 >
			<#list rhs["singleitems"]?keys as itemid>
			<tr>
				<#assign singleitem = rhs["singleitems"][itemid][0] />
				<td>
					<strong>${i+1}.&nbsp;${singleitem.item.content}</strong><br />
					<div id="chart_${i}"></div>
				</td>
				
			</tr>		
			<#assign i = i + 1 > 
			</#list>
		</table>
		</#if>
	</div>
</div>



<script>
var result = [];
<!--dialog数据 多个-->
<#if (rhs["singleitems"]?size > 0) >
<#assign i = 0 >
<#list rhs["singleitems"]?keys as itemid>
<#assign singleitem = rhs["singleitems"][itemid][0] />
	var labels = [], users = []; //选项， 每项回答的用户
	<#list singleitem.item.choiceitem?sort_by("id") as choiceitem>
		labels[${choiceitem_index}] = "${choiceitem.value}";
		var tmpusr = [];
		<#assign ui = 0 >
		<#list rhs["singleitems"][itemid] as result>
			<#if result.answer?exists && result.answer?string == choiceitem.refid?string>
				tmpusr[${ui}] = "${result.user}";
				<#assign ui = ui + 1 > 
			</#if>
		</#list>
		users[${choiceitem_index}] = tmpusr;
		
	</#list>
	result[${i}] = {"labels" : labels, "users" : users};	
<#assign i = i + 1 > 
</#list>
</#if>


$(document).ready(function(){
	for(var i = 0; i < result.length; i ++){
		var elobj = $("#chart_" + i);
		if(!createPie(elobj,i)){
			elobj.html("暂无人回答此问题。 ");
		}
	}
	
	
});



function createPie(elobj,index){
	
	var tusers = result[index].users;
	
	var values = [];
	var flag = false;
	var count = 0; //回答问题的人数
	for(var i = 0; i < tusers.length; i++) {
		values[i] = tusers[i].length;
		if(tusers[i].length > 0) flag = true;
		count += tusers[i].length;
	}
	if(!flag) return false;
	var legend = result[index].labels;
	var labels = []; //显示百分比
	for(var i = 0; i < values.length; i++) {
		labels[i] = (values[i] / count * 100).toFixed(2) + "%" ;
	}
	
	//计算 legend 宽
	var tmpleg = "";
	for(var i = 0; i < legend.length; i++){
		if(tusers[i].length > 0 ) legend[i] = legend[i] + "  ["+tusers[i]+"]"; 
		
	}
	
		
	$.elycharts.templates['pie_basic_1'] = {
		type : "pie",
		//style : {"background-color" : "black"},
		gridNX: 40,
		defaultSeries :{
			label:{ active : true,props : {fill : "white"}},
			plotProps:{ stroke : "white","stroke-width" : 2,opacity : 0.8},
		 	highlight : {move : 20},
		 	tooltip : {frameProps : {opacity : 0.5}},
		 	startAnimation : {active : true,type : "grow"}
		 },
		 features : {
		 	legend :{ 
		 		itemWidth: "auto",
		 		horizontal : false,height : 80, x : 10,y : 10, dotType : "circle",
		 		dotProps : {stroke : "white","stroke-width" : 0},
		 		
		 	}
		 }
	};
	var width = $(window).width();
	var tips = [];
	for(var i = 0; i < tusers.length; i++){
		if(tusers[i].length > 0 ) tips[i] = tusers[i].join(",");
	}
	elobj.chart({
		template : "pie_basic_1",
		//margins : [150, 0, 0, 700],
		margins : [70, 0, 0, 0],
		//width: 500,
		height: 300,
		
		values : {serie1 : values},
		labels : labels,
		legend : legend,
		tooltips : {serie1: tips},
		defaultSeries: {values:[{plotProps:{fill: "red"}},{plotProps:{fill: "blue"}},{plotProps:{fill: "green"}},{plotProps:{fill: "gray"}}]}
		 
	});
	return true;
}
	
</script>



