<#include "../../../common/freemarker/include_header.ftl">

<a style="margin-left:10px;margin-top:10px;" class="btn btn-primary "  href="javascript:exportToExcel('toExcel');">Export to Excel</a>
<div class="panel panel-primary" style="margin-top: 10px;">
<div class="panel-heading"><strong>Work Order List</strong></div>
<div class="panel-body">
<table class="table table-condensed table-bordered table-striped" id="toExcel">
<thead>
	<tr>
		<td><strong>#</strong></td>
		<td><strong>Request ID</strong></td>
		<td><strong>Request Description</strong></td>
		<td><strong>Request Responsible Staff</strong></td>
		<td><strong>Request Assignment Date</strong></td>
		<td><strong>Estimation Date</strong></td>
		<td><strong>Estimation Total MD</strong></td>
		<td><strong>Report Month</strong></td>
		<td><strong>Agreed Delivery Date</strong></td>
	</tr>
</thead>
<tbody>
<#list rhs["dataList"] as x>

	<tr>
		<td class=nob >${x_index+1}</td>
		<td>${x.businessModel.requestid?if_exists}</td>
		<td>${x.businessModel.requestDesc?if_exists}</td>
		<td>${x.processAssigneedName?if_exists}</td>
		<td>${x.processAssigneedTime?if_exists}</td>
		<td>${x.businessModel.responseTime?if_exists}</td>
		<td>${x.businessModel.manday?if_exists}</td>
		<td class="automonth">${rhs["reportMonth"]?if_exists}</td>
		<td>${x.businessModel.endTime?if_exists}</td>
	</tr>

</#list>
</tbody>
</table>
</div>
</div>
<script>
function exportToExcel(tableId){
 	var curTbl = document.getElementById(tableId);  
	try {        
    var xls    = new ActiveXObject ( "Excel.Application" );  
     }  
    catch(e) {  
        alert("请您打开ActiveX控件，具体操作：单击IE中的“工具”里“Internet 选项”，单击“安全”中的“自定义级别”中“ActiveX控件和插件”中，请选择第三项为启用即可。详细错误："+e.message);
        return "";  
    }
    if (xls == null){
     	alert("创建Excel文件失败,可能是您的计算机上没有正确安装Microsoft Office Excel软件或浏览器的安全级别设置过高!");
     	return;
    }
    var xlBook = xls.Workbooks.Open('http://localhost:5050<@context/>common/templet/Request-templet.xls');  
    var xlsheet = xlBook.ActiveSheet;
	//取得表格行数
    var Lenr = curTbl.rows.length;
    for (i = 1; i < Lenr; i++)  
    {  
        //取得每行的列数  
        var Lenc = curTbl.rows(i).cells.length;  
        for (j = 1; j < Lenc; j++)  
        {  
        	if(j >= 3){
        		xlsheet.Cells(i + 4, j+1).value = curTbl.rows(i).cells(j).innerText;
        	}else{
	 			xlsheet.Cells(i + 4, j).value = curTbl.rows(i).cells(j).innerText;
        	}
	 		if(j == 3){
	 			xlsheet.Cells(i + 4, j).value = "";
	 		}
        }  
    }
    
    //设置excel为可见  
    xls.visible =true;  
  	//很重要,不能省略,不然会出问题 意思是excel交由用户控制  
  	xls.UserControl = true;    
  	xls=null;  
  	xlBook=null;  
  	xlsheet=null;
  	idTmr = window.setInterval("Cleanup();",1);  
}
function Cleanup() {
    window.clearInterval(idTmr);
    CollectGarbage();
 }
 
function automonth(){
		var myDate = new Date();
		var month = myDate.getMonth();
		var result;
		switch(month){
			case '0': 
					result = 'Jan';return;
			case '1': result = 'Feb';return;
			case '2': result = 'Mar';return;
			case '3': result = 'Apr';return;
			case '4': result = 'May';return;
			case '5': result = 'Jun';return;
			case '6': result = 'Jul';return;
			case '7': result = 'Aug';return;
			case '8': result = 'Sep';return;
			case '9': result = 'Oct';return;
			case '10': result = 'Nov';return;
			case '11': result = 'Dec';return;
		}
}
</script>