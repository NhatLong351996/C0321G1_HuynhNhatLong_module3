create database quanlybanhang;
use quanlybanhang;
create table customer(
cID int auto_increment primary key,
cName varchar(20) not null,
cAge int not null
);

create table Orders(
oID int auto_increment primary key,
cID int not null,
oDate date not null ,
oTotalPrice int,
foreign key(cID) references customer(cID)
);

create table product(
pID int auto_increment primary key,
pName varchar(50) not null,
pPrice int not null
);

create table orderdetail(
oID int not null,
pID int not null,
odQTY varchar(50) not null,
foreign key(oID) references orders(oID),
foreign key(pID) references product(pID),
primary key(oID,pID)
);

insert into customer(cName,cAge)
value ('Minh Quan',10),
      ('Ngoc Oanh',20),
      ('Hong Ha',50);
      
insert into orders(cID,oDate) 
value(1,'2006-03-21'),
     (2,'2006-03-23'),
     (1,'2006-03-16');
     
insert into product(pName,pPrice)
value('May Giat',3),
     ('Tu Lanh',5),
     ('Dieu Hoa',7),
     ('Quat',1),
     ('Bep Dien',2);
     
insert into orderdetail(oID,pID,odQTY)
value(1,1,3),
     (1,3,7),
     (1,4,2),
     (2,1,1),
     (3,1,8),
     (2,5,4),
     (2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
update orders
set oTotalPrice =60
where oID =1;
update orders
set oTotalPrice =32
where oID =2;
update orders
set oTotalPrice =24
where oID =3;
select oID,oDate,oTotalPrice
from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select C.cID,C.cName,P.pName
from customer C join orders O on C.cID=O.cID join orderdetail Ord on Ord.oID=O.oID 
join product P on P.pID=Ord.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cID,cName
from customer
where customer.cID not in (select orders.cID from orders);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
select orders.oId,orders.oDate,sum(orderdetail.odQTY*product.pPrice) as total
from orders join orderdetail on orders.oId = orderdetail.oId join product on orderdetail.pId = product.pId
group by orderdetail.oId;

