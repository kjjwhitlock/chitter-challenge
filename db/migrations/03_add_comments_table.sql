CREATE TABLE comments (id SERIAL PRIMARY KEY, comment VARCHAR(240), peep_id INTEGER REFERENCES peeps (id));
