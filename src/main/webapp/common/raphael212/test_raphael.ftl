
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../common/jqueryui183/css/jqui1813/smoothness/jquery-ui-1.8.13.custom.css" media="screen" />
<link href="../../common/bootstrap303/css/bootstrap.min.css" rel="stylesheet">
<link href="../../common/bootstrap303/css/docs.css" rel="stylesheet">
<link href="../../common/bootstrap303/css/pygments-manni.css" rel="stylesheet">
<script src="../../common/jquery-1-10-2/jquery.min.js"></script> <#--jquery必须房子啊其它之前，下拉菜单-->
<script type="text/javascript" src="../../common/juqeryui-1-10-3/jquery-ui.js"></script>

<script src="../../common/bootstrap303/js/bootstrap.js"></script>

<!--[if lt IE 9]><script src="../../common/bootstrap303/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="../../common/bootstrap303/js/html5shiv.js"></script>
  <script src="../../common/bootstrap303/js/respond.min.js"></script>
<![endif]-->

<link rel="stylesheet" type="text/css" href="../../common/jquery-plugins/zTree/css/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" src="../../common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../../common/jquery-plugins/zTree/js/jquery.ztree.core-3.5.js"></script>

<link rel="stylesheet" type="text/css" href="../../common/highslide-4-1-13/highslide/highslide.css" />

<!--<script type="text/javascript" src="../../common/javascript/javascript.js"></script>-->
<style type="text/css">
* {font-family:Arial;margin:0px;padding:0px;font-size:12px;}
<#--juqery-ui图标-->
ul#icons li {cursor: pointer; float: left;  list-style: none;}
ul#icons span.ui-icon {float: left; margin: 0 2px;}
.ui-icon  { cursor: pointer; float: left;  }

<#--bootsrap-css-->
.table th{background:#efefef;}
.panel {margin: 10px;}
.panel-heading {padding: 2px;}
.input{height: 34px; padding: 1px;}


</style>


</head>
<script src="raphael2.1.2.js" type="text/javascript"></script>

<script>
	
	$(document).ready(function(){
		var paper = Raphael("raphael1");
		var x = 50, y = 100;
		
		var circle = paper.circle(x, y, 50); //画圆: x, y, 半径
		circle.attr({
		"fill":"#99CC33", //填充颜色
		"stroke":"#fff" //边框颜色
		}); 
		var text = paper.text(x ,y,"圆");
		
		var rect = paper.rect(x += 80, y, 100,40); //画矩形， x, y, w, h
		rect.attr({
			"fill": "#99CC33",
			"stroke":"#fff"
		});
		var text = paper.text(x + 40 ,y + 20,"矩形");
		
		var ellipse = paper.ellipse(x += 220, y, 100,40); //， x, y, w, h
		ellipse.attr({
			"fill": "#99CC33",
			"stroke":"#fff"
		});
		var text = paper.text(x  ,y ,"椭圆形");
	});
</script>


<div class="panel panel-primary" style="margin-top: 5px; margin-left:15px;">
<div class="panel-heading"><strong>基本图形</strong></div>
<div class="panel-body">
<div id="raphael1"></div>
</div>
</div>