# Continuous integration on the HubsterAPI database

getSchemaScript.sql when run in SQL Developer will generate the ddl in the ddlGenerator.sql file. Use getSchemaScript.sql as a basis for developing your own CI with your database. 

Run the ddlGenerator.sql file in order for your database to have the schema necessary for the API in the HubsterDBapi repo. 

individualSchema.sql is just a simplified version of ddlGenerator.sql that was generated manually.