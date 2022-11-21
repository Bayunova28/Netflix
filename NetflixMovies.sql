-- Load netfix titles table
select *
from Entertaintment.dbo.Titles

-- Fill null values from several columns on netflix titles table
--update Entertaintment.dbo.Titles
--set TITLE = 'Unknown'
--where TITLE is null

--update Entertaintment.dbo.Titles
--set AGE_CERTIFICATION = 'Not Rated'
--where AGE_CERTIFICATION is null

--update Entertaintment.dbo.Titles
--set PRODUCTION_COUNTRY = 'NA'
--where PRODUCTION_COUNTRY is null

--update Entertaintment.dbo.Titles
--set IMDB_SCORE = 0.0
--where IMDB_SCORE is null

--update Entertaintment.dbo.Titles
--set IMDB_VOTES = 0
--where IMDB_VOTES is null

--update Entertaintment.dbo.Titles
--set TMDB_POPULARITY = 0
--where TMDB_POPULARITY is null

--update Entertaintment.dbo.Titles
--set TMDB_SCORE = 0.0
--where TMDB_SCORE is null

-- Looking duplicate value from netflix titles table
--select *
--from 
--(
--	select row_number() over (partition by MOVIE_ID order by MOVIE_ID asc) as row_num,
--	*
--	from Entertaintment.dbo.Titles
--) as x
--where row_num = 1

-- Remove one duplicate value from netflix titles table
--with duplicate_value as
--(
--	select *,
--	row_number() over (partition by MOVIE_ID order by MOVIE_ID asc) as row_num
--	from Entertaintment.dbo.Titles
--	where MOVIE_ID = 'ts271048'
--) 
--delete
--from duplicate_value
--where row_num > 1

-- Load netflix credits table
select *
from Entertaintment.dbo.Credits

-- Looking dupicate value from netflix credits
--select *
--from
--(
--	select row_number() over (partition by PERSON_ID order by PERSON_ID asc) as row_num,
--	*
--	from Entertaintment.dbo.Credits
--) as x
--where row_num > 1

-- Looking film that type is movie order by movie ID
select *
from Entertaintment.dbo.Titles
where TYPE = 'MOVIE'
order by MOVIE_ID

-- Looking film that type is show order by movie ID
select *
from Entertaintment.dbo.Titles
where TYPE = 'SHOW'
order by MOVIE_ID

-- Looking film that production country at US and release on 2000 order by movie ID
select *
from Entertaintment.dbo.Titles	
where PRODUCTION_COUNTRY = 'US'
	  and RELEASE_YEAR = 2000
order by MOVIE_ID

-- Looking imdb score by title and actor that genre is documentation order by average imdb score descending
select t.TITLE,
	   c.NAME as ACTOR,
	   try_convert(float, t.IMDB_SCORE) as IMDB_SCORE
from Entertaintment.dbo.Titles t
	 inner join Entertaintment.dbo.Credits c on t.MOVIE_ID = c.MOVIE_ID
where IMDB_SCORE is not null
	  and GENRE = 'Documentation'
group by TITLE,
	     NAME,
		 IMDB_SCORE
order by IMDB_SCORE desc

-- Looking film that genre is action and production country at japan order by movie ID
select *
from Entertaintment.dbo.Titles
where GENRE = 'Action'
	  and PRODUCTION_COUNTRY = 'JP'
order by MOVIE_ID

-- Looking film that genre is war and season is 1 order by movie ID
select *
from Entertaintment.dbo.Titles
where GENRE = 'War'
      and SEASON = 1
order by MOVIE_ID

-- Looking film that release on 2010 order by movie ID
select *
from Entertaintment.dbo.Titles
where RELEASE_YEAR = 2010
order by MOVIE_ID

-- Looking film that production country at US and genre is romance order by movie ID
select *
from Entertaintment.dbo.Titles
where PRODUCTION_COUNTRY = 'US'
      and GENRE = 'Romance'
order by MOVIE_ID

-- Looking film that age certification is not rated and type is movie order by movie ID
select *
from Entertaintment.dbo.Titles
where AGE_CERTIFICATION = 'Not Rated'
      and TYPE = 'MOVIE'
order by MOVIE_ID

-- Looking film that age certification is TV-MA and release on 2010 until 2015 order by movie ID
select *
from Entertaintment.dbo.Titles
where AGE_CERTIFICATION = 'TV-MA'
	  and RELEASE_YEAR between 2010 and 2015
order by MOVIE_ID

-- Looking film that season is 4 and type is show order by movie ID
select *
from Entertaintment.dbo.Titles
where SEASON = 4
      and TYPE = 'SHOW'
order by MOVIE_ID

-- Looking film that genre is animation and production country at france order by movie ID
select *
from Entertaintment.dbo.Titles
where GENRE = 'Animation'
      and PRODUCTION_COUNTRY = 'FR'
order by MOVIE_ID

-- Looking imdb score by genre and actor that type is movie and production country at egypt order by imdb score descending
select t.GENRE,
	   c.NAME as ACTOR,
	   try_convert(float, t.IMDB_SCORE) as IMDB_SCORE
from Entertaintment.dbo.Titles t
	 inner join Entertaintment.dbo.Credits c on t.MOVIE_ID = c.MOVIE_ID
order by IMDB_SCORE desc

-- Looking film that genre is comedy and production country at canada
select *
from Entertaintment.dbo.Titles
where GENRE = 'Comedy'
      and PRODUCTION_COUNTRY = 'CA'

-- Looking film that age certification is TV-14 on release 2010 until 2020 order by movie ID
select *
from Entertaintment.dbo.Titles
where AGE_CERTIFICATION = 'TV-14'
	  and RELEASE_YEAR between 2010 and 2020
order by MOVIE_ID

-- Looking film that genre is scifi and type is movie order by movie ID
select *
from Entertaintment.dbo.Titles
where GENRE = 'Scifi'
      and TYPE = 'MOVIE'
order by MOVIE_ID

-- Looking film that genre is horror and production country at britania raya
select *
from Entertaintment.dbo.Titles
where GENRE = 'Horror'
	  and PRODUCTION_COUNTRY = 'GB'
