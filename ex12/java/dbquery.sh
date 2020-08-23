#! /bin/sh

# Source the environment for java 1.4.2
. ./java-1_4_2rc

# Run the sample
java -cp .:$PGSQL_JDBC DatabaseQuery