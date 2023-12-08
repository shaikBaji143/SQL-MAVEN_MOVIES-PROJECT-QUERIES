use mavenmovies;

/*1.Write a SQL query to count the number of characters except for the spaces 
for each actor. Return the first 10 actors' name lengths along with their names.
*/
SELECT CONCAT(FIRST_NAME,'',LAST_NAME) AS 
FULLNAME,LENGTH(CONCAT(FIRST_NAME,' ',LAST_NAME)) AS 
LENGTH_OF_FULLNAME 
FROM ACTOR LIMIT 10;

/*2.List all Oscar awardees(Actors who received the Oscar award) with their full 
names and the length of their names.*/
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 
FULL_NAME,LENGTH(CONCAT(FIRST_NAME,'',LAST_NAME)) AS 
FULL_NAME_LENGTH,AWARDS FROM ACTOR_AWARD
WHERE AWARDS LIKE '%OSCAR%';

/*3.Find the actors who have acted in the film ‘Frost Head.’*/
SELECT a.FIRST_NAME,a.LAST_NAME,c.TITLE FROM ACTOR a INNER JOIN 
FILM_ACTOR b
ON b.ACTOR_ID=a.ACTOR_ID INNER JOIN FILM c 
ON c.FILM_ID=b.FILM_ID WHERE c.TITLE LIKE '%FROST HEAD%';

/*4.Pull all the films acted by the actor ‘Will Wilson.’*/
SELECT c.TITLE,CONCAT(b.FIRST_NAME,SPACE(1),b.LAST_NAME) AS FULLNAME 
FROM FILM_ACTOR a INNER JOIN ACTOR b
ON b.ACTOR_ID=a.ACTOR_ID INNER JOIN FILM c
ON c.FILM_ID=a.FILM_ID WHERE b.FIRST_NAME='WILL' AND 
b.LAST_NAME='WILSON';

/*5.Pull all the films which were rented and return them in the month of May.*/
SELECT c.TITLE,RETURN_DATE FROM RENTAL a INNER JOIN INVENTORY b
ON b.INVENTORY_ID=a.INVENTORY_ID INNER JOIN FILM c
ON c.FILM_ID=b.FILM_ID WHERE MONTH(RETURN_DATE)=5;

/*6.Pull all the films with ‘Comedy’ category.*/

SELECT c.TITLE,a.NAME FROM CATEGORY a INNER JOIN FILM_CATEGORY b
ON b.CATEGORY_ID=a.CATEGORY_ID INNER JOIN FILM c 
ON c.FILM_ID=b.FILM_ID WHERE a.NAME='Comedy';
