--Задание 2

--Название и продолжительность самого длительного трека.
SELECT name, duration
FROM tracks t
WHERE duration = (SELECT MAX(duration) FROM tracks);

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT name
FROM tracks t
WHERE duration / 60 >= 3.5;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name
FROM collection c
WHERE EXTRACT (YEAR FROM "year" ) BETWEEN '2018' AND '2021';

--Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM artist a
WHERE length(name) - length(replace(name, ' ', '')) + 1 = 1;


--Название треков, которые содержат слово «мой» или «my».
SELECT name
FROM tracks t
WHERE string_to_array(LOWER(name), ' ') && ARRAY['my'];


--Задание 3

--Количество исполнителей в каждом жанре.
SELECT g.name genre_name, count(a.name) count_of_artist
FROM artist a
JOIN art_gen ag ON a.id = ag.art_id
JOIN genre g ON ag.gen_id = g.id
GROUP BY g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(t.name)
FROM tracks t
JOIN album a ON t.alb_id = a.id
WHERE EXTRACT(YEAR FROM a."year" ) BETWEEN '2019' AND '2021';

--Средняя продолжительность треков по каждому альбому.
SELECT a."name" Name, AVG(t.duration) average_duration
FROM tracks t
JOIN album a ON t.alb_id = a.id
GROUP BY a."name";

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT name
FROM artist
WHERE name not in(SELECT a.name FROM artist a
					JOIN art_album aa ON a.id = aa.art_id
					JOIN album a2 ON aa.alb_id = a2.id
					WHERE EXTRACT (YEAR FROM a2."year") = '2020';
					)


--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.name
FROM collection c
JOIN col_track ct ON c.id = ct.col_id
JOIN tracks t ON ct.track_id = t.id
JOIN album a ON t.alb_id = a.id
JOIN art_album aa ON a.id = aa.alb_id
JOIN artist a2 ON aa.art_id = a2.id
WHERE a2.name = 'Король и шут'
GROUP BY c.name;


--Задание 4

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.name
FROM album a
JOIN art_album aa ON a.id = aa.alb_id
JOIN artist a2 ON aa.art_id = a2.id
JOIN art_gen ag ON a2.id = ag.art_id
GROUP BY a.name, ag.art_id
HAVING count(ag.gen_id) > 1;

--Наименования треков, которые не входят в сборники.
SELECT t.name
FROM tracks t
WHERE t.id NOT IN (SELECT track_id
					FROM col_track
					);

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT a.name
FROM artist a
JOIN art_album aa ON a.id  = aa.art_id
JOIN album a2 ON aa.alb_id = a2.id
JOIN tracks t ON a2.id = t.alb_id
WHERE duration = (SELECT MIN(duration) FROM tracks);

--Названия альбомов, содержащих наименьшее количество треков.
SELECT a.name
FROM album a
JOIN tracks t ON a.id = t.alb_id
GROUP BY a.id
HAVING count(t.id) = (SELECT count(t.id)
						FROM album a
						JOIN tracks t ON a.id = t.alb_id
						GROUP BY a.id
						ORDER BY 1
						LIMIT 1
						);










