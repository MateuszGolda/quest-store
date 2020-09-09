-- noinspection SqlDialectInspectionForFile

CREATE TABLE public.balance (
    user_id integer NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    total_earned integer DEFAULT 0 NOT NULL
);


CREATE TABLE public.categories (
    id integer NOT NULL auto_increment,
    name text NOT NULL
);


CREATE TABLE public.classrooms (
    id integer NOT NULL auto_increment,
    name text NOT NULL
);



CREATE TABLE public.group_shopping (
    id integer NOT NULL auto_increment,
    item_id integer NOT NULL,
    confirmed boolean NOT NULL,
    started_date date NOT NULL,
    is_paid boolean NOT NULL,
    paid_date date,
    is_used boolean DEFAULT false NOT NULL
);

CREATE TABLE public.items (
    id integer NOT NULL auto_increment,
    name text NOT NULL,
    description text NOT NULL,
    cost integer NOT NULL,
    category_id integer NOT NULL
);

CREATE TABLE public.quests (
    id integer NOT NULL auto_increment,
    name text NOT NULL,
    description text NOT NULL,
    money integer NOT NULL,
    category_id integer NOT NULL
);


CREATE TABLE public.roles (
    id integer NOT NULL auto_increment,
    name text NOT NULL
);


CREATE TABLE public.sessions (
    session_id text NOT NULL,
    user_id integer NOT NULL,
    login_timestamp timestamp without time zone NOT NULL,
    logout_timestamp timestamp without time zone NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


CREATE TABLE public.students_shopping (
    user_id integer NOT NULL,
    shopping_id integer NOT NULL,
    confirmed_date date,
    confirmed boolean NOT NULL
);



CREATE TABLE public.user_classrooms (
    classroom_id integer NOT NULL,
    user_id integer NOT NULL
);



CREATE TABLE public.user_items (
    id integer NOT NULL auto_increment,
    item_id integer NOT NULL,
    user_id integer NOT NULL,
    bought_date date NOT NULL,
    is_used boolean NOT NULL
);


CREATE TABLE public.user_quests (
    id integer NOT NULL auto_increment,
    quest_id integer NOT NULL,
    user_id integer NOT NULL,
    done_date date NOT NULL,
    accepted boolean NOT NULL
);


CREATE TABLE public.users (
    id integer NOT NULL auto_increment,
    name text NOT NULL,
    surname text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    id_role integer NOT NULL,
    is_active boolean NOT NULL
);



INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (1, 'Mateusz', 'Gołda', 'asd', 'mateusz@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (2, 'Piotr', 'Stępak', '123', 'piotr@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (3, 'Grzegorz', 'Matyja', '123', 'grzegorz@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (4, 'Alek', 'Jednaszewski', '123', 'alek@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (5, 'Jan', 'Kowalski', '123', 'jan@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (6, 'Jan', 'Nowak', '123', 'jannowak@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (7, 'Stanisław', 'Nowak', '123', 'stanislawnowak@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (8, 'Anna', 'Nowak', '123', 'annanowak@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (9, 'Anna', 'Kowalska', '123', 'annakowalska@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (10, 'Marta', 'Kwiecień', '123', 'martakwiecien@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (11, 'studentName0', 'studentSurname0', 'password0', 'student0@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (12, 'studentName1', 'studentSurname1', 'password1', 'student1@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (13, 'studentName2', 'studentSurname2', 'password2', 'student2@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (14, 'studentName3', 'studentSurname3', 'password3', 'student3@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (15, 'studentName4', 'studentSurname4', 'password4', 'student4@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (16, 'studentName5', 'studentSurname5', 'password5', 'student5@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (17, 'studentName6', 'studentSurname6', 'password6', 'student6@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (18, 'studentName7', 'studentSurname7', 'password7', 'student7@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (19, 'studentName8', 'studentSurname8', 'password8', 'student8@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (20, 'studentName9', 'studentSurname9', 'password9', 'student9@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (21, 'studentName10', 'studentSurname10', 'password10', 'student10@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (22, 'studentName11', 'studentSurname11', 'password11', 'student11@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (23, 'studentName12', 'studentSurname12', 'password12', 'student12@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (24, 'studentName13', 'studentSurname13', 'password13', 'student13@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (25, 'studentName14', 'studentSurname14', 'password14', 'student14@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (26, 'studentName15', 'studentSurname15', 'password15', 'student15@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (27, 'studentName16', 'studentSurname16', 'password16', 'student16@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (28, 'studentName17', 'studentSurname17', 'password17', 'student17@gmail.com', 1, false);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (29, 'studentName18', 'studentSurname18', 'password18', 'student18@gmail.com', 1, false);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (30, 'studentName19', 'studentSurname19', 'password19', 'student19@gmail.com', 1, false);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (31, 'Dominik', 'Starzyk', '123', 'dominikstarzyk@codecool.com', 2, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (32, 'Wojciech', 'Makieła', '123', 'wojciechmakiela@codecool.com', 2, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (33, 'Marcin', 'Izworski', '123', 'marcinizworski@codecool.com', 2, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (34, 'Adam', 'Panasiuk', '123', 'adampanasiuk@gmail.com', 2, false);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (35, 'Creepy', 'Guy', '123', 'creepyguy@codecool.com', 3, true);



INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (1, 3, 1, '2020-06-04', true);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (2, 3, 2, '2020-06-04', true);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (3, 3, 3, '2020-06-04', true);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (4, 3, 4, '2020-06-04', true);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (5, 1, 1, '2020-06-04', false);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (6, 1, 2, '2020-06-04', true);

INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (1, 1, 1, '2020-07-22', false);
INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (2, 2, 1, '2020-07-22', false);
INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (3, 1, 2, '2020-07-22', false);
INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (4, 1, 2, '2020-07-22', false);
INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (5, 1, 3, '2020-07-23', false);

INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (2, 1);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (2, 2);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (2, 3);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (2, 4);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (1, 5);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (1, 6);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (1, 7);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (1, 8);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (1, 9);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (1, 10);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (3, 11);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (3, 12);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (3, 13);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (3, 14);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (3, 15);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (3, 16);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (3, 17);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 18);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 19);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 20);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 21);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 22);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 23);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 24);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 25);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 26);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 27);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (1, 31);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (1, 32);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (1, 33);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (4, 31);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (3, 32);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (2, 33);
INSERT INTO public.user_classrooms (classroom_id, user_id) VALUES (2, 31);

INSERT INTO public.students_shopping (user_id, shopping_id, confirmed_date, confirmed) VALUES (1, 1, '2020-07-22', true);
INSERT INTO public.students_shopping (user_id, shopping_id, confirmed_date, confirmed) VALUES (2, 1, '2020-07-22', true);
INSERT INTO public.students_shopping (user_id, shopping_id, confirmed_date, confirmed) VALUES (3, 1, '2020-07-22', true);
INSERT INTO public.students_shopping (user_id, shopping_id, confirmed_date, confirmed) VALUES (4, 1, '2020-07-22', true);


INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('V3WE?rN7RWcU3YsGCxdCdTfNt', 1, '2020-08-31 08:45:46.544', '2020-08-31 08:55:50.023508', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('o.hk7wCJn3ndenLq0,zVcENTc', 1, '2020-08-31 09:34:36.603', '2020-08-31 09:44:40.853266', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('JdV1HvClM3Ag,O!d31NU6gaQc', 33, '2020-08-31 09:35:32.928', '2020-08-31 09:40:32.928', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('1234567890qwerty', 1, '2020-08-31 08:45:46.544', '2020-08-31 08:55:50.023', true);

INSERT INTO public.roles (id, name) VALUES (1, 'Student');
INSERT INTO public.roles (id, name) VALUES (2, 'Mentor');
INSERT INTO public.roles (id, name) VALUES (3, 'Admin');


INSERT INTO public.quests (id, name, description, money, category_id) VALUES (1, 'Exploring a dungeon', 'Finishing a Teamwork week', 100, 1);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (2, 'Solving the magic puzzle', 'Finishing an SI assignment', 100, 1);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (3, 'Slaying a dragon', 'Passing a Checkpoint in the first attempt', 500, 1);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (4, 'Spot trap', 'Spot a major mistake in the assignment', 50, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (5, 'Taming a pet', 'Doing a demo about a pet project', 100, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (6, 'Recruiting some n00bs', 'Taking part in the student screening process', 100, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (7, 'Forging weapons', 'Organizing a workshop for other students', 400, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (8, 'Master the mornings', 'Attend 1 months without being late', 300, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (9, 'Fast as an unicorn', 'deliver 4 consecutive SI week assignments on time', 500, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (10, 'Achiever', 'set up a SMART goal accepted by a mentor, then achieve it', 1000, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (11, 'Fortune', 'students choose the best project of the week. Selected team scores', 500, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (12, 'Creating an enchanted scroll', 'Creating extra material for the current TW/SI topic (should be revised by mentors)', 500, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (13, 'Enter the arena', 'Do a presentation on a meet-up', 500, 2);


INSERT INTO public.items (id, name, description, cost, category_id) VALUES (1, 'Combat training', 'Private mentoring', 50, 3);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (2, 'Sanctuary', 'You can spend a day in home office', 1000, 3);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (3, 'Time Travel', 'extend SI week assignment deadline by one day', 750, 3);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (4, 'Circle of Sorcery', '60 min workshop by a mentor(s) of the chosen topic', 6000, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (5, 'Summon Code Elemental', 'mentor joins a students'' team for a one hour', 2500, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (6, 'Tome of knowledge', 'Extra material for the current topic', 1500, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (7, 'Transform mentors', 'All mentors should dress up as pirates (or just funny) for the day', 5000, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (8, 'Teleport', 'The whole course goes to an off-school program instead for a day', 30000, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (9, 'Day off', 'You can have a day off without any consequences', 1000, 3);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (10, 'Karaoke', 'Mentors sing songs chosen by the students', 10000, 4);


INSERT INTO public.group_shopping (id, item_id, confirmed, started_date, is_paid, paid_date, is_used) VALUES (1, 6, true, '2020-07-22', true, '2020-07-22', false);


INSERT INTO public.classrooms (id, name) VALUES (1, 'JavaOOP');
INSERT INTO public.classrooms (id, name) VALUES (2, 'Web with SQL');
INSERT INTO public.classrooms (id, name) VALUES (3, 'ProgBasic');
INSERT INTO public.classrooms (id, name) VALUES (4, 'Advanced');
INSERT INTO public.classrooms (id, name) VALUES (5, 'Web with python');


INSERT INTO public.categories (id, name) VALUES (1, 'basic-quest');
INSERT INTO public.categories (id, name) VALUES (2, 'extra-quest');
INSERT INTO public.categories (id, name) VALUES (3, 'basic-item');
INSERT INTO public.categories (id, name) VALUES (4, 'magic-item');


INSERT INTO public.balance (user_id, amount, total_earned) VALUES (1, 1000, 2000);