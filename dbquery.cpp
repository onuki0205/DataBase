/***************************/
/* dbquery.cpp             */
/* libpqxx sample program  */
/* 2005-05-18 (Enrique)    */
/***************************/
#include <iostream>
#include <string>
#include <pqxx/pqxx>

using namespace PGSTD;
using namespace pqxx;

int main(int arg, char * argv[])
{
	string branch_name;
	string branch_query;
	string asset_query;

	/* Open a connection to the datbase. Please write dbname of your database */
	connection Conn("host=localhost port=xxxx user=sxxxxxxx dbname=sxxxxxxx password=");

	/* The database has to be accessed through a transaction template */
	transaction<> T(Conn, "trx");
	try
	{
		/* Ask the user for the branch name to be used in the query  */
		cout << "Enter a Branch Name (Downtown/Redwood/Perryridge/Brighton): ";
		getline(cin, branch_name);

		/* Format the SQL query to find out the account numbers associated to 
        	the branch specified by the user */	
		branch_query = "SELECT account_number FROM account WHERE branch_name = '" + branch_name + "'";

		/* Execucte the query and place the resultset in R */
		result R1( T.exec(branch_query) );
		
		/* Print the contents of the resultset */
		cout << "Account Numbers:" << endl;
		for (result::const_iterator c = R1.begin(); c != R1.end(); ++c)
		{
			cout << c[0].as(string()) << endl;
		}
	
		cout << endl;

		/* Format the SQL query to find out the assetts hold at the branch specified
        	by the user */	
		asset_query = "SELECT assetts FROM branch WHERE branch_name = '" + branch_name + "'";

		/* Execucte the query and place the resultset in R */
		result R2( T.exec(asset_query) );
		
		/* Print the contents of the resultset */
		cout << "Assetts:" << endl;
		for (result::const_iterator c = R2.begin(); c != R2.end(); ++c)
		{
			cout << c[0].as(string()) << endl;
		}

		/* Commit the transaction and close the connection */
		T.commit();
	}
        catch (const exception &e)
        {
                cerr << e.what() << endl;
                return 1;
        }
} 

