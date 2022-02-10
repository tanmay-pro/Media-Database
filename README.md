# IMDB

## About the Project

* There are two parts to this project
** Creating the database and defining all tables, and loading it with relevant data - MySQL CLI
** Performing queries on the database: at least 5 queries & 3 updates (all functional requirements to be satisfied too) -  Create a Python script that can connect to the database using MySQL. 

## List of all commands

* insert_media(): Insert data about a new media
* insert_crew(): Insert data about new crew (actors, directors, and other professionals)
* give_award(): Insert new accolades presented to staff or media
* insert_ott(): Insert data about a new OTT platform
* delete_ott(): Delete exiting OTT Platform from OTT Table
* remove_review(): Remove certain comments 
* remove_user(): Remove data of a user from the database if required
* update_crew_data(): Update crew bio tuple
* insert_moview_ott(): Add OTT platform on which a particular movie can be played
* delete_movie_ott(): Delete OTT platform on which a particular movie can be played
* logout(): Logout and change user if required 
* insert_new_user(): Insert user data on new registration
* insert_movie_in_watchlist(): Insert new movie in user watchlist
* insert_review(): Insert a review and rating of existing media in the database
* insert_fav_genre(): Insert a new favourite genre of a user (When a user likes a new genre)
* delete_user(): Remove data of the own user from the database if required
* delete_media_from_watchlist(): Remove movie from user watchlist
* retrieve_top_films(): Retrieve complete data tuples of films that have grossed more than x million USD
* retrieve_film_on_duration(): Retrieve complete data tuples of movies that have a duration of fewer than x minutes
* retrieve_show_on_episodes(): Retrieve complete data tuples of shows with less than x number of episodes
* retrieve_crew(): Get name and Bio of a Crew
* retrieve_media(): Get name, description, language, and Is_Adult of a media
* media_with_highest_rating(): Search media with the highest average rating.
* search_with_media(): Search media names based on partial text match.
* search_for_crew(): Search crew names based on partial text match.
* search_for_award_giving_organization(): Search for a particular award-giving organization.
* high_rated_crew_works(): Given a crew like an actor or a director, find how many movies they have worked on having a rating greater than a particular threshold value
* remove_genre(): Remove a previously favourite genre of a user 
