<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="<@context_module/>user.js"></script>
<script language="javascript">
	function createUserRolegroupRelation(userId,roleId) {
		$.ajax({
	        type:"POST",
	     	url: "ea_ea_create_user_role_relation.do",
	     	data:"userId="+userId+"&roleId="+roleId,
	     	cache: false,
	     	success: function(html){
	       }	
	    });  
	}	
</script>

<body>
<div class="panel panel-primary">
	<div class="panel-heading">
		<a  style="color:#FFFFFF" class="btn btn-mini" href='ea_user_profile_edit.do?id=${rhs["user"].id}' onclick="return hs.htmlExpand(this, { objectType: 'iframe' })">修改个人信息</a>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
   		<a  style="color:#FFFFFF" class="btn btn-mini" href='common_edit_edit_bean_property.do?objectname=User&op=r&propertyname=experience&id=${rhs["user"].id}' onclick="return hs.htmlExpand(this, { objectType: 'iframe' })">编辑项目经验</a>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
   		<a  style="color:#FFFFFF" class="btn btn-mini" href='common_edit_edit_bean_property.do?objectname=User&op=r&propertyname=positiondescription&id=${rhs["user"].id}' onclick="return hs.htmlExpand(this, { objectType: 'iframe' })">编辑日常工作内容</a>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
    	<a  style="color:#FFFFFF" class="btn btn-mini" href="common_file_image_upload.do?id=${rhs["user"].id?if_exists}&beanname=User&op=r&propertyfilepath=imgfilename&folder=photo" onclick="return hs.htmlExpand(this, { objectType: 'iframe' })">上传照片</a>
	</div>
	<div class="panel-body">
		<iframe id="previewFrame" name="previewFrame"  src="ea_user_resume.do?id=${rhs["user"].id?if_exists}" style="width:900px;height:600px;" frameborder="0"  noresize="noresize"  />
	</div>
</div>
</body>

<span id="div_action_result" style="display:none">${rhs["info"]?if_exists}</span>   
	