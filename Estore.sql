create table Customers (
   cust_id serial primary key,
   cust_name varchar(100) not null
   
);

create table orders (

ord_id serial primary key,
ord_date date not null,
cust_id int not null,
foreign key (cust_id) references Customers(cust_id)



);

create table products (
p_id serial primary key,
p_name varchar(100),
price numeric not null
);


create table order_items(
items_id serial primary key,
ord_id int,
p_id int,
quantity int,
foreign key (p_id ) references products(p_id),
foreign key (ord_id) references orders(ord_id)
);


INSERT INTO customers (cust_name)
VALUES
    ('Raju'), ('Sham'), ('Paul'), ('Alex');
INSERT INTO order_items (ord_id, p_id, quantity)
VALUES
    (1, 1, 1),  
    (1, 4, 2), 
    (2, 1, 1), 
    (3, 2, 1),  
    (3, 4, 5), 
    (4, 3, 1);  

	INSERT INTO products (p_name, price)
VALUES
    ('Laptop', 55000.00),
    ('Mouse', 500),
    ('Keyboard', 800.00),
    ('Cable', 250.00)
;

Overall report 

SELECT 
	c.cust_name,
	o.ord_date,
	p.p_name,
	p.price,
	oi.quantity,
	(oi.quantity*p.price) AS total_price
FROM order_items oi
	JOIN
		products p ON oi.p_id=p.p_id
	JOIN
		orders o ON o.ord_id=oi.ord_id
	JOIN
		customers c ON o.cust_id=c.cust_id;






