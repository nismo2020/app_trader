SELECT *
FROM app_store_apps


SELECT *
FROM play_store_apps

SELECT *
FROM app_store_apps LEFT JOIN play_store_apps
USING(name)
ORDER BY name;

SELECT name, rating, price
FROM app_store_apps
INTERSECT
SELECT name, rating, price
FROM play_store_apps




SELECT  DISTINCT name, price, category
FROM play_store_apps LEFT JOIN app_store_apps
ON (name)
GROUP BY category
ORDER BY name DESC;

SELECT name, price, rating, review_count
FROM app_store_apps
WHERE name IN (SELECT name
		FROM app_store_apps
		INTERSECT
		SELECT name
		FROM play_store_apps)
ORDER BY rating DESC;

SELECT DISTINCT(name), AVG(rating) as avg_rating, SUM(review_count) as total_review, AVG (price::money::numeric) as avg_price
FROM play_store_apps
WHERE name IN (SELECT name
		FROM app_store_apps
		INTERSECT
		SELECT name
		FROM play_store_apps)
GROUP BY name
ORDER BY avg_rating DESC;

SELECT DISTINCT (name), rating, review_count, price, primary_genre
FROM app_store_apps
ORDER BY rating DESC;



SELECT
	'apple' AS name, 



SELECT app_store_apps.name, app_store_apps.rating, app_store_apps.review_count, app_store_apps.price, app_store_apps.primary_genre, play_store_apps.name, play_store_apps.rating,
	play_store_apps.review_count, play_store_apps.price, play_store_apps.category
FROM app_store_apps INNER JOIN play_store_apps
USING (name)
ORDER BY app_store_apps.rating DESC;



SELECT DISTINCT(name), AVG(rating) as avg_rating, SUM(review_count) as total_review, AVG (price::money::numeric) as avg_price
FROM play_store_apps
WHERE name IN (SELECT name
		FROM app_store_apps
		INTERSECT
		SELECT name
		FROM play_store_apps)
GROUP BY name
ORDER BY avg_rating DESC;

SELECT DISTINCT name, rating, price, 


SELECT *
FROM play_store_apps
LIMIT 5;

SELECT (name), rating, install_count, genres
FROM play_store_apps
WHERE install_count IS NOT null
GROUP BY install_count;


SELECT CONVERT(int::install_count)
FROM play_store_apps;


SELECT app_store_apps.price,
		AVG((app_store_apps.rating + play_store_apps.rating)/2) AS avg_rating,COUNT(app_store_apps.name)
FROM app_store_apps
		FULL JOIN play_store_apps
		ON app_store_apps.name = play_store_apps.name
WHERE play_store_apps.name IS NOT NULL
AND app_store_apps.name IS NOT NULL
GROUP BY app_store_apps.price
ORDER BY app_store_apps.price DESC;




SELECT name, category, rating, install_count, genres
FROM play_store_apps
GROUP BY install_count;


SELECT 'app_store' as platform,
primary_genre, COUNT(*), CAST(AVG(price) as money) as avg_price, ROUND(AVG(rating),2) as avg_rating
FROM app_store_apps
GROUP BY primary_genre
UNION ALL
SELECT 'play_store' as platform,
category, COUNT(*), cast(avg(CAST((CAST(price as money)) as numeric)) as money) as avg_price, ROUND(AVG(rating),2) as avg_rating
FROM play_store_apps
GROUP BY category
ORDER BY count desc;

SELECT play_store_apps.name, play_store_apps.rating,
	play_store_apps.review_count, play_store_apps.price, play_store_apps.category
FROM play_store_apps

