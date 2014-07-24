function create_agmeeting(id){
  $.ajax({
         type:"POST",
         url: "agmeeting_create.do",
         data:"id="+id,
         cache: false,
         success: function(html){   
           document.getElementById('div_agmeeting_tree').innerHTML=html;
           }
  }); 
}

function update_agmeeting(id,column,columnValue){
  $.ajax({
         type:"POST",
         url: "agmeeting_update.do",
         data:"column="+column+"&id="+id+"&columnValue="+columnValue,
         cache: false,
         success: function(html){
           document.getElementById('div_agmeeting_result').innerHTML="Update succeed!";
           setTimeout( "document.getElementById('div_agmeeting_result').innerHTML=''", 1000);
           }
  }); 
}

function delete_agmeeting(id){
  $.ajax({
         type:"POST",
         url: "agmeeting_delete.do",
         data:"id="+id,
         cache: false,
         success: function(html){
           document.getElementById('div_agmeeting_tree').innerHTML=html;
           }
  }); 
}

