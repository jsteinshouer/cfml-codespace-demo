/**
*
* ToDo DAO Test
* 
* @file  tests.integration.models.todo.ToDoDAOTest.cfc
* @author  Jason Steinshouer
* @createdDate  6/7/2016
*
*/
component output="false" extends="testbox.system.BaseSpec" {

	// executes before all suites
	function beforeAll(){

	}

	// executes after all suites
	function afterAll(){

	}

	// All suites go in here
	function run( testResults, testBox ){

		describe( "ToDo DAO Test Suite", function(){
		
			beforeEach(function( currentSpec ){
				todoDAO = new models.todo.ToDoDAO();
			});

			it( "The create method should add a record to the database", function(){
				
				transaction {
					try {

						var myDescription = "Test ToDo: #createUUID()#";

						var todo = new models.todo.ToDo(
							description = myDescription
						);

						todoDAO.create(todo);

						expect(	todo.getID() ).toBeGT(0);

						var q = queryExecute("select * from todo where description = :desc",{desc = myDescription});
						
						expect(	q.recordCount ).toBe(1);
					}
					catch(any e) {
						transaction action="rollback";
						rethrow;
					}

					transaction action="rollback";
				}
			});

			it( "The completeItem method complete a todo record in the database", function(){
				
				transaction {
					try {

						var qInsert = "";

						var myDescription = "Test ToDo: #createUUID()#";

						queryExecute("
							INSERT INTO ToDo (description)
							VALUES (
								:description
							)
						",{description = myDescription},{result="qInsert"});

						var newID = qInsert.generatedKey;

						todoDAO.completeItem(newID);

						var q = queryExecute("select * from todo where p_todo_id = :todoID",{todoID = newID});
						
						expect(	q.completed_date ).toBeDate();
					}
					catch(any e) {
						transaction action="rollback";
						rethrow;
					}

					transaction action="rollback";
				}
			});
		});

	}
	
}