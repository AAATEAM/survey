<#include "common/freemarker/include_header.ftl">
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">

    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 400px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
       
      }
      
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 10px 9px;
      }

    </style>


  </head>

  <body>
<script>  
  
  	function changlang(value){
	    document.getElementById('formlanmuadmin').submit();
	}		
</script>

<body>
			    

    <div class="container">
                            
      <form class="form-signin" name="loginForm" action="login.do?method=forget" method="post">
        <hr>
        <table>
        <tr >
        	<td style="width:130px;height:130px;">
        		<img src="common/images/login_1.jpg" style="width:100px;height:100px;" />
        	</td>
        	<td>
        		Input You Account: 
        		<input type="text" placeholder="" class="input-block-level" placeholder="Account" name=account value= >
        	</td>
        </tr>
      	<tr>
      		<td style="width:100px;"></td>
      		<td>
        		<#if rhs?exists>${rhs["tipInfo"]?if_exists}</#if>
        		<button class="btn btn-lg  btn-primary pull-right" type="submit"> <@i18n "submit" /></button><br/>
        	</td>
        </tr>
       
        </table>
      </form>
    </div> <!-- /container -->

  </body>
</html>
