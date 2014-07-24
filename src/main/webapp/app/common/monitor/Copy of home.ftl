
<#include "../../../common/freemarker/include_header.ftl">
<script>
	function polling()
	{
		MyMar=setInterval("ajax_polling('common_monitor_push_ajax_jvm.do','')",2000);   //没1S轮询一次
	}
	function ajax_polling(url,para){
	  $.ajax({
	         type:"POST",
	         url: url,
	         data:para,
	         cache: false,
	         success: function(html){
	             
		          document.getElementById('div_action_result').innerHTML=html;
	         }
	           
	  });  
	}	
</script>

<body style="padding:10px" onload="ajax_polling('common_monitor_push_ajax_jvm.do','');polling()">

<h5>JVM</h5>
<div id=div_action_result>
</div>
<h5>数据库配置文件</h5>
${rhs["hashmap_system"]["database-filename"]}
<h5>框架版本</h5>
<b>spring :</b>${rhs["hashmap_system"]["spring-version"]}
<br><b>hibernate :</b>${rhs["hashmap_system"]["hibernate-version"]}
<br><b>struts :</b>${rhs["hashmap_system"]["struts-version"]}
<br><b>freemarker :</b>${rhs["hashmap_system"]["freemarker-version"]}
<br><b>h2 :</b>${rhs["hashmap_system"]["h2-version"]}
<br><b>jetty :</b>${rhs["hashmap_system"]["jetty-version"]}
<br><b>servlet :</b>${rhs["hashmap_system"]["servlet-version"]}
<br><b>xml-sax-parser :</b>${rhs["hashmap_system"]["xml-sax-parser-version"]}

<h5>JDK配置</h5>
<#if rhs["hashmap_system"]["java_home"]?exists>
<b>JAVA_HOME:</b> ${rhs["hashmap_system"]["java_home"]}
<#else>
	<#if rhs["hashmap_system"]["JAVA_HOME"]?exists>
	<b>JAVA_HOME:</b> ${rhs["hashmap_system"]["JAVA_HOME"]}
	</#if>
</#if>

<br><b>lib:</b>${rhs["hashmap_system"]["classpath"]}


<h5>系统属性</h5>
<#list rhs["hashmap_system"]?keys as k>
 <br>   ${k}: ${rhs["hashmap_system"][k]}
</#list>
</body>
<#--
<br>runtime.totalMemory:${rhs["runtime"].totalMemory()}
<br>runtime.freeMemory:${rhs["runtime"].freeMemory()}
<br>runtime.maxMemory:${rhs["runtime"].maxMemory()}
<hr>
-->