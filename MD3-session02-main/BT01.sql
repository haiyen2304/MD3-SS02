create database session02;
use session02;
create table product(
	id int primary key auto_increment,
    name varchar(100),
    created date
);
create table color(
	id int primary key auto_increment,
    name varchar(100),
    status bit
);
create table size(
	id int primary key auto_increment,
    name varchar(100),
    status bit
);
create table product_detail(
	id int primary key auto_increment,
    product_id int,
    color_id int,
    size_id int,
    price double,
    stock int,
    status bit,
    constraint fk_01 foreign key(product_id) references product(id),
    constraint fk_02 foreign key(color_id) references color(id),
    constraint fk_03 foreign key(size_id) references size(id)
);