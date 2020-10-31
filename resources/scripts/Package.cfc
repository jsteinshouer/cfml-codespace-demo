/**
* CommandBox Task Runner to packackage the applications
*/
component {

	property name='pathPatternMatcher' 	inject='provider:pathPatternMatcher@globber';

	/**
	* Constructor
	*/
	function init(){

		var rootPath =  fileSystemUtil.resolvePath( '.' );
		variables.ARTIFACTS_DIRECTORY = rootPath & "build_artifacts";
		variables.PACKAGE_FILE = ARTIFACTS_DIRECTORY & "/package.zip";

		if ( !directoryExists( ARTIFACTS_DIRECTORY ) ) {
			directoryCreate( ARTIFACTS_DIRECTORY );
		}

		if ( fileExists( PACKAGE_FILE ) ) {
			fileDelete( PACKAGE_FILE );
		}

		return this;
	}

	/**
	* Default target
	*/
	void function run(){

		var ignorePatterns = [
			".svn",
			ARTIFACTS_DIRECTORY,
			"Jenkinsfile",
			"testbox",
			"tests",
			".env",
			".cfconfig.json",
			"server.json"
		];

		createPackage( PACKAGE_FILE, ignorePatterns );

	}

	/**
	* Creates a deployable package
	* 
	* @packageFile Name of the package path
	* @ignorePatterns Arrays of file patterns to ignore when packaging files
	*/
	void function createPackage( required string packageFile, required array ignorePatterns ) {

		var temporaryDirectory = getTempDirectory() & hash( rootPath );

		if ( directoryExists( temporaryDirectory ) ) {
			directoryDelete( temporaryDirectory, true );
		}
		directoryCreate( temporaryDirectory );
		directoryCopy( rootPath, temporaryDirectory, true, function( directoryPath ){

			// cleanup path so we just get from the archive down
			var thisPath = replacenocase( directoryPath, temporaryDirectory, "" );
			// Ignore paths that match one of our ignore patterns
			var ignored = pathPatternMatcher.matchPatterns( ignorePatterns, thisPath );
			// What do we do with this file/directory
			return ! ignored;
		});

		cfzip(
			action = "zip",
			file = packageFile,
			overwrite = true,
			source = temporaryDirectory
		);
		directoryDelete( temporaryDirectory, true );

	}


}