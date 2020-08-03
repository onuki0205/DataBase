

CREATE TABLE account(
    account_number  char(10) NOT NULL,
    branch_name     char(15),
    balance          int,
    Primary Key (account_number)
);

CREATE TABLE borrower(
    customer_name   char(20) NOT NULL,
    loan_number     char(15),
    Primary Key (customer_name)
);

CREATE TABLE branch(
    branch_name     char(15) NOT NULL,
    branch_city     char(30),
    assets          int,
    Primary Key (branch_name)
);

CREATE TABLE depositor(
    customer_name   char(20) NOT NULL,
    account_number  char(10) NOT NULL,
    Primary Key (customer_name,account_number)
);

CREATE TABLE loan(
    branch_name     char(15) NOT NULL,
    loan_number     char(15),
    amount          int,
    Primary Key (branch_name)
);

CREATE TABLE customer(
    customer_name   char(20) NOT NULL,
    customer_street char(30),
    customer_city   char(30),
    Primary Key (customer_name)
);

