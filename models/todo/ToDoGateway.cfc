/**
 *
 * ToDo Gateway
 *
*/
component output="false" singleton="true" {

	/**
	*
	* Constructor
	*
	*/
	public function init() {

		return this;
	}

	public function getItems() {
		var qItems = queryExecute("
			SELECT p_todo_id, description
			FROM ToDo 
			WHERE completed_date IS NULL
		",{});

		return qItems;
	}


	public function getCompletedItems() {
		var qItems = queryExecute("
			SELECT p_todo_id, description, completed_date
			FROM ToDo 
			WHERE completed_date IS NOT NULL
		",{});

		return qItems;
	}
	
}