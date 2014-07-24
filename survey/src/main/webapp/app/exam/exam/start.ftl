<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_exam.ftl">
<style type="text/css">
p {
	display: inline;
}
</style>
<body>
<form name="form_item" action="exam_exam_complete_task.do" method="post">
<input type="hidden" value="<#if rhs.method?exists >${rhs["method"]}</#if>" name="method" />
<input type="hidden" value="<#if rhs["task"]?exists >${rhs["task"].id}</#if>" name="taskId" />

<div class="exam-frame">
	<div class="panel-body">
    <div id="timeshow" class="btn btn-xs btn-warning" style="margin-bottom:15px; padding: 5px 12px;"></div> 
	
	<div style="float:right;">
		<p style="padding-right: 30px;"><@i18n "title_name" />: <#if rhs["paper"]?exists > ${rhs["paper"].name}</#if><br/>
		   <@i18n "title_examtime" />: <#if rhs["paper"]?exists > ${rhs["paper"].time}</#if><br/>
		   <@i18n "title_totalmark" />: <#if rhs["paper"]?exists > ${rhs["paper"].totalmark}</#if><br/>
		   <@i18n "title_passmark" />: <#if rhs["paper"]?exists > ${rhs["paper"].passmark}</#if>
		</p>
	</div>
    <#assign i = 0 >
	
	<div style="margin-top:10px; margin-bottom:5px;">
		<img style="vertical-align: text-bottom;" src="common/images/e_note_orange.png" />
		<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Notice</span>
	</div>
	<div class="alert alert-warning">
		<p>1. Do NOT press WIN button and ALT button, or the exam will commit automatic! </p><br/>
		<p>2. Do NOT CLOSE window before done the exam!</p>
		<p>3. Every keyboard during exam will be record!</p>
	</div>
	
	<div style="margin-bottom:5px;">
		<img style="vertical-align: text-bottom;" src="common/images/e_answer_green.png" />
		<span style="padding-left:5px; font-size:18px; color:#c6c6c6;"><@i18n "title_single" /></span>
	</div>
	
	<div class="alert alert-success">
		<table width="100%">
		<#list rhs["singleitems"] as singleitem>
			<tr>
				<td><strong>${singleitem_index+1}.&nbsp;${singleitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if singleitem.mark?exists&&singleitem.mark!="0">${singleitem.mark}<#else>${rhs["paper"].singlechoicemark}</#if></div></td>
			<tr>
			<#list singleitem.choiceitem as choiceitem>
				<tr>

					<td><input type="radio" value="${choiceitem.refid}" name="result[${i}].answer"/> ${choiceitem.value}</td>
				</tr>
			</#list>
			<input type="hidden" value="${singleitem.id}" name="result[${i}].item.id" />
			<input type="hidden" value="<#if singleitem.mark?exists >${singleitem.mark}<#else>${rhs["paper"].singlechoicemark}</#if>" name="result[${i}].mark" />
			<#assign i = i + 1 >
			<tr>
				<td><hr></td>
			</tr> 
		 </#list> 	
      	 </table>
     </div>

     <#if (rhs["multiitems"]?size > 0) >
	     <div style="margin-bottom:5px;">
			<img style="vertical-align: text-bottom;" src="common/images/e_answer_green.png" />
			<span style="padding-left:5px; font-size:18px; color:#c6c6c6;"><@i18n "title_multi" /></span>
		 </div>
		
	     <div class="alert alert-success">
			<table width="100%">
		    <#list rhs["multiitems"] as multiitem>
		    	<tr>

					<td><strong>${multiitem_index+1}.&nbsp;${multiitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if multiitem.mark?exists&&multiitem.mark!="0">${multiitem.mark}<#else>${rhs["paper"].multichoicemark}</#if></div></td>
				<tr>
				<#list multiitem.choiceitem as choiceitem>
					<tr>
						<td><input type="checkbox" value="${choiceitem.refid}" name="result[${i}].answer"/> ${choiceitem.value}</td>
					</tr>
				</#list>
				<input type="hidden" value="${multiitem.id}" name="result[${i}].item.id" />
				<input type="hidden" value="<#if multiitem.mark?exists>${multiitem.mark}<#else>${rhs["paper"].multichoicemark}</#if>" name="result[${i}].mark" />
				<#assign i = i + 1 > 

		      	</#list>
	      	</table>
	     </div>
     </#if>
      	
     <#if (rhs["blankitems"]?size > 0 )>
	     <div style="margin-bottom:5px;">
			<img style="vertical-align: text-bottom;" src="common/images/e_answer_green.png" />
			<span style="padding-left:5px; font-size:18px; color:#c6c6c6;"><@i18n "title_blank" /></span>
		 </div>
		
	     <div class="alert alert-success">
			<table width="100%">
		    <#list rhs["blankitems"]?sort_by("id") as blankitem>
		    	<tr>
					<td><strong>${blankitem_index+1}.&nbsp;${blankitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if blankitem.mark?exists&&blankitem.mark!="0">${blankitem.mark}<#else>${rhs["paper"].blankmark}</#if></div></td>
				<tr>
				<tr>
					<td><input type="text"  name="result[${i}].answer"/></td>
					<input type="hidden" value="${blankitem.id}" name="result[${i}].item.id" />
					<input type="hidden" value="<#if blankitem.mark?exists >${blankitem.mark}<#else>${rhs["paper"].blankmark}</#if>" name="result[${i}].mark" />
				</tr>
				<#assign i = i + 1 > 

		    </#list>
	      	</table>
	     </div>
     </#if>
      
      
     <#if (rhs["essayitems"]?size > 0) >
         <div style="margin-bottom:5px;">
			<img style="vertical-align: text-bottom;" src="common/images/e_answer_green.png" />
			<span style="padding-left:5px; font-size:18px; color:#c6c6c6;"><@i18n "title_essay" /></span>
		 </div>
		
	     <div class="alert alert-success">
	     	<table width="100%">  
	      	<#list rhs["essayitems"]?sort_by("id") as essayitem>
	      		<tr>
					<td><strong>${essayitem_index+1}.&nbsp;${essayitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if essayitem.mark?exists&&essayitem.mark!="0">${essayitem.mark}<#else>${rhs["paper"].essaymark}</#if></div></td>
				<tr>
				<tr>
					<td><textarea name="result[${i}].answer"> </textarea></td>
					<input type="hidden" value="${essayitem.id}" name="result[${i}].item.id" />
					<input type="hidden" value="<#if essayitem.mark?exists>${essayitem.mark}<#else>${rhs["paper"].essaymark}</#if>" name="result[${i}].mark" />
				</tr>
				<#assign i = i + 1 > 
	      	</#list>
	    	</table>
	     </div>
	 </#if>
	    
	 <div style="text-align: center; padding-bottom:15px;">
	 	<input type="button" class="btn btn-xs btn-success" style="padding: 5px 10px;" value="Submit" id="submitButton"/>
	 </div>
	 
	 
    </div>
  </div>
</form>
</body>


<script>
	var warn=0;
	var interval;
	var h=0; //设置考试时间(小时单位) 
	var m=1; //设置考试时间(分钟单位) 
	var timeShowId="timeshow"; //设置时间显示层ID 
	var TimeNum=h*60*60+parseInt(${rhs["paper"].time})*60; 
	var timeStr; 
	function ChangeTime(){ 
		TimeNum--; 
		if(TimeNum > 0){ 
			timeStr=setTimeout("ChangeTime()",1000); 
		}else{ 
			document.getElementsByName("form_item")[0].submit();
		} 
		document.getElementById(timeShowId).innerHTML="Time Remain:"+Math.floor(TimeNum/60)+":"+TimeNum%60+""; 
	} 
	$('#submitButton').click(function () {
		var btn = $(this);
		btn.button('loading');
		document.getElementsByName("form_item")[0].submit();
		setTimeout("refresh()",100);
	});
	function refresh(){
		window.opener.location.href = 'exam_exam_exam_complete.do';
		window.close();
		//alert("refresh");
	}
	
	function isIE() { //ie?  
    	if (!!window.ActiveXObject || "ActiveXObject" in window)  
        	return true;  
    	else  
        	return false;  
	}
	
	$(document).ready(function(){
     	ChangeTime();
	});
	document.oncontextmenu=function(){
    	alert('Can not use right mouse key!');
    	return false;
	}
	document.onkeydown=function(e){
	    e=e||event;
	    //alert(e.keyCode);//可查看各个按键的keyCode是多少
		//屏蔽F5刷新键
	    if(e.keyCode==116){
	    	record_keycode("F5");
	        alert('Can not use F5!');
	        e.keyCode = 0;
	        return false;
	    }
		//屏蔽esc键
		if(e.keyCode == 27){
			record_keycode("ESC");
			alert('Can not use ESC！');
			e.keyCode = 0;
			 return false;
		}
		//屏蔽alt
		if(e.keyCode == 18){
			record_keycode("ALT");
			alert('Warning: Can not use ALT！Or the exam will be commited!');
			e.keyCode = 0;
			if(warn == 1){
				document.getElementsByName("form_item")[0].submit();
				setTimeout("refresh()",100);
				//window.close();
			}
			warn=warn+1;
			return false;
		}
		//屏蔽F11
		if(e.keyCode == 122){
			record_keycode("F11");
			e.keyCode = 0;
			return false;
		}
		if((e.ctrlKey)&&(e.keyCode==78)){
			record_keycode("Ctrl + N");
			alert('Can not use Ctrl + N！');
			e.keyCode = 0;
			return false;
		}
		if((e.ctrlKey)&&(e.keyCode==67)){
			record_keycode("Ctrl + C");
			alert('Can not use Ctrl + C！');
			e.keyCode = 0;
			return false;
		}
		if((e.ctrlKey)&&(e.keyCode==65)){
			alert('Can not use Ctrl + A！');
			e.keyCode = 0;
			return false;
		}
		//屏蔽win键
		if(e.keyCode == 91){
			record_keycode("Win");
			alert('Can not use Win button！');
			e.keyCode = 0;
			if(warn == 1){
				document.getElementsByName("form_item")[0].submit();
				setTimeout("refresh()",100);
				 //window.close();
			 }
			 warn=warn+1;
			 return false;
		}
	}
    
    //当关闭窗口时提示是否提交考试 
    //window.onbeforeunload = function() {
        //return "Data has not been saved，CLOSE or SWITCH windows will auto commit the exam，continue?";       
    //}
    
    //记录键盘按键
    function record_keycode(keycode){
    	$.ajax({
			type : "POST",
			url : "exam_exam_monitorexam.do",
			data : "taskid=" + ${rhs["task"].id} +"&keycode=" + keycode,
			cache : false,
			success : function(html) {
				//document.getElementById("starttime_" + taskid).innerHTML = html;
			}
		});
    }
    
    //窗口关闭后给出提示  
    window.onunload = function()  {
    	//document.getElementsByName("form_item")[0].submit();
    	//refresh();
    }

	window.onfocus=function(){
		try{
			interval=window.setInterval("clipboardData.setData('text','')",100);
		}catch(e){
			alert("Denied by Browser!!");
		}
	} 
	function d(){
		window.clearInterval(interval);
		//window.close();
	}
	//为窗口注册失去焦点事件
    window.onblur = d;
</script>
