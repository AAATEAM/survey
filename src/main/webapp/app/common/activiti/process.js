function process_complete_task(formId){
    //需要判断下 是否选择了任务处理操作
    var flagVal = $("#flag").val();
      var flagStyle = $("#flag").parent().parent().attr("style");
      if(flagStyle == null){
      	flagStyle = "";
      }
    if(flagVal == "" && flagStyle.indexOf("none") <0 ){
        alert("Please select one Operation in process panel.");
        return false;
    }

    var codeFix = $("#codeFix").val();
    var codeFixStyle = $("#codeFix").parent().parent().attr("style");
    if(codeFixStyle == null){
      	codeFixStyle = "";
      }
    if(codeFix == "" && codeFixStyle.indexOf("none") < 0 ){
        alert("Please select one Operation in process panel.");
        return false;
    }

    var systemCompletion = $("#systemCompletion").val();
    var systemCompletionStyle = $("#systemCompletion").parent().parent().attr("style");
    if(systemCompletionStyle == null){
      	systemCompletionStyle = "";
      }
    if(systemCompletion == "" && systemCompletionStyle.indexOf("none") < 0 ){
        alert("Please select one Operation in process panel.");
        return false;
    }
    var assignee = $("#assignee").val();
    if(assignee == ""){
    	if(document.getElementById('assignee_div').style.display!="none"){
    		alert("Please select one Assignee in process panel.");
    		return false;
    	}
    }
	var disSelects = $("select[disabled='disabled']");//获取所有被禁用的select
    disSelects.attr("disabled", false); //处理之前, 全部打开
    var disInputs = $("input[disabled='disabled']");//获取所有被禁用的input
    disInputs.attr("disabled", false); //处理之前, 全部打开
    var disAreas = $("textarea[disabled='disabled']");//获取所有被禁用的textarea
    disAreas.attr("disabled", false); //处理之前, 全部打开
    $("#"+formId).submit(); //提交
}
// 选择后，如果不需要选人的话，隐藏选人了
function process_show_assignee(obj, showArray){
	var flag = obj.value;
	if($.inArray(flag, showArray) != -1){
		document.getElementById('assignee_div').style.display='block';
	}else{
		document.getElementById('assignee_div').style.display='none';
	}
}