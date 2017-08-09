
--REFRESH
--tables
DROP table ticket;
DROP TABLE event_artist;
DROP TABLE if exists "event";
DROP TABLE artist;
DROP table category;
DROP TABLE users;

--sequences
drop sequence ticket_seq;
drop sequence if exists event_seq;
drop sequence if exists artist_seq;
DROP SEQUENCE if exists category_seq;
drop sequence if exists user_seq;


--Create
--sequences
create sequence user_seq start 1;
CREATE SEQUENCE category_seq START 1;
create sequence artist_seq start 1;
CREATE SEQUENCE event_seq START 1;
create sequence ticket_seq START 1;



--tables
CREATE TABLE users(
    id Integer Primary KEY default nextval('user_seq'),
    name varchar(250) NOT NULL,
    password varchar(250) NOT NULL,
    type varchar(10) NOT NULL
);

CREATE TABLE category (
   id   INTEGER DEFAULT NEXTVAL('category_seq')    PRIMARY KEY,   --not null & unique
   type   VARCHAR(100) NOT NULL);   --type of event
   
CREATE TABLE artist(
	id Integer PRIMARY KEY default nextval('artist_seq'),
    name VARCHAR(1000) NOT NULL
);

CREATE TABLE "event" (
  "id" int PRIMARY KEY DEFAULT NEXTVAL('event_seq'),
  "name" VARCHAR(250) DEFAULT NULL,
  "location" VARCHAR(250) DEFAULT NULL,
  "startDate" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'EET'),
  "endDate" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'EET'), 
  "image" bytea,
  "category_id" int NOT NULL 
);
ALTER TABLE "event" ADD CONSTRAINT categoryForeignKey FOREIGN KEY(category_id) REFERENCES category(id);

CREATE TABLE event_artist(
eventid Integer NOT NULL,
artistid Integer NOT NULL,
PRIMARY KEY(eventid, artistid),
FOREIGN KEY (eventid) REFERENCES event (id),
FOREIGN KEY (artistid) REFERENCES artist (id));

create table ticket
	(id int default NEXTVAL('ticket_seq') primary key,
	 userId int not NULL references users(ID),
     eventId int not NULL references "event"(ID),
     barCode bigint not NULL,
     price FLOAT default 0);

