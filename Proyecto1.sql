CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "category_id" int NOT NULL,
  "title" varchar NOT NULL,
  "description" text DEFAULT 'sin descripción',
  "level" char DEFAULT 'principiantes',
  "teacher" varchar
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid NOT NULL,
  "title" varchar NOT NULL,
  "url" varchar UNIQUE NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "user_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "course_id" uuid NOT NULL
);

ALTER TABLE "user_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

insert into users (
	id,
	name,
	email,
	password,
	age
) values (
	'9a294b23-9ff7-49d2-ae65-e01fb514b5ee',
	'Camilo',
	'camilo@academlo.com',
	'camilo123',
	25
),(
	'3c8dcfe2-3558-4cdc-a5d5-63bb6d7fbd94',
	'Maria',
	'maria@academlo.com',
	'maria123',
	20
)

insert into categories (
	"name" 
) values (
	'Maths'
),(
	'Biology'
)

insert into courses (
	id,
	category_id,
	title,
	description,
	level,
	teacher
) values (
	'398471e1-da9c-4635-a8c7-e5e597437616',
	'1',
	'sumas y restas',
	'Aquí se explica como sumar y restar',
	'P',
	'Juan'	
),(
	'f79e7261-d917-4395-a55a-62c1976a00ef',
	'2',
	'invertebrados',
	'Aquí se explica la anatomia de los invetebrados',
	'I',
	'Cristian'
)
insert into course_videos (
	id, 
	course_id,
	title,
	url
) values ( 
	'da99dd57-c792-4adf-893b-a543109c62ad',
	'398471e1-da9c-4635-a8c7-e5e597437616',
	'Video de sumas y restas',
	'https://www.youtube.com/watch?v=Lqf5WmulMYI'
),(
	'3353d2fa-60d4-4617-970b-4f3759257b53',
	'f79e7261-d917-4395-a55a-62c1976a00ef',
	'Video de invertebrados',
	'https://www.youtube.com/watch?v=SPvC4XbKcIc'
)

insert into user_courses (
	id,
	user_id,
	course_id
) values ( 
	'a9c29c60-73f4-40a9-86a4-1c43fa0c815f',
	'9a294b23-9ff7-49d2-ae65-e01fb514b5ee',
	'398471e1-da9c-4635-a8c7-e5e597437616'
),(
	'ee09d038-7f58-4780-a92d-9d40bb401e58',
	'3c8dcfe2-3558-4cdc-a5d5-63bb6d7fbd94',
	'f79e7261-d917-4395-a55a-62c1976a00ef')

