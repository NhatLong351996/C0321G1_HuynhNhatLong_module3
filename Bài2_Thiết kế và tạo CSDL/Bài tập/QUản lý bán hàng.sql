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
oDate datetime not null ,
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
