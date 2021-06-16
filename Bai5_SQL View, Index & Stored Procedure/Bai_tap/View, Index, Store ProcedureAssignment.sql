create database demo;

use demo;
create table products(
id int auto_increment primary key,
product_code varchar(20),
product_name varchar(20),
product_price varchar(20),
product_amount varchar(20),
product_description varchar(20),
product_status varchar(20));

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
value('a','may giat','1000','10','1 sao','con hang'),
     ('b','tu lanh','2000','20','2 sao','con hang'),
     ('c','ban ui','1500','30','3 sao','het hang');
     
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index indx_product_code on products(product_code);
drop  index indx_product_code on products;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index indx_product_name_product_price on products(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_code = 'a';
explain select * from products where product_name is not null and product_price='1500';

-- So sánh câu truy vấn trước và sau khi tạo index: Tốc độ truy vấn cao hơn chỉ 1 rows

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus 
-- từ bảng products.
create view products_view as
select product_code,product_name,product_price,product_status
from products;

-- Tiến hành sửa đổi view
update products_view
set product_price = '3000'
where product_name = 'may giat';

-- Tiến hành xoá view
drop view products_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure all_product()
begin
select * from products;
end //
delimiter ;
call all_product();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new_product(product_code varchar(20),product_name varchar(20),product_price varchar(20),
product_amount varchar(20),product_description varchar(20),product_status varchar(20))
begin
insert into products (product_code,product_name,product_price,product_amount,product_description,product_status) 
value (product_code,product_name,product_price,product_amount,product_description,product_status);
end //
delimiter ;
call add_new_product('d','may giat 2','1000','10','1 sao','con hang');
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_product_by_id(id_in int, product_code varchar(20),product_name varchar(20))
begin
update products
set product_code = product_code, product_name = product_name
where id = id_in;
end //
delimiter ;
SET sql_safe_updates=0;
call update_product_by_id(2, 'k3','tu lanh 3');
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_by_id(id_in int)
begin
delete from products
where id = id_in;
end //
delimiter ;
call delete_product_by_id(2);

