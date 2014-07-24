<#include "../../../common/freemarker/include_header.ftl">
<div class="alert alert-danger">
        <center><strong>${rhs["info"]}</strong> .</center>
</div>
<script type="text/javascript">

	$(document).ready(function(){
     	setTimeout("refresh()",2000);
	});
	
	function refresh(){
		window.close();
	}
</script>