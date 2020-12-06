 <!---
	PROGRAM: todo.cfm
	FOLDER: 
	SECTION: 
	AUTHOR: Jason Steinshouer
	DATE: 
	PURPOSE: Display ToDo items and form to add new ones
	PARAMETERS: 
			
	USAGE NOTES:
			
	
	MODIFICATION LOG:
	DATE:			AUTHOR:			  MODIFICATION:
 	========		========		  ================
--->
<cfoutput>
<cfif structKeyExists(prc, "qItems") and prc.qItems.recordCount>
	<div class="col-8">
		<table class="table">
			<thead>
				<tr>
					<th>ToDo</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="prc.qItems">
				<tr>
					<td>#prc.qItems.description#</td>
					<td><a href="/complete?id=#prc.qItems.p_todo_id#" class="btn btn-default btn-small pull-right">Complete</a></td>
				</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
</cfif>

<form class="form-inline" action="/add" method="POST">
	<div class="col-7">
	<cfif structKeyExists(prc,"message") and len(prc.message)>
		<div class="alert alert-danger"><cfoutput>#prc.message#</cfoutput></div>
	</cfif>
	</div>
	<div class="col-7">
  		<input type="text" class="form-control" placeholder="ToDo" name="description">
  	</div>
	<div class="col-1">
		<button type="submit" class="btn btn-default">Add</button>
	</div>
</form>
</cfoutput>