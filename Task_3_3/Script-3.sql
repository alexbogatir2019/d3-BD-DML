--Задание 3
--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

--Количество исполнителей в каждом жанре.
select genre_name, count(performer_name)
from genres_list gl
left join broker_genres_performers bgp 	on gl.id_genres_list = bgp.id_genres_list
left join performers_list pl 			on pl.id_performers_list = gl.id_genres_list
group by genre_name
order by count(performer_name) desc;

--Количество треков, вошедших в альбомы 2019–2020 годов.
select track_name, album_release_year
from track_list tl
left join album_list al on al.id_album_list = tl.id_album_list
where album_release_year between '2019' and '2020';

--Средняя продолжительность треков по каждому альбому.
select album_name, avg(duration_track) 
from track_list tl
right join album_list al on al.id_album_list = tl.id_album_list
group by album_name
order by avg(duration_track);

--Все исполнители, которые не выпустили альбомы в 2020 году.
select performer_name--, al.album_release_year 
from performers_list pl
left join broker_performers_album bpa on pl.id_performers_list = bpa.id_performers_list
left join album_list al on bpa.id_album_list = al.id_album_list
where album_release_year != '2020';

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select collection_name, performer_name
from collections_list cl 
left join album_list al on cl.id_album_list = al.id_album_list
left join broker_performers_album bpa on al.id_album_list = bpa.id_album_list
left join performers_list pl on pl.id_performers_list = bpa.id_performers_list
where performer_name = 'REM';

