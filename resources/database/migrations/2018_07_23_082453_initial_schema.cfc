component {
    
    function up( schema ) {
        
   //      queryExecute("
			// CREATE TABLE [dbo].[ToDo] (
			//     [p_todo_id]      BIGINT         IDENTITY (1, 1) NOT NULL,
			//     [description]    NVARCHAR (MAX) NOT NULL,
			//     [completed_date] DATETIME       NULL,
			//     CONSTRAINT [PK_ToDo] PRIMARY KEY CLUSTERED ([p_todo_id] ASC)
			// );
   //      ");

        schema.create( "todo", function( Blueprint table ) {
            table.increments( "p_todo_id" );
            table.string( "description", "max" );
            table.datetime( "completed_date" ).nullable();
        } );
        
    }

    function down( schema ) {

   //      queryExecute("
			// DROP TABLE [dbo].[ToDo];
   //      ");

        schema.drop("todo");

    }

}
