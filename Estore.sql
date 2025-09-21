create procedure update_customer_name (
c_id int, new_name varchar(100)
)
language plpgsql
AS $$
begin
update Customers
SET cust_name = new_name
where cust_id = c_id;
end;
$$


call update_customer_name (1,'ujjawal')



Create function final_report (c_id int)
returns table (cust_name varchar , ord_date date , p_name varchar , price numeric ,  quantity int , total_price numeric)
AS $$
begin 
return query
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
		customers c ON o.cust_id=c.cust_id
		where c.cust_id = c_id;


end ;

$$ language plpgsql;



create function checkprice()
returns trigger
LANGUAGE plpgsql
as $$

begin 
if new.price<0 then
new.price=0;
end if ;

return New;
end;
$$;

CREATE TRIGGER trg_check_price
BEFORE INSERT OR UPDATE ON products
FOR EACH ROW
EXECUTE FUNCTION checkprice();


INSERT INTO products (p_name, price)
VALUES
    ('Headphone', -120)
    
;
