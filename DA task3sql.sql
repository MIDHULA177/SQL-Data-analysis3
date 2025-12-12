create database mydata1;
use mydata1;
show tables;
desc cereal;
SELECT * FROM cereal;

SELECT * FROM cereal LIMIT 20;
SELECT DISTINCT mfr FROM cereal;
SELECT name, calories
FROM cereal
WHERE calories > 100;

-- sorting and aggregation
SELECT name, rating
FROM cereal
ORDER BY rating DESC
LIMIT 10;

SELECT type, AVG(calories) AS avg_calories
FROM cereal
GROUP BY type;

SELECT mfr, AVG(rating) AS avg_rating
FROM cereal
GROUP BY mfr
ORDER BY avg_rating DESC;

-- 7 
SELECT name, rating
FROM cereal
WHERE rating > (SELECT AVG(rating) FROM cereal);
 
SELECT name, sugars
FROM cereal c
WHERE sugars > (
    SELECT AVG(sugars)
    FROM cereal
    WHERE mfr = c.mfr
);

CREATE VIEW cereal_summary AS
SELECT
    name,
    calories,
    protein,
    fat,
    fiber,
    sugars,
    rating
FROM cereal;

SELECT * FROM cereal_summary LIMIT 10;

CREATE INDEX idx_mfr ON cereal(mfr(5));
ALTER TABLE cereal MODIFY mfr VARCHAR(5);



