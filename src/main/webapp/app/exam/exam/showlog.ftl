<div class="panel panel-primary" style="margin-top: 18px;">
      <div class="panel-heading"><strong>Log</strong></div>
      <div class="panel-body">
      	 <table class="table table-condensed table-bordered table-striped">
      	 <tr>
      	 	<td>Date</td>
      	 	<td>Operation</td>
      	 </tr>
      	 
      	 <#list rhs["dataList"] as log>
      	 	<tr>
      	 		<td>
      	 			${log.monitordate}
      	 		</td>
      	 		<td>
      	 			${log.operation}
      	 		</td>
      	 	</tr>
		</#list>
      	 </table>
      </div>
</div>