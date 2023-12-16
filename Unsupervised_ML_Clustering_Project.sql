/* Q.What proportion of the dataset consists of movies compared to TV shows?*/
SELECT 
    Type,
    COUNT(*) AS Count,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_data) AS Percentage
FROM 
    netflix_data
GROUP BY 
    Type;
	
/* For TV Shows:Analysis of rating based on the overall TV show rating system:
Q.What is the distribution of different TV show ratings (e.g., TV-MA, TV-14, etc.) in the dataset?*/
SELECT 
    rating, 
    COUNT(*) AS count_of_ratings
FROM 
    netflix_data
WHERE 
    type = 'TV Show' 
GROUP BY 
    rating
ORDER BY 
    count_of_ratings DESC;

/*Q.How does the count of TV show ratings vary across different maturity levels (TV-MA, TV-14, etc.)?*/
SELECT 
    rating,
    COUNT(*) AS count_of_ratings
FROM 
    netflix_data
WHERE 
    type = 'TV Show'
GROUP BY 
    rating
ORDER BY 
    rating;

/*Analysis of the top 10 rated TV shows:
Q.Which are the top 10 highest-rated TV shows based on their respective ratings (TV-MA, TV-14, etc.)?*/
SELECT 
    title,
    rating
FROM 
    netflix_data
WHERE 
    type = 'TV Show' 
ORDER BY 
    CASE 
        WHEN rating = 'TV-MA' THEN 1
        WHEN rating = 'TV-14' THEN 2
       
        ELSE 3
    END,
    title
LIMIT 10;

/*Q.What are the specific ratings and corresponding TV show titles for the top 10 highest-rated TV shows?*/
SELECT 
    title,
    rating
FROM 
    netflix_data
WHERE 
    type = 'TV Show' 
ORDER BY 
    rating DESC, title
LIMIT 10;

/*For Movies:Analysis of rating based on the overall movie rating system:
Q.How are movie ratings distributed across different categories (e.g., TV-MA, TV-14, etc.) compared to TV shows?*/
SELECT 
    type,
    rating,
    COUNT(*) AS count_of_ratings
FROM 
    netflix_data
WHERE 
    type IN ('Movie', 'TV Show') 
GROUP BY 
    type, rating
ORDER BY 
    type, rating;

/*Q.What is the proportion of different movie ratings in contrast to TV show ratings?*/
SELECT 
    type,
    rating,
    COUNT(*) AS count_of_ratings,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY type) AS proportion
FROM 
    netflix_data
WHERE 
    type IN ('Movie', 'TV Show') 
GROUP BY 
	type, rating
ORDER BY 
    type, rating;

/*Analysis of the top 10 rated movies:
Q.Which are the top 10 highest-rated movies based on their respective ratings (TV-MA, TV-14, etc.)?*/
SELECT 
    title,
    rating
FROM 
    netflix_data
WHERE 
    type = 'Movie' 
ORDER BY 
    CASE 
        WHEN rating = 'TV-MA' THEN 1
        WHEN rating = 'TV-14' THEN 2
        
        ELSE 3
    END,
    title
LIMIT 10;

/*Q.What are the specific ratings and corresponding movie titles for the top 10 highest-rated movies?*/
SELECT 
    title,
    rating
FROM 
    netflix_data
WHERE 
    type = 'Movie'
ORDER BY 
    rating DESC, title
LIMIT 10;

/*Q.What are the top 10 most frequently occurring stopwords in the title column of the dataset?*/
SELECT word, COUNT(*) AS word_count
FROM (
    SELECT regexp_split_to_table(lower(title), E'\\s+') AS word
    FROM netflix_data
) words
WHERE length(word) > 1
AND word NOT IN ('the', 'and', 'or', 'is', 'of', 'in', 'a', 'to', 'it', 'as', 'for', 'on', 'with', 'at', 'by', 'an', 'from')
ORDER BY word_count DESC
LIMIT 10;

/*Q.What are the top 10 most frequently occurring stopwords in the discription column column of the dataset?*/
SELECT word, COUNT(*) AS word_count
FROM (
    SELECT regexp_split_to_table(lower(Description), E'\\s+') AS word
    FROM netflix_data
) words
WHERE length(word) > 1
AND word NOT IN ('she','out','the', 'and', 'or', 'is', 'of', 'in', 'a', 'to', 'it', 'as', 'for', 'on', 'with', 'at', 'by', 'an', 'from','this','after','he','who','that','but','into','up','they','when','his','her','whlie','are','their','must')
GROUP BY word
ORDER BY word_count DESC
LIMIT 10;

/*Q.What are the top 10 countries that have the highest number of movies available in the dataset?*/
SELECT country, COUNT(*) AS movie_count
FROM netflix_data
WHERE type = 'Movie' -- Considering only movies
  AND country IS NOT NULL -- Filtering out NULL values in the country column
GROUP BY country
ORDER BY movie_count DESC
LIMIT 10;

/*Q.What are the top 10 countries that have the highest number of TV shows available in the dataset?*/
SELECT country, COUNT(*) AS tv_show_count
FROM netflix_data
WHERE type = 'TV Show' -- Considering only TV shows
  AND country IS NOT NULL -- Filtering out NULL values in the country column
GROUP BY country
ORDER BY tv_show_count DESC
LIMIT 10;

/*Q.What is the distribution or trend analysis of movie and TV show releases over different years available in the dataset?*/
SELECT release_year, type, COUNT(*) AS count_per_year
FROM netflix_data
WHERE release_year IS NOT NULL -- Filtering out NULL values in the release year column
  AND (type = 'Movie' OR type = 'TV Show') -- Considering both movies and TV shows
GROUP BY release_year, type
ORDER BY release_year DESC, type ;

/*What are the top 10 directors who have directed the highest number of TV shows in the dataset?*/
SELECT director, COUNT(*) AS tv_show_count
FROM netflix_data
WHERE type = 'TV Show' -- Considering only TV shows
  AND director IS NOT NULL -- Filtering out NULL values in the director column
GROUP BY director
ORDER BY tv_show_count DESC
LIMIT 10;

/*Q.What are the top 10 directors who have directed the highest number of movies in the dataset?*/
SELECT director, COUNT(*) AS movie_count
FROM netflix_data
WHERE type = 'Movie' -- Considering only movies
  AND director IS NOT NULL -- Filtering out NULL values in the director column
GROUP BY director
ORDER BY movie_count DESC
LIMIT 10;

/*Q.What are the top 10 genres that are most prevalent or commonly found in the Netflix dataset?*/
SELECT listed_in AS genre, COUNT(*) AS genre_count
FROM netflix_data
GROUP BY listed_in
ORDER BY genre_count DESC
LIMIT 10;

/*Q.What are the least frequent or bottom 10 genres found in the Netflix dataset?*/
SELECT listed_in AS genre, COUNT(*) AS genre_count
FROM netflix_data
GROUP BY listed_in
ORDER BY genre_count 
LIMIT 10;




