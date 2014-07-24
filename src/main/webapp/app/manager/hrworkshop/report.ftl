<#include "../include_header.ftl">
<script type="text/javascript">
	Ext.chart.Chart.CHART_URL = '../../common/ext3/resources/charts.swf';  //不能少，否则显示不出饼图
	Ext.onReady(function(){
        d = new Date(); 
	    timeTile=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
        var dataAll = []; 
<#list 1..12 as month>	    
   <#if (month<10)> 
	<#assign monthStr ='0'+ month?string>
	<#else>
	<#assign monthStr = month?string>
	</#if>
	<#assign m_sum=0>
	<#list rhs["dataList"] as x>
	     <#if  x.beginDate?exists&&x.beginDate?matches(rhs["year"]+"-"+monthStr+".*")>
		 <#assign m_sum=m_sum+1>
		 </#if>
	</#list> 	
	dataAll.push([${month}+"M", ${m_sum}]);    
</#list> 	        		    
	    
	    new Ext.Panel({
	        width: 500,
	        height: 250,
	        renderTo: 'containerLevelAll',
	        title: ' GSC Application Design-${rhs["year"]?if_exists}-Year-Workshop  Number:',
	        items: {
	            xtype: 'columnchart',
	            store: new Ext.data.ArrayStore({
						        fields: ['level', 'PersonNumbers'],
						        data: dataAll
						    }),
	            yField: 'PersonNumbers',
		       
	            xField: 'level',
	            xAxis: new Ext.chart.CategoryAxis({
	                title: 'Month [ total:${rhs["dataList"]?size} ]'
	            }),
	            yAxis: new Ext.chart.NumericAxis({
	                title: 'number'
	            }),
	            extraStyle: {
	               xAxis: {
	                    labelRotation: 0
	                }
	            }
	        }
	    });	
	 
    });	  
	   
</script>		  

<body style="padding:30px">


<div id="containerLevelAll"></div>
<br><br><b>按姓名统计${rhs["year"]?if_exists}年</b>
<table    class="table  table-condensed" style="width:500px">
	<thead>	
			<tr>
				<th >姓名</th>
				<th>课程标题</th>
				<th>个数</th>
				
			</tr>
	</thead>		
<#assign keys = rhs["workshopHashMap"]?keys>
<#list keys as key>
<tr>
   <td>
   ${key?if_exists}:
   </td>
   <td width=350>
   <#assign sum=0>
   <#list rhs["dataList"] as x>
   		<#if x.teacherName?exists&&key?exists&&x.teacherName==key> 
   		  <#assign sum=sum+1>
   		  "${x.name?if_exists}"
   		</#if>
   		
   </#list> 
   </td>
    <td>
   ${sum}
     </td>
</#list> 
</table>


<br><br><b>按月份统计${rhs["year"]?if_exists}年</b>
<#list 1..12 as month>
   <#if (month<10)> 
	<#assign monthStr ='0'+ month?string>
	<#else>
	<#assign monthStr = month?string>
	</#if>

<br>



<table    class="table  table-condensed" style="width:500px">
	    <thead>
			<tr>
				<th >workshop-title</th>
				<th>teacher</th>
				<th>date</th>
				<th>detail</th>
			</tr>
		</thead>
		<tbody>
		<#assign m_sum=0>
		<#list rhs["dataList"] as x>
		       <#if  x.beginDate?exists&&x.beginDate?matches(rhs["year"]+"-"+monthStr+".*")>
			<tr>
				<td width=20%>
					${x.name?if_exists}
				</td>
				<td width=20%>
					${x.teacherName?if_exists}		
				</td>
				<td width=20%>
					${x.beginDate?if_exists}
				</td>
				<td>
					${x.description?if_exists}
				</td>								
			</tr>
			<#assign m_sum=m_sum+1>
			 </#if>
		</#list> 
		<TR><TD colspan=4 align=right>	${monthStr}M-sum:${m_sum}</td></tr>
		</tbody>
	</table>   

</#list> 
</body>


<#--周数
<br>第几周：${rhs["currentweek"]?if_exists} 
<br> 总共：${rhs["weeknumofcurrentyear"]?if_exists}周
<table align="center" width="100%" border="1">
   <tr>
   <#list 1..rhs["weeknumofcurrentyear"] as number>
   <td>
   <#if (number<10)>
   [0${number}]
   </#if>
   <#if (number>=10)>
   [${number}]
   </#if>
   </td>
   <#if number%5==0>
   </tr>
   <tr>
   </#if>
   </#list>
   </tr>   
</table>
-->   
    