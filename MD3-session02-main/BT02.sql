use session02;
create table customer(
	c_id int primary key auto_increment,
    c_name varchar(255),
    c_age int
);
create table orders(
	o_id int primary key auto_increment,
    c_id int,
    o_date datetime,
    o_totalprice double,
    constraint fk_04 foreign key (c_id) references customer(c_id)
);
create table products(
	p_id int primary key auto_increment,
    p_name varchar(255),
    p_price double
);
create table order_detail(
	o_id int,
    p_id int,
    od_QTY int,
    constraint fk_05 foreign key (o_id) references orders(o_id),
    constraint fk_06 foreign key (p_id) references products(p_id)
);