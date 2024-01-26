--music_service
--add genres
insert into genres_list (genre_name)
values ('Chanson'), ('Rock'), ('Jazz');

-- add performers
insert into performers_list (performer_name)
values ('Mikhail Krug'),
('Mikhail Shufutinsky'),
('R.E.M.'),
('Nirvana'),
('Oscar Peterson'),
('Art Tatum');

-- add album
insert into public.album_list (id_album_list,album_name,album_release_year)
values (1, 'Out of Time', '1991'),
(2, 'Automatic for the People', '1992'),
(3, 'Жиган-лимон', '1993'),
(4, 'Город детства', '1994');

-- add track
insert into public.track_list (track_name,duration_track,id_album_list)
values ('Losing My Religion', '4:26:00', 1),
('Man on the Moon', '5:13:00', 2),
('Кольщик', '04:47:00', 3), 
('Светочка', '04:25:00', 4),
('I Wont Dance', '2:32:00', 4), 
('Its Wonderful', '3:02:00', 3);

-- add collections
insert into public.collections_list (collection_name,collection_release_year,id_track_list,id_album_list)
values ('Лирика', '1986', 6, 3),
('Lifes Rich Pageant', '1986', 1, 1),
('New Adventures in Hi-Fi', '1996', 2, 2),
('Всё идет по плану', '1988', 3, 4);

-- broker
insert into broker_genres_performers (id_performers_list, id_genres_list)
values (1,1), (2,1), (3,2), (4,2), (5,3), (6,3);

insert into broker_performers_album (id_album_list,id_performers_list)
values (1,3), (2,6), (3,1), (4,5);

insert into broker_album_track (id_album_list,id_track_list)
values (1,1), (2,2), (3,3), (4,4), (1,5), (2,6);
