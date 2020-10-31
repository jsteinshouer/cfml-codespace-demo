/**
*
* ToDo Service Test
* 
* @file  tests.unit.models.todo.ToDoServiceTest.cfc
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

		describe( "ToDo Service Test Suite", function(){
		
			beforeEach(function( currentSpec ){

				dao =  getMockBox().createEmptyMock("models.todo.ToDoDAO");
				gateway =  getMockBox().createEmptyMock("models.todo.ToDoGateway");
				todoService = new models.todo.ToDoService(dao,gateway);
				
			});

			it( "getItems should call getItems from the gateway", function(){
				gateway.$("getItems");
				todoService.getItems();
				expect(gateway.$times(1,"getItems")).toBeTrue();
				
			});

			it( "getCompletedItems should call getCompletedItems from the gateway", function(){
				gateway.$("getCompletedItems");
				todoService.getCompletedItems();
				expect(gateway.$times(1,"getCompletedItems")).toBeTrue();
				
			});

			it( "addItem should call the DAO create method", function(){
				dao.$("create");
				todoService.addItem("Do Something");

				expect(dao.$times(1,"create")).toBeTrue();
			});

			it( "completeItem should call the DAO completeItem method", function(){
				dao.$("completeItem");
				todoService.completeItem(1);

				expect(dao.$times(1,"completeItem")).toBeTrue();
			});
			
		});

	}
	
}