<#include "macro_common.ftl">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<style type="text/css">
/* ################## */
/* ##### Public ##### */
/* ################## */
a {
	cursor: pointer;
}
a {
	color: #00A9D4;
	text-decoration: none;
}
a:hover, a:focus {
	color: #00625F;
	text-decoration: none;
}
/* ################## */
/* ##### Button ##### */
/* ################## */
.btn-xs {
	padding: 2px 7px;
	margin-left: 1px;
}
.btn-primary {
	color: #fff;
	font-weight: bold;
	background-color: #8f3f7b;
	border-color: #7B0663;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open .dropdown-toggle .btn-primary {
	color: #fff;
	background-color: #7B0663;
	border-color: #7B0663;
}
/* ################## */
/* ##### Panel ###### */
/* ################## */
.panel-primary {
	border-color: #7B0663;
}
.panel-primary>.panel-heading {
	color: #fff;
	background-color: #8f3f7b;
	border-color: #7B0663;
}
.panel-heading {
	padding: 2px 7px;
}
/* ################## */
/* ##### Table ###### */
/* ################## */
.table {
	margin-bottom: 0;
}
.table-striped>tbody>tr:nth-child(odd)>td, 
.table-striped>tbody>tr:nth-child(odd)>th {
	background-color: #f9f9f9;
}
.table-bordered>thead>tr>th, 
.table-bordered>tbody>tr>th, 
.table-bordered>tfoot>tr>th, 
.table-bordered>thead>tr>td, 
.table-bordered>tbody>tr>td, 
.table-bordered>tfoot>tr>td {
	border: 1px solid #ddd; 
	/* border: none; */
}
/* ################## */
/* ##### SideBar #####*/
/* ################## */
.bs-sidenav {
	padding-top: 0;
	margin-top: 0;
	margin-left: 12px;
	background-color: #fff;
}
.bs-sidebar .nav > li {
	width: 198px;
 	background:url(common/images/dotted_level.gif) repeat-x bottom left;
}
.bs-sidebar .nav > li > a {
	display: block;
  	color: #00285F;
  	padding: 10px 20px;
  	line-height: 26px;
}
.bs-sidebar .nav > li > a:hover,
.bs-sidebar .nav > li > a:focus,
.bs-sidebar .nav > li > a:active {
  	text-decoration: none;
  	background-color: #fff;
  	border: none;
  	background:url(common/images/dotted_level.gif) repeat-x bottom left;
  	color: #7B0663;
}
/* ################## */
/* # change password #*/
/* ################## */
.change-psw td {
	padding-bottom: 5px;
}
.change-psw .name {
	text-align: right;
	padding-right: 5px;
}
</style>

</head>	
<body>