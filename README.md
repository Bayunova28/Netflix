# Netflix 
<img src="https://github.com/Bayunova28/Netflix/blob/master/cover.jpg" height="450" width="1100">

## Background
<p align="justify">Netflix is an American subscription streaming service and production company based in Los Gatos, California. Founded in 1997 by Reed Hastings and Marc 
Randolph in Scotts Valley, California, it offers a film and television series library through distribution deals as well as its own productions, known as Netflix 
Originals. Netflix can be accessed via web browsers or via application software installed on smart TVs, set-top boxes connected to televisions, tablet computers, 
smartphones, digital media players, Blu-ray players, video game consoles and virtual reality headsets on the list of Netflix-compatible devices and available on 4K 
resolution.</p>

## Requirement
### Titles Table
```mysql
-- Load and import netflix titles table to Power BI Desktop that release year on 2010 until 2020
select *
from 
(
	select row_number() over (partition by MOVIE_ID order by MOVIE_ID asc) as row_num,
		   MOVIE_ID,
		   TITLE,
		   TYPE,
		   try_convert(int, RELEASE_YEAR) as RELEASE_YEAR,
		   AGE_CERTIFICATION,
		   try_convert(int, RUNTIME) as RUNTIME,
		   GENRE,
		   PRODUCTION_COUNTRY,
		   try_convert(int, SEASON) as SEASON,
		   IMDB_ID,
		   try_convert(float, IMDB_SCORE) as IMDB_SCORE,
		   try_convert(float, IMDB_VOTES) as IMDB_VOTES,
		   try_convert(int, TMDB_POPULARITY) as TMDB_POPULARITY,
		   try_convert(float, TMDB_SCORE) as TMDB_SCORE
	from Entertaintment.dbo.Titles
	where RELEASE_YEAR between 2010 and 2020
	      and MOVIE_ID is not null
) as x
where row_num = 1
```
### Credits Table
```mysql
-- Load and import netflix credits table to Power BI Desktop
select *
from 
(
	select row_number() over (partition by PERSON_ID order by PERSON_ID asc) as row_num,
		   PERSON_ID,
		   MOVIE_ID,
		   NAME,
		   ROLE
	from Entertaintment.dbo.Credits
	where ROLE <> '#NAME?'
) as x
where row_num = 1
```

## Dashboard
<img src="https://github.com/Bayunova28/Netflix/blob/master/Dashboard.jpg" height="600" width="1100">

## Data Analysis Expressions (DAX) Calculation
* Total Movie Film
```
Total Movie Film = 
var result = CALCULATE(COUNT(Titles[MOVIE_ID]), Titles[TYPE] = "MOVIE")
return IF(ISBLANK(result), 0, result)
```
* Total Popularity
```
Total Popularity = CALCULATE(SUM(Titles[TMDB_POPULARITY]))
```
* Total Score
```
Total Score = CALCULATE(SUM(Titles[IMDB_SCORE]))
```
* Total Show Film
```
Total Show Film = 
var result = CALCULATE(COUNT(Titles[MOVIE_ID]), Titles[TYPE] = "SHOW")
return IF(ISBLANK(result), 0, result)
```

## Acknowlegement
Original Source : [Netflix TV Shows and Movies](https://www.kaggle.com/datasets/victorsoeiro/netflix-tv-shows-and-movies)
