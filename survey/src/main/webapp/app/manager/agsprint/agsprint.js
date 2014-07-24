function action_agsprint(url,para){
  
  $.ajax({
         type:"POST",
         url: url,
         data:para,
         cache: false,
        
         success: function(html){
        	 document.getElementById('div_agsprint_tree').innerHTML=html;
        	 setTimeout( "document.getElementById('div_action_result').innerHTML=''", 2000);
           }
  });  
}


function start_process(id, assignee){
	if(assignee == ''){
		alert('请选定被分派人！');
		return;
	}
	//alert("id="+id+"&assignee="+assignee);
  $.ajax({
         type:"POST",
         url: "agsprint_wf_start_process.do",
         data:"id="+id+"&assignee="+assignee,
         cache: false,
         success: function(html){
        	 document.getElementById('div_agsprint_result').innerHTML="Start Process succeed!";
	         setTimeout( "document.getElementById('div_agsprint_result').innerHTML=''", 2000);
           }
  });	
}




function get_object_history(id,objectname)
  
{     
	
	  $.ajax({
       type:"POST",
       url: "oa_ajax_get_history.do",
       data:"id="+id+"&objectname="+objectname,
       cache: false,
       success: function(html){
    	    
          document.getElementById('history_log').innerHTML=html;
	         
       }
	  });	
}


function submit_complete(operate)

{   
	document.getElementById('taskForm').submit();
}

function submit_back(initiator){       
	document.getElementById('assignee').value=initiator;
	document.getElementById('operate').value='send_back';
	document.getElementById('taskForm').submit();
}

function submit_transfer(){       
	var assignee = document.getElementById('assignee').value;
	if(assignee == '' || assignee == null)
	{
      alert("请选择转派人!");	
      return;
	}
	document.getElementById('operate').value='transfer';
	document.getElementById('taskForm').submit();
}