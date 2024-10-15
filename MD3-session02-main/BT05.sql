create database s02_bt05;
use s02_bt05;
create table users(
	id int primary key auto_increment,
    full_name varchar(100),
    email varchar(255),
    password varchar(255),
    phone varchar(11),
    permission bit,
    status bit
);
create table address(
	id int primary key auto_increment,
    user_id int,
    receive_address varchar(100),
    receive_name varchar(100),
    receive_phone varchar(11),
    is_default bit,
    constraint fk_add01 foreign key (user_id) references users(id)
);
create table orders(
	id int primary key auto_increment,
    order_at datetime,
    totals double,
    user_id int,
    status bit,
    constraint fk_orders01 foreign key (user_id) references users(id)
);
create table catalog(
	id int primary key auto_increment,
    name varchar(100),
    status bit
);
create table book(
	id int primary key auto_increment,
    name varchar(100),
    price double,
    stock int,
    status bit
);
create table book_catalog(
	catalog_id int,
    book_id int,
    primary key(catalog_id,book_id),
    constraint fk_book_cata01 foreign key (catalog_id) references catalog(id),
    constraint fk_book_cata02 foreign key (book_id) references book(id)
);
create table orders_detail(
	id int primary key auto_increment,
    orders_id int,
    book_id int,
    quantity int,
    unit_price double,
    constraint fk_orders_detail01 foreign key (orders_id) references orders(id),
    constraint fk_orders_detail02 foreign key (book_id) references book(id)
);

