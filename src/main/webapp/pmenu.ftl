<#include "common/freemarker/include_header.ftl">
<#include "common/freemarker/include_custom.ftl">
<style>
body {
	background-color: #fff;
}
</style>

<script type="text/javascript">
function changeArrow(currentId){
	document.getElementById(currentId).src ="common/images/arrow_blue.png"
}

function backArrow(currentId){
	document.getElementById(currentId).src ="common/images/arrow_grey.png"
}
  
</script>

<body>
  <div class="bs-sidebar hidden-print">
    <ul class="nav bs-sidenav">
	
		  
		  <li ><a href="ea_user_menu_user.do" target="mainFrame" onMouseOver="changeArrow(1)" onMouseOut="backArrow(1)"><img src="common/images/arrow_grey.png" id="1"/>&nbsp;&nbsp;用户管理</a></li>
		  <li ><a href="exam_item_list.do" target="mainFrame" onMouseOver="changeArrow(2)" onMouseOut="backArrow(2)"><img src="common/images/arrow_grey.png" id="2" />&nbsp;&nbsp;调查试题库</a></li>
		  <li ><a href="survey_surveyPaper_list.do" target="mainFrame" onMouseOver="changeArrow(3)" onMouseOut="backArrow(3)"><img src="common/images/arrow_grey.png" id="3" />&nbsp;&nbsp;问卷管理 survey</a></li>
		  <li ><a href="survey_survey_survey_arrange_list.do" target="mainFrame" onMouseOver="changeArrow(4)" onMouseOut="backArrow(4)"><img src="common/images/arrow_grey.png" id="4" />&nbsp;&nbsp;问卷调查记录 survey</a></li>
		  <li ><a href="exam_exam_exam_record_list.do?groupby=paper" target="mainFrame" onMouseOver="changeArrow(5)" onMouseOut="backArrow(5)"><img src="common/images/arrow_grey.png" id="5" />&nbsp;&nbsp;报表</a></li>

    </ul>
  </div>
</body> 
 
