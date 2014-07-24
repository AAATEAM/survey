<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="<@context/>app/ea/report/report.js"></script>
<link href="<@context/>common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<@context/>common/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">

<body style = "" >

<div class="panel panel-primary">
	<div class="panel-heading"><strong><b><a style="color:#FFFFFF" onclick="javascript:sortresult('team');return false;">按照Team分类</a></b></strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong><b><a style="color:#FFFFFF" onclick="javascript:sortresult('tech');return false;">按技术分类</a></b></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="hidden" id="level" value=""/>
		<a style="color:#FFFFFF" onclick="javascript:sortresult($('#level').val(),'none')">只显示level</a>&nbsp;&nbsp;&nbsp;
		<a style="color:#FFFFFF" onclick="javascript:sortresult($('#level').val(),'all')">显示评语和项目经验</a>
	</div>
	
	<div class="panel-body" id="domain-result">
		<#include "ajax_assessment.ftl">
	</div>
</body>
</div>