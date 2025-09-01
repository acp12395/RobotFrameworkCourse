*** Settings ***
Documentation    Handle MySQL database
Library    DatabaseLibrary
Suite Setup    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpass}    ${dbhost}    ${dbport}
Suite Teardown    Disconnect From Database

*** Variables ***
${browser} =    Edge
${dbname}=    testdb
${dbuser}=    Alejandro
${dbpass}=    Abcdef1234
${dbhost}=    127.0.0.1
${dbport}=    3306

*** Test Cases ***
Create DB table and populate
    [Documentation]     Make use of DatabaseLibrary to create a DB table
    Execute Sql String    CREATE TABLE TestTable (id int(10) NOT NULL,Name varchar(100) NOT NULL,FamilyName varchar(100));
    Table Must Exist    TestTable
    Execute Sql Script    ./PopulateDB.sql
    Check If Not Exists In Database    Select * from TestTable where name="Itzel"
    Check If Exists In Database    Select * from TestTable where name="Lucy"
    Row Count Is Equal To X    Select * from TestTable where name="Lucy"    1
    Execute Sql String    Update TestTable set name="Lucy" where FamilyName="Bell"
    Row Count Is Equal To X    Select * from TestTable where name="Lucy"    2