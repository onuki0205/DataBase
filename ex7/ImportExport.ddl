CREATE TABLE c(
    cno         char[3] NOT NULL,
    cname       char[10],
    cstatus     int[3],
    CONSTRAINT c_pk Primary Key (cno)
);

CREATE TABLE I(
    Ino         int[5] NOT NULL,
    Iname       char[10],
    Color       char[6],
    Weight      int[3],
    CONSTRAINT I_pk Primary Key (Ino)
);

CREATE TABLE c-I(
    cno         char[3] NOT NULL,
    Ino         int[5] NOT NULL,
    CONSTRAINT c-I_pk Primary Key (cno,Ino)
);