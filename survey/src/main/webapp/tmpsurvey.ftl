

<#if Session["userlogined"].account=='admin'>
<script type="text/javascript" language="javascript">
    document.location="pframe.ftl";
</script>
</#if>

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



<frameset rows="85,*" frameborder="no" marginwidth="0" framespacing="0" id="frameset01">
	<frame src="top_welcome.ftl" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" style=""/>
	<#--<frame src="exam_exam_exam_home.do" name="mainFrame" scrolling="auto" noresize="noresize" id="mainFrame" style=""/>-->
	<frameset framespacing="0" frameborder="no" framespacing="0" id="frameset02">
		<frame src="survey_survey_survey_home.do" name="leftFrame" frameborder="0" scrolling="auto" noresize="noresize" name="mainFrame">
	</frameset>
</frameset>





