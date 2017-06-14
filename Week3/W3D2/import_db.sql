CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY ,
  questions_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (questions_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE question_likes (
  questions_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  likes INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes (questions_id, user_id, likes)
VALUES
  (1, 1, 100),
  (1, 2, 40),
  (2, 2, 200),
  (2, 1, 30),
  (3, 3, 1);

INSERT INTO
  users (fname, lname)
VALUES
  ('Aaron', 'Mondshine'),
  ('Jared', 'Tan'),
  ('Bob', 'Tables');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('Time', 'What time is it in Australia?', 1),
  ('Lunch?', 'What is for lunch today?', 2),
  ('School', 'Can I go back to school?', 3);

INSERT INTO
  question_follows(user_id, questions_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 2),
  (3, 3),
  (3, 1);


INSERT INTO
  replies(questions_id, parent_id, user_id, body)
VALUES
  (1, 1, 1, 'Look it up!'),
  (2, 2, 2, 'Rocks'),
  (3, 3, 3, 'No, you dropped out');
