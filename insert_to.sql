INSERT INTO
	artist (name)
VALUES
	('Король и шут'),
	('RadioTapok'),
	('DVJ Bazooka'),
	('Nightwish');

INSERT INTO
	genre(name)
VALUES
	('rock'),
	('metal'),
	('rap'),
	('opera');

INSERT INTO
	album(name, year)
VALUES
	('Камнем по голове', '2019-02-02'),
	('Рога и копыта', '2018-01-04'),
	('Вася вышел погулять', '2020-12-15'),
	('Маша не даст...', '2019-05-06');

INSERT INTO
	tracks (name, duration, alb_id)
VALUES
	('Sigma Boy',650, 1),
	('Маша решила',200, 2),
	('А Вася побежал', 421, 1),
	('My Qwerty', 120, 3),
	('Фыва Олдж', 541, 3),
	('Питон на приоре', 400, 4),
	('my own', 277, 2),
	('own my', 41, 3),
	('my', 560, 4),
	('oh my god', 75, 3),
	('myself', 65, 2),
	('by myself', 32, 2),
	('bemy self', 65, 3),
	('myself by', 654, 4),
	('by myself by', 321, 1),
	('beemy', 987, 1),
	('premyne', 321, 2);


INSERT INTO
	collection(name, year)
VALUES
	('Что-то с чем-то', '2018-06-06'),
	('Super Puper MIX', '2020-12-12'),
	('MEGAMIX', '2019-09-18'),
	('Для твоей клевой тачки', '2020-11-11');

INSERT INTO
	art_gen  (art_id, gen_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 1),
	(4, 4)
	(1, 4)
	(3, 2);

INSERT INTO
	art_album (alb_id, art_id)
VALUES
	(1, 1),
	(2, 3),
	(3, 2),
	(4, 1),
	(4, 2);

INSERT INTO
	col_track (track_id, col_id)
VALUES
	(2, 1),
	(3, 2),
	(3 ,3),
	(4, 2),
	(1, 2);
