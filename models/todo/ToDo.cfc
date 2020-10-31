/**
 *
 * ToDo Bean
 *
*/
component output="false" accessors="true" {
	
	property name="id" type="numeric" hint="ToDo Key";
	property name="description" type="string" hint="ToDo description";

	/**
	*
	* Constructor
	*			
	*/
	public any function init(id = 0, description = "") {

		variables.id = arguments.id;
		variables.description = arguments.description;
		
		return this;
	}
	
}	