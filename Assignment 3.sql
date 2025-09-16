CREATE DATABASE ASSIGNMENT3
USE ASSIGNMENT3
SELECT * FROM Jomato2 

1. Create a stored procedure to display the restaurant name, type and cuisine where the
table booking is not zero.
CREATE PROCEDURE Getrestaurantstoreddetail
AS
BEGIN
    SELECT 
        restaurantname,
        restauranttype,
        CuisinesType 
    FROM 
        Jomato2 
    WHERE 
        TableBooking > 0;
END
EXEC Getrestaurantstoreddetail 

2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
and rollback it.
BEGIN TRANSACTION

UPDATE Jomato2 
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe'
SELECT * FROM Jomato2
ROLLBACK TRANSACTION

3. Generate a row number column and find the top 5 areas with the highest rating of
restaurants.
WITH Rated_Restaurants AS (
    SELECT 
        area,
        restaurantname,
        rating,
        ROW_NUMBER() OVER (PARTITION BY area ORDER BY rating DESC) AS row_num
    FROM 
        Jomato2
)
SELECT 
    area,
    restaurantname,
    rating
FROM 
    Rated_Restaurants
WHERE 
    row_num <= 5
4. Use the while loop to display the 1 to 50.

DECLARE @counter INT
SET @counter = 1

WHILE @counter <= 50
BEGIN
    PRINT @counter
    SET @counter = @counter + 1
END

5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
restaurants.

CREATE VIEW TopRating AS
WITH HigestRatedRestaurant AS (
    SELECT 
        restaurantname,
        area,
        rating,
        ROW_NUMBER() OVER (ORDER BY rating DESC) AS row_num
    FROM 
        Jomato2
)
SELECT 
    restaurantname,
    area,
    rating
FROM 
    HigestRatedRestaurant
WHERE 
    row_num <= 5
	select * from TopRating
6. Create a trigger that give an message whenever a new record is inserted.CREATE TRIGGER NewRecord
ON jomato2
AFTER INSERT
AS
BEGIN
    DECLARE @Message NVARCHAR(100)
    PRINT @Message
ENDSELECT * FROM Jomato2 