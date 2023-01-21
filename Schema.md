CREATE TABLE GLOBAL_PERSON
 (
 PERSON_ID integer unique, 
 name varchar(15) not null,
 country varchar(35) default 'NULL',
 city varchar(15) default 'NULL', 
 birth_date date,
 PRIMARY KEY(PERSON_ID)
 ) ;

#for each group there is a different view or table; create view group

 CREATE TABLE GROUPS
 (
 GROUP_ID integer unique,
 GROUP_name varchar(20) not null,
 GROUP_description varchar(40),
 Participants_number integer
 primary key(GROUP_ID)
 ) ;

#Tag is either I/G I=individual, G=group
#Sender ID should be person ID
#Reciever ID is either individual ID or Group ID
 CREATE TABLE ID
 (
 UNIQUE ID integer unique,
 TAG varchar(1),
 
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
  SELECT M.Message, GP.name as Person_name, G.name as Group_name FROM
    MESSAGES M,
LEFT JOIN
GLOBAL_PERSON GP


  SELECT G.GROUP_NAME, G.GROUP,p.pop,f.food,i.income FROM
    GLOBAL_ i
  LEFT JOIN 
    POP p 
  ON
    i.country=p.country
  LEFT JOIN
    Food f
  ON 
    i.country=f.country
  WHERE 
    i.year=p.year
  AND
    i.year=f.year
);
CREATE VIEW GROUP_EXAMPLE AS(
 SELECT G.name as Group_name FROM GROUP G WHERE G.GROUP_ID=,
 SELECT M.Message as Message FROM MESSAGES M WHERE MESSAGE_Reciever_ID=G.GROUP_ID,
 SELECT GP.name as Sender_name FROM GLOBAL_PERSON GP WHERE M.Message_Sender_ID=GP.PERSON_ID)