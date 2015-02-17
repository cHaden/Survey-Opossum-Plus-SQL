-- Find all authors with an email address of "shakespeare@example.com"

SELECT *
FROM authors
WHERE email="shakespeare@example.com";


-- Find the author who was created most recently

SELECT *
FROM authors
ORDER BY created_at DESC
LIMIT 1;


-- Find the number (count) of each type of question in the database

SELECT question_type, count(*)
FROM questions
GROUP BY question_type
ORDER BY count(*);

-- Find the most common answer to a particular question (given a question_id)

SELECT *, count(*)
FROM responses
WHERE question_id = 42
ORDER BY count(*)
LIMIT 1;

-- Find all survey names, and show their author's email addresses with them

SELECT *
FROM surveys JOIN authors ON authors.id = surveys.author_id
ORDER BY authors.id;

-- Find all authors who have never created a survey
SELECT *
FROM authors LEFT JOIN surveys ON authors.id = surveys.author_id
ORDER BY authors.id
WHERE surveys.id IS NULL;
