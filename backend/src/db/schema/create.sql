DROP TABLE IF EXISTS available_interviewers CASCADE;
DROP TABLE IF EXISTS interviews CASCADE;
DROP TABLE IF EXISTS interviewers CASCADE;
DROP TABLE IF EXISTS days CASCADE;

CREATE TABLE days (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE interviewers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  avatar VARCHAR(255) NOT NULL
);

CREATE TABLE interviews (
  id SERIAL PRIMARY KEY NOT NULL,
  student VARCHAR(255) NOT NULL,
  interviewer_id INTEGER REFERENCES interviewers(id) ON DELETE CASCADE,
  appointment_id INTEGER UNIQUE REFERENCES appointments(id) ON DELETE CASCADE
);

CREATE TABLE available_interviewers (
  id SERIAL PRIMARY KEY NOT NULL,
  day_id INTEGER REFERENCES days(id) ON DELETE CASCADE,
  interviewer_id INTEGER REFERENCES interviewers(id) ON DELETE CASCADE
);