--Задание 2
--Название и продолжительность самого длительного трека.
select track_list.track_name, track_list.duration_track
from track_list
where track_list.duration_track = (select max(duration_track) from track_list);

--Название треков, продолжительность которых не менее 3,5 минут.
select track_list.track_name, track_list.duration_track
from track_list
where track_list.duration_track > '03:30:00';

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select collection_name
from collections_list
where collection_release_year between '2018' and '2020';

--Исполнители, чьё имя состоит из одного слова.
select performer_name
from performers_list
where performer_name not LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».
select track_name
from track_list
where track_name LIKE '%мой%' or track_name like '%My%' or track_name like '%my%';
