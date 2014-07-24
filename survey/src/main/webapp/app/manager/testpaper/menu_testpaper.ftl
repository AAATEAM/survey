<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="<@context_module/>testpaper.js"></script>

<div class="row" style="padding-left:5px">
	<div class="span5">
	  <a href=# onclick="javascript:action_testpaper('create.do','');">新建试卷</a>
	<hr>
	</div>
	<#include "ajax_testpaper.ftl">
	
</div>
</body>
<#--
<hr>
<footer>
	<p>&copy; Company 2013</p>
</footer>
-->
