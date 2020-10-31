/**
 *
 * ToDo DAO
 *
*/
component output="false" singleton="true" {

	/**
	*
	* Constructor
	*
	*
	*/
	public function init() {

		return this;
	}

	// public function read(required numeric toDoID) {

	// 	var qItem = queryExecute("
	// 		SELECT p_todo_id, description, important
	// 		FROM ToDo 
	// 		WHERE p_todo_id = :toDoID
	// 	",
	// 	{
	// 		toDoID = arguments.toDoID
	// 	},
	// 	{
	// 		datasource = dsn.name
	// 	});

	// 	var toDO = new ToDo(
	// 		id = qItem.p_todo_id,
	// 		description = qItem.description,
	// 		important = qItem.important
	// 	);
	
	// 	return toDO;
	// }


	public function create(required ToDo toDo) {

		var qAddItem = "";

		queryExecute("
			INSERT INTO ToDo (description)
			VALUES (
				:description
			)
		",
		{
			description = arguments.toDo.getDescription()
		},
		{
			result = "qAddItem"
		});



		arguments.toDo.setID(qAddItem.generatedKey);
	
		return arguments.toDo;
	}

	public function completeItem(required numeric id) {

		queryExecute("
			UPDATE ToDo
			SET
				completed_date = GETDATE()
			WHERE p_todo_id = :id
		",
		{
			id = arguments.id
		});
	
	}
	
}