CREATE TABLE community (
    id SERIAL PRIMARY KEY,
    name varchar(30) UNIQUE NOT NULL,
    type_com varchar(30),
    country varchar(30),
    state varchar(30)
);

CREATE TABLE socialMedia (
    id SERIAL PRIMARY KEY,
    communityName varchar(30) NOT NULL REFERENCES community(name),
    username varchar(30) NOT NULL,
    typeSocialMedia typeSM NOT NULL
);

CREATE TYPE typeSM AS ENUM (
    'Facebook',
    'Twitter',
    'Instagram',
    'Discord',
    'Tiktok',
    'Other'
);

CREATE TABLE member (
    id SERIAL PRIMARY KEY,
    firstName varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    occupation varchar(30) DEFAULT 'student',
    addressID int NOT NULL REFERENCES address(id),
    communityName varchar(30) NOT NULL REFERENCES community(name),
    knew typeSM,
    why TEXT
);

CREATE TABLE address (
    id SERIAL PRIMARY KEY,
    street varchar(30) NOT NULL,
    num varchar(10) NOT NULL,
    subsurb varchar(30) NOT NULL,
    town varchar(30) NOT NULL,
    state varchar(30) NOT NULL
);

CREATE TABLE event (
    id SERIAL PRIMARY KEY,
    name varchar(30),
    objective text NOT NULL,
    dayEvent DATE NOT NULL,
    broadcast typeEvent DEFAULT 'online',
    detailsEvent TEXT,
    communityOrg varchar(30) NOT NULL REFERENCES community(name)
);

CREATE TYPE typeEvent AS ENUM (
    'online',
    'hybrid',
    'faceToface'
);

CREATE TABLE requirement (
    id SERIAL PRIMARY KEY,
    requirement varchar(30),
    eventID int REFERENCES event(id)
);