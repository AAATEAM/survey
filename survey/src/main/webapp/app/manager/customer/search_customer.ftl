<div class="span10 content">
	Name: <input type="text" id="name"  value="${name?if_exists}" name="name" />
</div>

<#--
<script type="text/javascript">
if(navigator.userAgent.indexOf("MSIE")>0){
	document.getElementById("name").attachEvent("onpropertychange",whileLoad); 
}else{ 
	document.getElementById("name").addEventListener("input",whileLoad,false); 
} 
</script>
-->
