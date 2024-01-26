--Задание 4*
--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select al.album_name
from album_list al
left join broker_performers_album bpa on bpa.id_album_list = al.id_album_list
left join performers_list pl on bpa.id_performers_list = pl.id_performers_list 
left join broker_genres_performers bgp on bgp.id_performers_list = pl.id_performers_list 
left join genres_list gl on gl.id_genres_list = bgp.id_genres_list 
group by al.album_name
having count(distinct gl.genre_name) > 1
order by al.album_name;

--Наименования треков, которые не входят в сборники.
select tl.track_name--, cl.collection_name, cl.collection_release_year
from track_list tl 
left join collections_list cl on cl.id_track_list = tl.id_track_list 
where cl.collection_name is null;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, 
-- теоретически таких треков может быть несколько.
select pl.performer_name, duration_track
from performers_list pl
left join broker_performers_album bpa on bpa.id_performers_list = pl.id_performers_list
left join album_list al on bpa.id_album_list = al.id_album_list
left join track_list tl on tl.id_album_list = al.id_album_list
group by pl.performer_name, duration_track
having duration_track = (select min(duration_track) from track_list);

--Названия альбомов, содержащих наименьшее количество треков.
select al.album_name, count(*) 
from album_list al
right join track_list tl on tl.id_album_list = al.id_album_list
group by al.id_album_list
having count(*) = 1;
