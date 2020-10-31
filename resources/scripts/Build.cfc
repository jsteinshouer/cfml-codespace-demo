/**
* CommandBox Task Runner for CI
*/
component {

	/**
	* Constructor
	*/
	function init(){

		return this;
	}

	/**
	* Default target
	*/
	function run(){

		job.start( 'Building ToDo' );
		installDependencies();
		runDatabaseMigrations();
		job.complete();

	}

	/* 
		Install application or setup dependencies
	*/
	private void function installDependencies() {

		job.start( 'Installing dependencies' );

		/* Make sure cfconfig is globally installed */
		// command("install commandbox-cfconfig --system").run( returnOutput=true );
		// command("install commandbox-dotenv --system").run( returnOutput=true );
		// command("install commandbox-migrations --system").run( returnOutput=true );
		command("install").run( returnOutput=true );

		job.complete();
		
	}


	/* 
		Run database migration scripts
	*/
	private void function runDatabaseMigrations() {

		job.start( 'Running database migration scripts' );

		command("migrate install").run();
		command("migrate up").run();
		job.complete();
	}

}