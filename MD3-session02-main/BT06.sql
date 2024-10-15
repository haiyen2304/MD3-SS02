create database s02_bt06;
use s02_bt06;
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
create table product(
	id int primary key auto_increment,
    name varchar(100),
    price double,
    stock int,
    catalog_id int,
    status bit,
    constraint fk_pro01 foreign key (catalog_id) references catalog(id)
);
create table wishlist(
	user_id int,
    product_id int,
    primary key(user_id,product_id),
    constraint fk_wish01 foreign key (user_id) references users(id),
    constraint fk_wish02 foreign key (product_id) references product(id)
);
create table shopping_cart(
	id int primary key auto_increment,
    user_id int,
    product_id int,
    quantity int,
    constraint fk_shopping_cart01 foreign key (user_id) references users(id),
    constraint fk_shopping_cart02 foreign key (product_id) references product(id)
);
create table orders_detail(
	id int primary key auto_increment,
    orders_id int,
    product_id int,
    quantity int,
    unit_price double,
    constraint fk_orders_detail01 foreign key (orders_id) references orders(id),
    constraint fk_orders_detail02 foreign key (product_id) references product(id)
);
