/**
 *
 * ToDo Service
 *
*/
component output="false" singleton="true" {

	/**
	*
	* Constructor
	*
	* @toDoDAO.inject todo.ToDoDAO
	* @toDoGateway.inject todo.ToDoGateway
	*
	*/
	public function init(required toDoDAO, required toDoGateway) {

		variables.toDoDAO = arguments.toDoDAO;
		variables.toDoGateway = arguments.toDoGateway;

		return this;
	}

	public function getItems() {

		return toDoGateway.getItems();
	}


	public function getCompletedItems() {

		return toDoGateway.getCompletedItems();
	}
 
	public function addItem(required string description) {

		var t = new ToDo(argumentCollection=arguments);

		return toDoDAO.create(t);
	}

	public function completeItem(required numeric id) {

		toDoDAO.completeItem(arguments.id);
	
	}
	
}