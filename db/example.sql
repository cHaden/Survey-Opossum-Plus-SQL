SELECT *
FROM authors
WHERE id = 100 OR email="verda.nolan@bernhardhuel.biz";

------

SELECT *
FROM authors, surveys
WHERE authors.id = surveys.author
ORDER BY authors.id;

------

SELECT *
FROM authors JOIN surveys ON authors.id = surveys.author_id
ORDER BY authors.id

------

SELECT *
FROM authors AS a JOIN surveys AS s ON a.id = s.author_id
ORDER BY a.id

------

SELECT *
FROM authors AS a JOIN authors AS s ON a.id = s.author_id
ORDER BY a.id

------

SELECT question_text
FROM questions
WHERE question_type = "Choice";

------

SELECT *
FROM question
ORDER BY created_at DESC
LIMIT 1
OFFSET 60;

-- DESC is descending order
-- ASC is ascending order (less frequently used)
-- LIMIT: return a certain number of things. if LIMIT is larger than the
--    number of available results, we get all of the available results, not
--    a bunch of blanks or an error
-- OFFSET: skip a given number of results
------

Author.find_by_sql(
  "SELECT *
  FROM authors AS a JOIN authors AS s ON a.id = s.author_id
  ORDER BY a.id"
)

-- technically, you can do this, but SQLite and postgre have minor differences. Use with caution!
-- also, it assumes that the next person to work with your code will be comfortable with sql



-------

SELECT question_type, count(*)
FROM questions
GROUP BY question_type
ORDER BY count(*);


SELECT question_type, max(created_at)
FROM questions
GROUP BY question_type
ORDER BY count(*);
--get the most recently changed question for each question type


-- show



-----

SELECT *
FROM authors LEFT JOIN surveys ON authors.id = surveys.author_id
ORDER BY authors.id
WHERE surveys.id IS NULL;
