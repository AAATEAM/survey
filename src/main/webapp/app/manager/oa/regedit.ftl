<#include "../../../common/freemarker/include_header.ftl">
<script language="javascript">
	function  checkimgfile(){
		var name = document.userRegedit.file.value;
		if (name.length == 0){
		alert("文件地址不能为空");
		return false;
	    }
		if(/^.+\.(gif|jpg|ico|png|bmp)$/i.test(name)){
			document.getElementById('bt-sure').disabled=false;
		}
		else{
			uploadPicForm.reset();
			alert("支持的图片文件格式：gif|jpg|ico|png|bmp");}
		return true;
	}	
    function createUserRolegroupRelation(userId,roleId) {
		$.ajax({
	        type:"POST",
	     	url: "oa_create_user_role_relation.do",
	     	data:"userId="+userId+"&roleId="+roleId,
	     	cache: false,
	     	success: function(html){
	       }	
	    });  
	}	
</script>

<body style="padding:30px">
<form  name=userRegedit action="oa_regeditSave.do" onsubmit="javascript:return send();" method="POST" enctype="multipart/form-data">
<table class="table  table-condensed " >
    <thead>
		<tr>
			<th>个人信息登记</th>
		</tr>
	</thead>
	<tbody>
	    <tr>
	    	<td>
	    	  	擅长的技术领域（可以选择多项）
	    	    
				<#list rhs["organizelist"]  as organize>
					<#list organize.getRoles() as role>	
					<br>
				      <input type="checkbox"  
					    		onclick="createUserRolegroupRelation('${rhs["user"].id?if_exists}','${role.id?if_exists}');" 
					  <#list rhs["user"].getRoles()  as x>
			    	   	<#if x.name==role.name>
			    	    checked
			    	    </#if>
		    	    </#list>					    		
					>${role.name?if_exists} </input>					  
					</#list> 	        		    
				</#list>            
            </td>	    
	    </tr>	
	    <tr>
		    <td >
				<table style="width:1000px" >
				    <tr>
					    <td valign=top >
					     		<input  name="user.id" value="${rhs["user"].id?if_exists}" type="hidden"  />
								<input  name="user.passwd" value="${rhs["user"].passwd?if_exists}" type="hidden"  />
								<input  name="user.account" value="${rhs["user"].account?if_exists}" type="hidden"  />
								<input  name="user.imgfilename" value="${rhs["user"].imgfilename?if_exists} " type="hidden"  />
								<input  name="user.assessLev" value="${rhs["user"].assessLev?if_exists}" type="hidden"  />
								中文姓名 <input  name="user.name" value="${rhs["user"].name?if_exists}"  />
								&nbsp;&nbsp;&nbsp;性别
								<select style="width:50px"   name="user.sex">
									<option value="${rhs["user"].sex?if_exists}">${rhs["user"].sex?if_exists}</option>
								  	<option value="男">男</option>
								  	<option value="女">女</option>
								</select>
								<br>邮箱&nbsp;<input  name="user.email" style="width:250px"   type="text"  value='${rhs["user"].email?if_exists}'  />
								<br>手机号码&nbsp;<input style="width:200px"   name="user.phoneNumber" type="text"  value='${rhs["user"].phoneNumber?if_exists}'  />
								<br>QQ号&nbsp;<input  name="user.qq" type="text"  value='${rhs["user"].qq?if_exists}'  />
								<br>生日<input  name="user.birthDate" type="text"  value='${rhs["user"].birthDate?if_exists}'  onClick="WdatePicker()"/>
							   <br> 毕业日期&nbsp;<input  name="user.graduateDate" type="text"  value='${rhs["user"].graduateDate?if_exists}'  onClick="WdatePicker()"/>
								<br>入职日期&nbsp;<input  name="user.rollDate" type="text"  value='${rhs["user"].rollDate?if_exists}'  onClick="WdatePicker()"/>
                               <br>项目经验 (项目名称和项目业务简单介绍)
                               <table>
                               		<tr>
                               		<td valign=top>
										<br><textarea style="width:500px;height:200px" name="user.experience"  title="简单描述，用什么技术做过哪些项目" >${rhs["user"].experience?if_exists}</textarea>
									</td>
									<td valign=top >
									    <br>
										<div style="background-color: #FfFfcB;padding:10px">
										 Sample:
										 <br>1. OCG(Online Charging Gateway)项目测试：在每个版本上线之前，按照测试用例对版本进行测试，最终把测试报告提交给开发项目组。
		                                 <br>2. EHMS FIX BSS TEAM：对Fix BSS Team的系统进行维护。
		                                 <br>3.***
		                                 <br>4.***
										</div>
									</td>
									</tr>
								</table>
 								<br>日常工作手册 (平时项目中承担的角色和主要工作内容 )
							
                              <table>
                               		<tr>
                               		<td valign=top>
										<br><textarea style="width:500px;height:200px" name="user.positiondescription"   >${rhs["user"].positiondescription?if_exists}</textarea>
								    </td>
									<td valign=top >
									    <br>
										<div style="background-color: #FfFfcB;;padding:10px">
										 Sample:
										 <br>1. Development：代码编写,功能实现并交付。
										 <br>2. SA：对于一些小任务,跟香港同事沟通并理解需求后进行文档编写， 文档包括URS，FRS，提交给香港同事确认后，进行代码实现。
										 <br>3. Team Leader：跟香港同事了解需求，并安排组员代码实现；跟踪任务的进度，提交前做好质量控制工作；组织业务分享工作，并对新员工进行业务培训。

										</div>
									</td>
									</tr>
								</table>
								
							   <br>职业认证证书/ 参加过的培训  / 希望发展的技术领域等
                               <br><textarea style="width:600px;height:50px" name="user.certification"  >${rhs["user"].certification?if_exists}</textarea>
								
									<#--
								<br>身份证号<input  name="user.identityCard" type="text" style="width:250px"  value='${rhs["user"].identityCard?if_exists}'  />
								<br>籍贯&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  name="user.home"   style="width:450px"   type="text"  value='${rhs["user"].home?if_exists}'  />
							    <br>现住地址<input  name="user.address" style="width:450px"  type="text"  value='${rhs["user"].address?if_exists}'  />
								-->
							</td>
							<#--
							<td valign=top>	
							 <br>ERICSSON用户ID<input  name="user.ericssonid" style="width:250px"   type="text"  value='${rhs["user"].ericssonid?if_exists}'  /> GTC员工才需要填写
								
							    <br>上传个人照片，分辨率小于800×600大头照
							    <input class=input type="File" name="file" size=20 onChange="javascript:checkimgfile();">
						         &nbsp;&nbsp;
						         <input  name="account" value="${rhs["user"].account?if_exists}" type="hidden"  />
								&nbsp;&nbsp;
						        </form>	
								<#if (rhs["user"].imgfilename?exists)>
									<img with=300 height=400 src=/ea/file/photo/${rhs["user"].imgfilename?if_exists}  />
								</#if>	      
							</td>
							-->
						<tr><td  align=top >
						        <br>
						        <p  align=center>
						         <input    type="button"  onclick="javascript:userRegedit.submit();"     value="确定"> 
						        <p>
						         <br>
						</td></tr>
					</tr>
				</table>		    
		    
		    </td>
	    </tr>	
</table>		
</body>
	