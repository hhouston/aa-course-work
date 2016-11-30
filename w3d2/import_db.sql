DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;


CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)

);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Jeff', 'Fan'),
  ('hunter', 'houston'),
  ('troll', 'man');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('Why is the sky blue?', 'lots of explanation about the sky', 1),
  ('Why is the ground flat?', 'lots of explanation about the ground', 2);

INSERT INTO
  replies(question_id, parent_reply_id, user_id, body)
VALUES
  (1, NULL, 1, 'Not sure. I think this the atmosphere?'),
  (1, 1, 2, 'Wrong.');

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  (2, 1),
  (2, 2),
  (1, 1);

INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (3, 1),
  (1, 1),
  (2, 1),
  (3, 2);
