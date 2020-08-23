#! /bin/sh

# Source the environment for java 1.4.2
. ./java-1_4_2rc

# compile now
javac -classpath $PGSQL_JDBC DatabaseQuery.java