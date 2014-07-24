<head>
<style>
#topFrame {
	border: none;
}
#leftFrame {
	border-right-style: dotted;
	border-right-width: 1px;
	border-right-color: #e2e2e2;
}
</style>
</head>


<frameset rows="130,*" frameborder="no" marginwidth="0" framespacing="0" id="frameset01">
	<frame src="top.ftl" name="topFrame" scrolling="No" noresize="noresize" id="topFrame"/>
	<frameset cols="230,*" framespacing="0" frameborder="no" framespacing="0" id="frameset02">
		<frame src="adminmenu.do" name="leftFrame" frameborder="no" noresize="noresize" id="leftFrame" />
		<frame src="ea_user_menu_user.do" frameborder="0" scrolling="auto" noresize="noresize" name="mainFrame" id="mainFrame">
	</frameset>
</frameset>










