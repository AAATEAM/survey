function sortresult(operation,data){
	var url = "";
	if(operation == ""){
		operation = "team";
	}
	if(operation == "team"){
		url = "ea_report_ajax_assessment.do";
		$("#level").val("team");
	}
	if(operation == "tech"){
		url = "ea_report_tech_member.do";
		$("#level").val("tech");
	}
	$.ajax({
        type:"POST",
        url: url,
        data:"show="+data,
        cache: false,
        success: function(html){ 
	     	 document.getElementById('domain-result').innerHTML=html; 
        }
          
 }); 
	
}