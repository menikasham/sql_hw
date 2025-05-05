
create table if not exists artist (
id serial primary key,
name varchar(50)
)

create table if not exists genre(
id serial primary key,
name varchar(50)
)

create table if not exists album(
id serial primary key,
name varchar(100),
year date
constraint check_year check (year>1970 and year<getdate())
)

create table if not exists collection(
id serial primary key,
name varchar(50),
year date
constraint check_year check (year>1970 and year<getdate())
)

create table if not exists art_gen(
a_id int,
g_id int,
primary key(a_id, g_id),
foreign key(a_id) references artist(id),
foreign key(g_id) references genre(id)
)

create table if not exists art_album(
alb_id int,
art_id int,
primary key(alb_id, art_id),
foreign key(alb_id) references album(id),
foreign key(art_id) references artist(id)
)

create table if not exists track(
id serial primary key,
name varchar(50),
duration_sec int check (duration_sec between 0 and 6000),
alb_id int,
col_id int,
foreign key(alb_id) references album(id),
foreign key(col_id) references collection(id)
)

create table if not exists col_track(
track_id int,
coll_id int,
primary key(track_id, coll_id),
foreign key(track_id) references track(id),
foreign key(coll_id) references collection(id)
)