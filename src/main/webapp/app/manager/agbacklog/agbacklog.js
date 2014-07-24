function create_agbacklog(id){
  $.ajax({
         type:"POST",
         url: "agbacklog_create.do",
         data:"id="+id,
         cache: false,
         success: function(html){   
           document.getElementById('div_agbacklog_tree').innerHTML=html;
           }
  }); 
}

function update_agbacklog(id,column,columnValue){
  $.ajax({
         type:"POST",
         url: "agbacklog_update.do",
         data:"column="+column+"&id="+id+"&columnValue="+columnValue,
         cache: false,
         success: function(html){
           document.getElementById('div_agbacklog_result').innerHTML="Update succeed!";
           setTimeout( "document.getElementById('div_agbacklog_result').innerHTML=''", 1000);
           }
  }); 
}

function delete_agbacklog(id){
  $.ajax({
         type:"POST",
         url: "agbacklog_delete.do",
         data:"id="+id,
         cache: false,
         success: function(html){
           document.getElementById('div_agbacklog_tree').innerHTML=html;
           }
  }); 
}

