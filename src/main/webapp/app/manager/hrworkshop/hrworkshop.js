function action_hrworkshop(url,para){
  $.ajax({
         type:"POST",
         url: url,
         data:para,
         cache: false,
         success: function(html){
        	if(url=="manager_hrworkshop_update.do"){
        		 
         	   	document.getElementById('div_action_result').innerHTML=html;
        	}else{
        	    document.getElementById('div_hrworkshop_table').innerHTML=html;
        	}
       	 	tip_info();   
       }
  });  
}






