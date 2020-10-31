component extends="coldbox.system.EventHandler"{

	property name="toDoService" inject="todo.ToDoService";

	// Default Action
	function index(event,rc,prc){
		prc.qItems = toDoService.getItems();
		event.setView("main/index");
	}

	// Completed Items
	function completed(event,rc,prc){
		prc.qItems = toDoService.getCompletedItems();
		event.setView("main/complete");
	}

	// Completed Items
	function complete(event,rc,prc){

		event.paramValue("id",0);

		if (structKeyExists(rc, "id") and len(rc.id)) {
			toDoService.completeItem(rc.id);
		}

		setNextEvent("main");

	}

	/**
	* add
	*/
	function add( event, rc, prc ){
		if (structKeyExists(rc, "description") and len(rc.description)) {
			toDoService.addItem(rc.description);
		}
		else {
			prc.message = "Description is required!";
		}
		prc.qItems = toDoService.getItems();
		event.setView("main/index");

	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit(event,rc,prc){

		getInstance( "MigrationService@cfmigrations" )
    	.setDefaultGrammar( "SqlServerGrammar@qb" )
    	// .setDefaultGrammar( "MyH2Grammer" )
    	.runAllMigrations( "up" );

	}

	function onRequestStart(event,rc,prc){

	}

	function onRequestEnd(event,rc,prc){

	}

	function onSessionStart(event,rc,prc){

	}

	function onSessionEnd(event,rc,prc){
		var sessionScope = event.getValue("sessionReference");
		var applicationScope = event.getValue("applicationReference");
	}

	function onException(event,rc,prc){
		//Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		//Place exception handler below:

	}

	function onMissingTemplate(event,rc,prc){
		//Grab missingTemplate From request collection, placed by ColdBox
		var missingTemplate = event.getValue("missingTemplate");

	}

}