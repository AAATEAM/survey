function action_customer(url,para){
  
    $.ajax({
        type:"POST",
        url: "manager_customer_"+url,
        data:"beanname=Customer&"+para,
        cache: false,
        success: function(html){
        	if(url=="update.do"){
        		document.getElementById('div_action_result').innerHTML=html;
        	}else{
        	    document.getElementById('div_customer_table').innerHTML=html;
        	}
       	 	tip_info();   	 
     	 
        }
    });  
}

function whileLoad() {
	var name = document.getElementById('name').value;
	if (checkInput('name', name)) {
		var para = "name="+name;
		action_customer("search.do",para);
	}
}

function checkInput(id, str) {
	var pattern = new RegExp("[%`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
	for (var i = 0; i < str.length; i++) { 
		if (pattern.test(str.substr(i, 1))) {
			document.getElementById(id).focus();
			alert("There are illegal characters, please correct that and try again!");
			return false;
		}
	}
	return true;
}

