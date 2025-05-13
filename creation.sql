CREATE TABLE IF NOT EXISTS artist(
id serial primary KEY,
name varchar(50)
);


CREATE TABLE IF NOT EXISTS genre(
id serial primary KEY,
name varchar(50)
);

CREATE TABLE IF NOT EXISTS album(
id serial primary KEY,
name varchar(50),
YEAR date
CONSTRAINT check_year CHECK (YEAR >= '1970-01-01')
);

CREATE TABLE IF NOT EXISTS collection(
id serial primary KEY,
name varchar(50),
YEAR date
CONSTRAINT check_year CHECK (YEAR >= '1970-01-01')
);

CREATE TABLE IF NOT EXISTS art_gen(
art_id int,
gen_id int,
PRIMARY KEY (art_id, gen_id),
FOREIGN KEY (art_id) REFERENCES artist(id),
FOREIGN KEY (gen_id) REFERENCES genre(id)
);

CREATE TABLE IF NOT EXISTS art_album(
alb_id int,
art_id int,
PRIMARY KEY (alb_id, art_id),
FOREIGN KEY (alb_id) REFERENCES album(id),
FOREIGN KEY (art_id) REFERENCES artist(id)
);

CREATE TABLE IF NOT EXISTS tracks(
id serial primary KEY,
name varchar(50),
duration int,
alb_id int,
FOREIGN KEY (alb_id) REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS col_track(
track_id int,
col_id int,
PRIMARY KEY (track_id, col_id),
FOREIGN KEY (track_id) REFERENCES tracks(id),
FOREIGN KEY (col_id) REFERENCES album(id)
);