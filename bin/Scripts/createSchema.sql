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
	(id int default NEXTVAL('tikcet_seq') primary key,
	 userId int not NULL references users(ID),
     eventId int not NULL references "event"(ID),
     barCode int not NULL,
     price int default 0);
   
   
   
--Inserts
INSERT INTO public.users(
	 name, password, type)
	VALUES ('Sava', 'ch@ng3m3', 'admin');
 INSERT INTO public.users(
	 name, password, type)
	VALUES ('Salajan', 'ch@ng3m3', 'normal');
 INSERT INTO public.users(
	 name, password, type)
	VALUES ('Bogdan', 'ch@ng3m3', 'admin');
INSERT INTO public.users(
	 name, password, type)
	VALUES ('Petra', 'ch@ng3m3', 'admin');
INSERT INTO public.users(
	 name, password, type)
	VALUES ('Gabriel', 'ch@ng3m3', 'admin');
INSERT INTO public.users(
	 name, password, type)
	VALUES ('Gellert', 'ch@ng3m3', 'admin');
    
INSERT INTO public.category(type)
	VALUES 
    ('THEATRE'),
    ('MUSIC'),
    ('DANCE');
    
INSERT INTO public.artist(name)
	VALUES ('Franz Ferdinand');
INSERT INTO public.artist(name)
	VALUES ('Ricky Martin');
INSERT INTO public.artist(name)
	VALUES ('David Guetta');
    
INSERT INTO "event"("name","location","startDate","endDate","image","category_id") VALUES('testName1','testLoc1','2017-08-01 13:15:00 EET','2017-08-01 15:15:00 EET',null,1);
INSERT INTO "event"("name","location","startDate","endDate","image","category_id") VALUES('testName2','testLoc2','2016-08-01 13:15:00 EET','2016-08-01 15:15:00 EET',null,2);
INSERT INTO "event"("name","location","startDate","endDate","image","category_id") VALUES('testName3','testLoc3','2015-08-01 13:15:00 EET','2015-08-01 15:15:00 EET',null,3);
    
insert into ticket(userId,eventId,barCode,price) values(1,1,78124646,20.0);
insert into ticket(userId,eventId,barCode,price) values(2,2,78178299,40.0);
insert into ticket(userId,eventId,barCode,price) values(2,2,78178299,47.0);
   
INSERT INTO public.event_artist(eventid, artistid)
VALUES (1,1), (2,2)

