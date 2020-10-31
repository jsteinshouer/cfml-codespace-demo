 <!---
	PROGRAM: complete.cfm
	FOLDER: 
	SECTION: 
	AUTHOR: Jason Steinshouer
	DATE: 
	PURPOSE: Display completed todo items
	PARAMETERS: 
			
	USAGE NOTES:
			
	
	MODIFICATION LOG:
	DATE:			AUTHOR:			  MODIFICATION:
 	========		========		  ================
 	This is a test
--->
<cfif structKeyExists(prc, "qItems") and prc.qItems.recordCount>
<cfoutput>
	<div class="col-8">
		<table class="table">
			<thead>
				<tr>
					<th>Completed ToDo Items</th>
					<th>Date Completed</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="prc.qItems">
				<tr>
					<td>#prc.qItems.description#</td>
					<td>#dateFormat(prc.qItems.completed_date,"medium")#</td>
				</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
</cfoutput>
</cfif>