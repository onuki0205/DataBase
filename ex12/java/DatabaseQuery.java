/***************************/
/* DatabaseQuery.java      */
/* JDBC sample program     */
/* Enrique Lopez de Lara   */
/* m5082201@u-aizu.ac.jp   */
/* 2005-05-20              */
/***************************/

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseQuery {
    public static void main(String[] args) {
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String query;
	String accountNumber = "";

		
	// Open a connection to the database			
	try {
	    // First load the postgresql jdbc driver
	    Class.forName("org.postgresql.Driver");
			
	    // Then open the connection to the database
	    connection = DriverManager.getConnection("jdbc:postgresql://localhost:4710/s1260027", "s1260027", "password");
			
	} catch (ClassNotFoundException e) {
	    e.printStackTrace();
	} catch (SQLException e) {
	    e.printStackTrace();
	}



		


	System.out.print("Input account-number:  ");	    
	BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
	try {
	    accountNumber = reader.readLine();

	} catch (IOException e) {			
	    e.printStackTrace();
	}

	System.out.println("Output (from database)>> ");
	System.out.println();
	System.out.println("[Cust-name,           Acc-No,     Branch,     Balance]");

	query = "SELECT * FROM depositor,account WHERE depositor.account_number=account.account_number and depositor.account_number = '" + accountNumber + "'";
			
	try {
	    statement = connection.createStatement();
	    resultSet = statement.executeQuery(query);
	    while(resultSet.next()) {
		System.out.println(resultSet.getString("customer_name")+"  "+resultSet.getString("account_number")+"  "+resultSet.getString("branch_name")+"  "+resultSet.getString("balance"));
	    }
	    resultSet.close();
			
	} catch (SQLException e) {
	    e.printStackTrace();
	}
		
	System.out.println();

		




















		
	// Close the connection to the database
        try {
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}        
    }

}
