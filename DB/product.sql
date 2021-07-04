CREATE DATABASE produce;
USE produce;

create table produces (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 price int NOT NULL,
 description varchar(120),
  producer varchar(120),
 PRIMARY KEY (id)
);
insert into produces(name,price, description,producer) values('sua rua mat',100000,'srm','Viet Nam');
insert into produces(name,price, description,producer) values('toner',200000,'nuoc hoa hong','Viet Nam');
insert into produces(name,price, description,producer) values('mat na',500000,'mat na giay','Han Quoc');
insert into produces(name,price, description,producer) values('kem chong nang',100000,'kcn','Korea');
select * from produces ;