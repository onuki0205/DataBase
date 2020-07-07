



      CREATE TABLE customer (
               customer_name     char(20) NOT NULL,
               customer_street   char(30),
               customer_city     char(30),
          CONSTRAINT customer_pk Primary Key (customer_name) 
                ) ;

      CREATE TABLE branch (
             branch_name            char(15) NOT NULL,
             branch_city            char(30),
             assetts                int,
             CONSTRAINT branch_pk Primary Key (branch_name) 
                ) ;

       CREATE TABLE account  (
            account_number           char(10) NOT NULL,
            branch_name              char(15),
            balance                  int,
            CONSTRAINT account_pk Primary Key (account_number)
               ) ;

       CREATE TABLE depositor  (
           customer_name     char(20) NOT NULL,
            account_number           char(10) NOT NULL,
            CONSTRAINT  deposit_pk Primary Key (customer_name, account_number)
              ) ;

       CREATE TABLE loan  (
            branch_name              char(15) NOT NULL,
            loan_number              char(15),
            amount                   int,
            CONSTRAINT loan_pk Primary Key (loan_number)
               ) ;

       CREATE TABLE borrower  (
            customer_name     char(20) NOT NULL,
            loan_number              char(15),
             CONSTRAINT borrower_pk Primary Key (customer_name, loan_number)
                ) ; 


