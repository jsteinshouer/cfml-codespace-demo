/**
* CommandBox Task Runner for running test via Jenkins CI
*/
component {

	property name="serverService" inject="ServerService";

	/**
	* Constructor
	*/
	function init(){

		variables.rootPath =  fileSystemUtil.resolvePath( '.' );
		variables.resultsFile = rootPath & "_artifacts/testResults.xml";

		if ( !directoryExists( rootPath & "_artifacts" ) ) {
			directoryCreate( rootPath & "_artifacts" );
		}

		if ( fileExists( resultsFile ) ) {
			fileDelete( resultsFile );
		}

		return this;
	}

	/**
	* Default target
	*/
	function run(  ){

		runWithJunitReporter();

	}

	/**
	* Run with Junit reporter for Jenkins
	*/
	function runWithJunitReporter(){

		// var results = command("testbox run")
		// 	.params( reporter="junit" )
		// 	.inWorkingDirectory( rootPath )
		// 	.run( returnOutput=true );

		// job.start("Executing tests.")

		// var serverDetails = serverService.resolveServerDetails( {} );
		// var serverInfo = serverDetails.serverInfo;
	
		// var runnerURL = ( serverInfo.SSLEnable ? 'https://' : 'http://' ) & '#serverInfo.host#:#serverInfo.port#/tests/runner.cfm?reporter=junit';	
		// var httpResult = "";
		
		// try{
		// 	// Throw on error means this command will fail if the actual test runner blows up-- possibly on a compilation issue.
		// 	http url=runnerURL throwonerror=true result='httpResult';
		// } catch( any e ){
		// 	return error( 'Error executing tests: #CR# #e.message##CR##e.detail##CR##httpResult.fileContent ?: ''#' );
		// }

		// job.complete();

		// fileWrite( resultsFile, trim(httpResult.fileContent) );

		command( "testbox run" )
		    .params( reporter="junit" )
		    .overwrite( resultsFile )
		    .run();


	}


}