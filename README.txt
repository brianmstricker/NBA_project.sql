Title: NBA Postgres Project

Description: This is a Postgres database of the NBA. It includes 6 columns and several entries of data for each column.

API Reference: The API I decided to work on was for the players table, where you are able to see all the entries of players, obtain a single entry, and create and delete an entry. 

1. My project had multiple changes throughout this course. At the very beginning my understanding of the many-to-one and many-to-many relationships was a bit wrong, so I initially made mistakes when creating my ERD. At around week 2/3 my understanding got a lot better so I was able to fix those mistakes. On top of that, I decided to make a players_teams bridge table to include if the player had been on an all-star team, and it was also difficult to think of another many-to-many relationship in the NBA.

2. I chose the ORM approach for designing the database in flask as it seems to be more practical, and it makes more sense to me. I attempted the raw SQL approach and was able to get the first two API methods to work (showing all/one player), however I couldn't figure out how to create and delete a player using raw SQL, so I switched back to the ORM method.

3. I don't really plan to continue to use this database, as there are already stats for the NBA, so this doesn't really make much sense to continue to use. If I was going to continue updating it, then ideally I would enter in more data and try to update entries several times throughout the season. Also, adding an API for each table would be handy, and figuring out a faster way to input data would be useful, as it was very tedious. The otehr thing that I couldn't get to work in my API was a search by last name, which seemed to be comparing the last name to the player id, and I as unable to get it to compare it to last name.   