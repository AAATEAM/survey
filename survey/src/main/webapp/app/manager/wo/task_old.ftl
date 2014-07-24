<!-- 页面框架，一行两列，左列上部分显示表单面板，下部分显示流程面板，右列显示聊天记录(log)面板  -->
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span8">
            <form id="edit_form" class="well form-horizontal" action="manager_wo_complete_task.do" method="post">

<!--左列上部分：业务面板，显示所有业务表单字段---------->
<!--字段是否显示由formProperties控制 -->
                    <legend>
                        <span class="label label-warning">Business Panel</span>
                        <h6>
                            <small>
                            ${rhs["task"].name}
                            <!--
                            (<a href="common_activiti_process_diagram.do?processInstanceId=${rhs.model.processInstanceId?if_exists}" target="_blank">Process Diagram</a>)

                            <a href="manager_customer_list_customer.do" onclick="return hs.htmlExpand(this, { objectType: 'iframe' })" >Contact List</a>
                            -->

                            </small>
                        </h6>
                    </legend>
                    <input type="hidden" id="taskId" name="taskId" value='${rhs["task"].id}'/>
                    <table class="table table-condensed">
                      <tr>
                        <td>Request ID</td>
                        <td>
                          <input type="hidden" id="objectid" name="woobject.id" value='<#if rhs["model"]?exists>${rhs["model"].id?if_exists}</#if>' />
                          <input type="hidden" name="woobject.projectId" value='<#if rhs["model"]?exists>${rhs["model"].projectId?if_exists}</#if>' />
                          <input type="hidden" name="woobject.processInstanceId" value='<#if rhs["model"]?exists>${rhs["model"].processInstanceId?if_exists}</#if>' />
                          <input type="text" name="woobject.requestid" value='<#if rhs["model"]?exists>${rhs["model"].requestid?if_exists}</#if>'
                            ${rhs.formPro.requestid?if_exists} />
                        </td>
                        <td>WO Title</td>
                        <td>
                            <input type="text" id="title" name="woobject.title" value='<#if rhs["model"]?exists>${rhs["model"].title?if_exists}</#if>'${rhs.formPro.title?if_exists} />
                        </td>
                      </tr>

                      <tr>
                        <td>WO Description</td>
                        <td colspan=3>
                          <textarea style="width:530px" rows="4" id="requestDesc" name="woobject.requestDesc"
                                ${rhs.formPro.requestDesc?if_exists} ><#if rhs["model"]?exists>${rhs["model"].requestDesc?if_exists}</#if></textarea>
                        </td>
                      </tr>
                      <tr>
                        <td>Business Type</td>
                        <td>
                          <select id="businessType" name="woobject.businessType"
                              ${rhs.formPro.businessType?if_exists} >
                                <option value="Change Request">Change Request</option>
                                <option value="Service Request">Service Request</option>
                                <option value="Work Package">Work Package</option>
                              </select>
                        </td>
                        <td>Service Function</td>
                        <td>
                          <select id="serviceFunction" name="woobject.serviceFunction"
                              ${rhs.formPro.serviceFunction?if_exists} >
                                <option value="Application Development &amp; 3rd Level Support">Application Development &amp; 3rd Level Support</option>
                                <option value="2nd Level Operations">2nd Level Operations</option>
                                <option value="Deployment">Deployment</option>
                              </select>
                        </td>
                      </tr>
                      <script type="text/javascript">
                        document.getElementById("serviceFunction").value = '${rhs.model.serviceFunction?if_exists}';
                        document.getElementById("businessType").value = '${rhs.model.businessType?if_exists}';
                      </script>
                      <tr>
                          <td>Manday</td>
                          <td>
                            <input type="text" id="manday" name="woobject.manday" value='<#if rhs["model"]?exists>${rhs["model"].manday?if_exists}</#if>'
                            ${rhs.formPro.manday?if_exists} />
                          </td>
                          <td>Actual Manday</td>
                          <td>
                            <input type="text" id="actualManday" name="woobject.actualManday" value='<#if rhs["model"]?exists>${rhs["model"].actualManday?if_exists}</#if>'
                            ${rhs.formPro.actualManday?if_exists} />
                          </td>
                      </tr>
                      <tr>
                        <td>Reception Date</td>
                          <td>
                             <input type="text" name="woobject.receiveTime" value='<#if rhs["model"]?exists>${rhs["model"].receiveTime?if_exists}</#if>' ${rhs.formPro.receiveTime?if_exists}
                                onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ${rhs.readonly?if_exists} />
                            </td>
                        <td>Estimation Date</td>
                          <td>
                             <input type="text" name="woobject.responseTime" value='<#if rhs["model"]?exists>${rhs["model"].responseTime?if_exists}</#if>' ${rhs.formPro.responseTime?if_exists}
                                onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"
                                  ${rhs.readonly?if_exists} />
                            </td>
                          </tr>
                      <tr>
                        <td>Requirement Changing Times</td>
                          <td>
                             <input type="text" name="woobject.changeTimes" value='<#if rhs["model"]?exists>${rhs["model"].changeTimes?if_exists}</#if>' ${rhs.formPro.changeTimes?if_exists}
                                ${rhs.readonly?if_exists} />
                            </td>
                        <td>Rework Times</td>
                          <td>
                            <input type="text" name="woobject.reworkTimes" value='<#if rhs["model"]?exists>${rhs["model"].reworkTimes?if_exists}</#if>' ${rhs.formPro.reworkTimes?if_exists}
                                ${rhs.readonly?if_exists} />
                            </td>
                          </tr>
                      <tr>
                        <td>Planning Start Date</td>
                          <td>
                          <input type="text" id="startTime" name="woobject.startTime" value='<#if rhs["model"]?exists>${rhs["model"].startTime?if_exists}</#if>'
                            onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"
                            ${rhs.formPro.startTime?if_exists} />
                            </td>
                        <td>Planning End Date</td>
                          <td>
                          <input type="text" id="endTime" name="woobject.endTime" value='<#if rhs["model"]?exists>${rhs["model"].endTime?if_exists}</#if>'
                            onclick="javascript:WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"
                            ${rhs.formPro.endTime?if_exists} />
                            </td>
                          </tr>
                      <tr>
                        <td>Priority</td>
                          <td>
                            <input type="text" id="priority" name="woobject.priority" value='<#if rhs["model"]?exists>${rhs["model"].priority?if_exists}</#if>'
                            ${rhs.formPro.priority?if_exists} />
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4">
                              <#include "../../common/uploadfile/macro_uploadfile.ftl"/>
                          <@uploadfile 'wo_${rhs.model.id}', 'activiti', '${rhs.formPro.fileUpload?if_exists}'/>
                        </td>
                      </tr>
                    </table>


<!--左列下部分:显示流程控制面板 ---------------->
                    <fieldset>
                    <legend>
                    <span class="label label-warning">Process Panel</span>
                    <!-- 控制流程走向的参数，这个div由formProperties控制是否显示，下面两个div同样原理 -->
                    <div ${rhs.formPro.flag?if_exists} >
                        <div class="control-group">
                            <label class="control-label">Suggestion</label>
                            <div class="controls">
                                <!-- process.js -> show_assignee(obj, array): 如果这个 select 选中的值在传入这个方法的数组中，就把【选择用户】显示在页面上  -->
                                <select id="flag" name="flag" onchange="javascript:process_show_assignee(this, ['1', '3']);">
                                    <option value="">- Select -</option>
                                    <option value="3">Assignment To Design Team Decided</option>
                                    <option value="1">Assignment To Different Domain Needed</option>
                                    <option value="5">Out Of Scope</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="control-group" ${rhs.formPro.systemCompletion?if_exists} >
                      <label class="control-label">Evaluate System Completion</label>
                      <div class="controls">
                        <select name="systemCompletion" onchange="javascript:process_show_assignee(this, ['2']);">
                          <option value="">- Select -</option>
                          <option value="1">System Completed</option>
                          <option value="2">System not Completed</option>
                        </select>
                      </div>
                    </div>
                    <div class="control-group" ${rhs.formPro.codeFix?if_exists} >
                      <label class="control-label">Code Fix</label>
                      <div class="controls">
                        <select name="codeFix">
                          <option value="">- Select -</option>
                          <option value="1">Needed</option>
                          <option value="2">Not Needed</option>
                        </select>
                      </div>
                    </div>

                    <!-- 选择用户模块 -->
                    <div ${rhs.formPro.selectAssignee?if_exists}>
                        <#include "../../common/activiti/include_select_assignee.ftl"/>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <input type="button" value="Complete Task" class="btn" onclick="process_complete_task('edit_form');">
                        </div>
                    </div>
                </legend>
                </fieldset>
                <!-- process panel end -->
            </form>
        </div>

<!-- 右列：聊天记录（log）面板 ----------------->
        <div class="span4" id="task_log_div"></div>
        <!-- task log -end -->
    </div>
</div>
<script type="text/javascript">
$.ajax({
    type: 'post',
    url: 'common_tasklog_list.do',
    data: 'taskId=${rhs["task"].id}',
    async: false,
    cache: false,
    success: function(data){
        $("#task_log_div").html(data);
    }
});


</script>