function additem(type,templateid) {
	var tagid = "";
	$("#div_select_item").html("Loading...");
	$("input:checkbox[name=knowledgevalue]:checked").each(function(i) {
		if (0 == i) {
			tagid = $(this).val();
		} else {
			tagid += ("," + $(this).val());
		}
	});
	if (tagid == "") {
		alert("Please select one knowledge!");
		return false;
	}
	$("#operation_title").text("Add Question");
	$('#div_scoll').attr("style","margin-left:150px;margin-top:-350px; cursor:hander;position:absolute;width:400px;z-index:10000;display:block;");
	$.ajax({
		type : "POST",
		url : "exam_item_listbycondition.do",
		data : "knowledgesid=" + tagid + "&type=" + type + "&templateid=" + templateid,
		cache : false,
		success : function(html) {
			document.getElementById('div_select_item').innerHTML = html;
		}
	});
}

function getmaxitemcount(knowledgeid){
	var tagid = "";
	$("input:checkbox[name=knowledgevalue]:checked").each(function(i) {
		if (0 == i) {
			tagid = $(this).val();
		} else {
			tagid += ("," + $(this).val());
		}
	});
	//alert(tagid);
	$.ajax({
		type : "POST",
		url : "exam_paper_getmaxitem.do",
		data : "knowledgesid=" + tagid,
		cache : false,
		success : function(html) {
			var para = html.split(",");
			document.getElementById('maxsinglechoicecount').innerHTML = para[0];
			document.getElementById('maxmultichoicecount').innerHTML = para[1];
		}
	});
}

function action_item_admin(templateid, itemid, itemtype){
	var divid="";
	switch(itemtype){
	case 1:
		divid="reqsinglechoice";
		break;
	case 2:
		divid="reqmultichoice";
		break;
	case 3:
		divid="reqblank";
		break;
	case 4:
		divid="reqessay";
		break;
	}
	$.ajax({
		type : "POST",
		url : "exam_template_addreqitem.do",
		data : "templateid=" + templateid + "&type=" + itemtype + "&itemid=" + itemid,
		cache : false,
		success : function(html) {
			document.getElementById(divid).innerHTML =  html;
		}
	});
}

function ajax_show_item(url, data){
	$("#operation_title").text("View Question");
	$('#div_scoll').attr("style","margin-left:150px;margin-top:-350px; cursor:hander;position:absolute;width:700px;z-index:10000;display:block;");
	$("#div_select_item").html("Loading...");
	$.ajax({
		type : "POST",
		url : "exam_item_load.do",
		data : data,
		cache : false,
		success : function(html) {
			document.getElementById("div_select_item").innerHTML =  html;
		}
	});
}

function checkvalue(obj,type){
	if(type == 1){
		var maxvalue = $("#maxsinglechoicecount").text();
	}else{
		var maxvalue = $("#maxmultichoicecount").text();		
	}
	obj.value=obj.value.replace(/[^\.\d]/g,'');
	if(obj.value.split('.').length>2){
		obj.value=obj.value.split('.')[0]+'.'+obj.value.split('.')[1]
	}
	if(parseInt(obj.value) > parseInt(maxvalue)){
		obj.value = maxvalue;
	}
}
