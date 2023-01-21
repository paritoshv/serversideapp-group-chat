CREATE TABLE GLOBAL_PERSON
 (
 PERSON_ID integer unique, 
 name varchar(15) not null,
 country varchar(35) default 'NULL',
 birth_date date,
 phone_number varchar(15),
 PRIMARY KEY(PERSON_ID)
 ) ;

 INSERT INTO GLOBAL_PERSON
 (PERSON_ID, name, country, birth_date, phone_number)
 VALUES 
 (1, Ayush, India, 2000-01-01, +918432998332);

 CREATE TABLE GROUPS
 (
 GROUP_ID integer unique,
 GROUP_name varchar(20) not null,
 GROUP_description varchar(40),
 Participants_number integer
 primary key(GROUP_ID)
 ) ;

 CREATE TABLE GLOBAL_ID AS (
 SELECT PERSON_ID as ID FROM GLOBAL_Person 
 UNION ALL
 SELECT GROUP_ID as ID FROM GROUPS;
 )


 CREATE TABLE MESSAGES
 (
 MESSAGE_ID integer unique,
 Tag varchar(1),
 MESSAGE_Sender_ID integer,
 MESSAGE_Reciever_ID integer,
 Message varchar(200),
 primary key(MESSAGE_ID),
 FOREIGN KEY MESSAGE_SENDER REFERENCES GLOBAL_PERSON (PERSON_ID), 
 FOREIGN KEY MESSAGE_Reciever_ID REFERENCES GLOBAL_ID(ID)
 );

 CREATE VIEW GROUP_EXAMPLE AS(
 SELECT G.name as Group_name FROM GROUP G WHERE G.GROUP_ID=,
 SELECT M.Message as Message FROM MESSAGES M WHERE MESSAGE_Reciever_ID=G.GROUP_ID,
 SELECT GP.name as Sender_name FROM GLOBAL_PERSON GP WHERE M.Message_Sender_ID=GP.PERSON_ID)