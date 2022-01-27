create table Singers (
     ID int Identity(1,1) Primary Key,
     SingerName nvarchar (100),
	 SingerSurname nvarchar(100),
	 Birthday DateTime,
	 PhotoUrl nvarchar(500)
)

create table Genres (
     ID int Identity(1,1) Primary Key,
	 GenreName nvarchar(250)
)

create table Songs(
     ID int Identity(1,1) Primary Key,
	 SongName nvarchar(100),
	 LaunchDate DateTime,
	 Duration int 
)


create table SingerToSong(
     ID int Identity(1,1) Primary Key, 
	 SingerID int FOREIGN KEY REFERENCES Singers(ID),
	 SongID int FOREIGN KEY REFERENCES Songs(ID)
)

create table SongToGenre(
      ID int Identity(1,1) Primary Key,
	  SongID int FOREIGN KEY REFERENCES Songs(ID),
	  GenreID int FOREIGN KEY REFERENCES Genres(ID)
)


create table Countries(
      ID int Identity(1,1) Primary Key,
	  CountryName nvarchar(200)
)


create table Users(
     ID int Identity(1,1) primary key,
	 UserName nvarchar(100),
	 UserSurname nvarchar(100),
	 Birthday DateTime,
	 Email nvarchar(100),
	 CountryID int Foreign key references Countries(ID)
)


create table SongList(
    ID int Identity(1,1) primary key,
	UserID int foreign key references Users(ID),
	SongID int foreign key references Songs(ID),
	SongDate DateTime
)

create table LikedList(
    ID int Identity(1,1) primary key,
	UserID int foreign key references Users(ID),
	SongID int foreign key references Songs(ID)
)


insert into Singers (SingerName,SingerSurname,Birthday,PhotoUrl)
values 
('Röya',N'Ayxan','06.14.1982','sekil2.jpg'),
('Elza',N'Seyidcahan','07.07.1968','sekil3.jpg')


insert into Genres (GenreName)
values 
('Rap'),('Caz'),('Pop'),('Hip-hop')

insert into Songs (SongName,Duration,LaunchDate)
values (N'Zəng elə',120,'01.01.2021'),
(N'Karma',180,'05.05.2021'),
(N'Kəpənəklər',120,'07.07.2021'),
(N'Bu gecə',180,'08.08.2021'),
(N'Ulduz nağılı',180,'09.09.2021'),
(N'Dostumsan yoxsa sevgilim',180,'10.01.2021'),
(N'Gözəllik',180,'01.01.2021')


insert into SingerToSong (SingerID,SongID)
values (2,1),(2,2),(2,3),(4,4),(3,5),(3,6),(4,7)

insert into SongToGenre (SongID,GenreID)
values (1,1),(2,2),(3,3),(4,3),(5,3),(6,3),(7,3)

insert into Countries (CountryName)
values 
('Azerbaycan'),('Turkiye'),('Rusiya'),('Italya')

insert into Users ( UserName,UserSurname,Birthday,Email,CountryID)
values
('Ulker',N'Rüstəmova','08.08.2001','ulkerustmli@gmail.com', (2)),
('Gunel',N'Ibrahimova','04.04.2001','gunelibrh@gmail.com', (3)),
('Yunus',N'Rüstəmli','01.02.2014','yunusrustmli@gmail.com', (4))



insert into SongList (UserID,SongID,SongDate)
values 
(1,2,'01.01.2022'),
(8,1,'02.02.2021'),
(9,3,'03.03.2021'),
(10,4,'04.04.2021'),
(1,5,'05.05.2021'),
(8,6,'06.06.2022'),
(9,7,'07.07.2022')


insert into LikedList (UserID,SongID)
values (1,1),(8,2),(9,3),(10,3),(1,4),(8,5),(9,6),(10,7)



select Singers.SingerName, Singers.SingerSurname, Songs.SongName, Songs.Duration, Songs.LaunchDate
from SingerToSong
inner join Singers on SingerID = Singers.ID
inner join Songs on SongID = Songs.ID

	
create view [MySongList] as
select Singers.SingerName, Singers.SingerSurname, Songs.SongName, Songs.Duration, Songs.LaunchDate
from SingerToSong
inner join Singers on SingerID = Singers.ID
inner join Songs on SongID = Songs.ID


select * from [MySongList]


select Songs.SongName
from SingerToSong
inner join Songs on SongID = Songs.ID


create view [Song] as
select Songs.SongName
from SingerToSong
inner join Songs on SongID = Songs.ID

select * from [Song]