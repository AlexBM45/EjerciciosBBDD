CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    firstname varchar(30) NOT NULL,
    lastname varchar(30) NOT NULL,
    email varchar(50) NOT NULL UNIQUE,
    curp varchar(30) NOT NULL UNIQUE,
    birth varchar(30) NOT NULL,
    addressID int REFERENCES address(id)
);

CREATE TABLE address (
    id SERIAL PRIMARY KEY,
    street varchar(30) NOT NULL,
    number varchar(30) NOT NULL,
    subsurb varchar(30) NOT NULL,
    town varchar(30) NOT NULL,
    state varchar(30) NOT NULL
);

CREATE TABLE inscription (
    id SERIAL PRIMARY KEY,
    grade int NOT NULL,
    dateIns TIMESTAMP,
    instBy int REFERENCES employee(id),
    studentID int REFERENCES student(id)
);

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    firstname varchar(30) NOT NULL,
    lastname varchar(30) NOT NULL,
    email varchar(30) NOT NULL UNIQUE,
    position varchar(30) NOT NULL,
    addressID int REFERENCES address(id)
);

CREATE TABLE subject (
    id SERIAL PRIMARY KEY,
    name varchar(30) NOT NULL,
    hrs int NOT NULL,
    minScore int NOT NULL,
    teacherID int REFERENCES employee(id)
);