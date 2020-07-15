DROP SEQUENCE WORDSEQ;
DROP TABLE WORDBOARD;

CREATE SEQUENCE WORDSEQ NOCACHE;

CREATE TABLE WORDBOARD(
	WORDNO NUMBER PRIMARY KEY,
	TITLE VARCHAR2(300) NOT NULL,
	LINK VARCHAR2(2000) NOT NULL,
	DISCRIPTION VARCHAR2(4000) NOT NULL,
	THUMBNAIL VARCHAR2(2000) NOT NULL
);