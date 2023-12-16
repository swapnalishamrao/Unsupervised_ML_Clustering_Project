# Netflix Movies and Tv Shows Clustering
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The Netflix Movies and TV Shows Clustering Project aims to cluster similar movies and TV shows available on Netflix into different clusters based on their content. The project uses unsupervised learning and Natural Language Processing (NLP) techniques to analyze the dataset, including K-Means, Hierarchical clustering.

# Problem Statement
"Analyzing what's on Netflix is crucial for improving how we recommend stuff to users. We want to check if there are more TV shows than movies lately, so we can suggest what people like more effectively. Our main objectives are to understand the variety of TV shows and movies available on Netflix and to determine if there has been a shift towards offering more TV shows than movies in recent years.Using data ensures users get content they like, making Netflix more enjoyable and satisfying. To stay effective in a changing streaming world, we must update strategies and listen to user feedback regularly"

# Dataset
 This dataset consists of tv shows and movies available on Netflix as of 2019.
 
 Attribute Information :
 
- show_id : Unique ID for every Movie / Tv Show
  
- type : Identifier - A Movie or TV Show
  
- title : Title of the Movie / Tv Show
  
- director : Director of the Movie / TV Show
  
- cast : Actors involved
  
- country : Country of production
  
- date_added : Date it was added on Netflix
  
- release_year : Actual Release year of the movie / TV show
  
- rating : TV Rating of the movie / TV show
  
- duration : Total Duration in minutes or number of seasons
  
- listed_in : Geners
  
- description : The Summary description

  # Data Cleaning and Data Preprocessing
 [1] Handling Duplicate Values :
 - Dataset having no duplicated values.
 [2] Handling Null / Missing Values :
 - Since there are many null values for features like director, cast, and country, those null values cannot be dropped; 
 instead, they have been substituted with director Unavailable, Cast Unavailability, and Country Unavailable, accordingly.
 - Features such as date_added and rating have a very low number of null values, so we dropped those null values.
 [3] Handling Outliers :
 - Outliers from variable release_year are successfully treated using the interquartile range.
 [4] Feature Engineering :
 - Converted feature date_added to datetime and created new features from it, such as year_added,
 month_added, and day_added, before removing the feature date_added. 
 - The listed_in feature has been renamed to geners.
 - Because year cannot be a float, the feature release_year data type changed from float64 to int64.
 [5] Textual Data Preprocessing :
 - We processed text data from the description variable by removing punctuation, stopwords, whitespace, emails, html tags, urls, special characters, and digits.
 - Text vectorized after lemmanization and got a TFIDF matrix using TfidfVectorizer for feeding to the model as input.

# Exploratory Data Analysis
These following graphs and plots were primarily created using Matplotlib and the Seaborn package.
 - Bar plot, count plot, pair plot, dist plot, box plot, pie plot, and heatmap
   
 * Performed EDA and reached the following conclusions:
 - More movies (69.14%) than TV shows (30.86%) are available on Netflix.
 - The majority of Netflix movies were released between 2015 and 2020, and the majority of Netflix TV shows were released between 2018 and 2020.
 - The most movies and TV shows were released for public viewing on Netflix in 2017 and 2020, respectively, out of all released years.
 - From 2006 to 2019 Netflix is constantly releasing more new movies than TV shows, but in 2020, it released more TV shows than new movies,
 indicating that Netflix has been increasingly focusing on TV rather than movies in recent years.
 - More TV shows will be released for public viewing in 2020 and 2021 than at any other time in the history of Netflix.
 - The majority of TV shows and movies available on Netflix have a TV-MA rating, with a TV-14 rating coming in second.
 - The majority of movies added to Netflix in 2019 and the majority of TV shows added to - Netflix in 2020.
 - In 2019, Netflix added nearly one-fourth (27.71%) of all content (TV shows and movies).
 - The majority of the content added to Netflix was in October and January, respectively,
 but almost all months throughout the year saw Netflix adding content to its platform.
 - Netflix has more movies (69.14%) than TV shows (30.86%).
 - The majority of movies available on Netflix are produced in the United States, with India coming in second.
 - The United States and the United Kingdom are the two countries that produced the most of the TV shows that are available on Netflix.
 - Raul Campos and Jan Suter directed most of the movies available on Netflix for public viewing.
 - Alastair Fothergill directed most of the TV shows available on Netflix for public viewing.
 - International movies and the second-most popular dramas are available on Netflix as content.
 - Actors who have appeared in films and TV shows that are most available on Netflix are Lee, Michel, David, Jhon, and James.
 - We see that the movie or TV show release year and day of the month on movies or TV shows added to Netflix are slightly correlated with each other.
 - Based on the plot of release_year and year_added, we can conclude that Netflix is increasingly adding and releasing movies and TV shows over time.
 - We can conclude from plot release_year and month_added that Netflix releases movies and TV shows throughout the all months of the year.

# Model Building 
 We implemented the following unsupervised machine learning models:
 - K-Means Clustering
 - Hierarchical Clustering
 - DBSCAN Clustering
   
# Models Evaluation
- Model K-Means Clustering has a silhouette_score of 0.005493,
 which is close to 1 compared to models Hierarchical Clustering (-0.0003893) and DBSCAN Clustering (-0.298227).
 - Model K-Means Clustering has the highest calinski_harabasz_score of 33.5736 compared
 to models Hierarchical Clustering (17.5023) and DBSCAN Clustering (9.12759).
 - Models Hierarchical Clustering (9.61207) and DBSCAN Clustering (1.182146) have lower davies bouldin scores
 than model K-Means Clustering, which has the maximum score of 10.1594.
 - Among all models, the K-Means Clustering model has the highest Calinski-Harabasz score (33.5736). Also, K-Means Clustering  model
 has a silhouette_score of 0.005495, which is close to 1 than other models, which means the
 K-Means Clustering model is capable of perfectly clustering items.
 - Due to its high Calinski-Harabasz score (33.5736) and silhouette_score (0.005495), which are close to 1,
 the K-Means Clustering model is the ideal model and well-trained for clustering movies and TV shows
 based on the content.

# Conclusion
 - The K-Means Clustering model has the highest Calinski-Harabasz score out of all the models (33.5736). Also, the silhouette score for the K-Means Clustering model is(0.005495),
 which is close to one compared to other models, indicating that it can cluster Movies and TV shows perfectly based on the content.
 - The K-Means Clustering model is the optimal model and well-trained for clustering TV shows and movies based on the content due to its high
 Calinski-Harabasz score (33.5736) and silhouette score (0.005495) , which are close to 1 than other builded models.

