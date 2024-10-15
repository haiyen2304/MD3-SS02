create database s02_bt04;
use s02_bt04;
create table users(
	id int primary key auto_increment,
    full_name varchar(100),
    email varchar(255),
    password varchar(255),
    phone varchar(11),
    permission bit,
    status bit
);
create table history(
	id int primary key auto_increment,
    user_id int,
    point int,
    examDate datetime,
    constraint fk_his01 foreign key (user_id) references users(id) 
);
create table exams(
	id int primary key auto_increment,
    name varchar(100),
    duration int,
    status bit
);
create table questions(
	id int primary key auto_increment,
    content varchar(255),
    exam_id int,
    status bit,
    constraint fk_ques01 foreign key (exam_id) references exams(id)
);
create table answer(
	id int primary key auto_increment,
    content varchar(255),
    question_id int,
    answer_true bit,
    constraint fk_answer01 foreign key (question_id) references questions(id)
);
create table history_detail(
	id int primary key auto_increment,
    history_id int,
    question_id int,
    result bit,
    constraint fk_his_detail01 foreign key (history_id) references history(id),
    constraint fk_his_detail02 foreign key (question_id) references questions(id)
);