component {
 
    
    public void function run() {
        javaSystem = createObject("java","java.lang.System");

        var ds = {
            class: 'net.sourceforge.jtds.jdbc.Driver',
            connectionString: 'jdbc:jtds:sqlserver://db:1433/master',
            username: javaSystem.getEnv("DB_USER"),
            password: javaSystem.getEnv("DB_PASSWORD")
        };

        var sql = "
            IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ToDo')
            BEGIN
            CREATE DATABASE ToDo;
            END
    
        ";

        var qry = queryExecute( sql=sql, options={ datasource : ds } );

    }
}