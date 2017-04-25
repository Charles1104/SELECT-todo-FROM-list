DROP table IF EXISTS tasks CASCADE;

CREATE TABLE IF NOT EXISTS tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50) UNIQUE NOT NULL,
  description VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP DEFAULT NULL,
  completed BOOLEAN DEFAULT FALSE
);


ALTER TABLE tasks
DROP COLUMN completed;

ALTER TABLE tasks
ADD completed_at TIMESTAMP DEFAULT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks
VALUES (DEFAULT,'Study SQL','Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks where title IS NOT NULL;

UPDATE tasks
SET completed_at = now()
WHERE id = 1;

SELECT title, description FROM tasks where tasks.completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * from tasks ORDER BY title;
