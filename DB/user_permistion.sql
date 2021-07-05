DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT name, email, country
    FROM users
    where id = user_id;
    END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
    END$$
DELIMITER ;

create table Permision(
id int(11) primary key,
name varchar(50)
);

create table User_Permision(
permision_id int(11),
user_id int(11)
);

insert into Permision(id, name) values(1, 'add');
insert into Permision(id, name) values(2, 'edit');
insert into Permision(id, name) values(3, 'delete');
insert into Permision(id, name) values(4, 'view');

DELIMITER $$
CREATE PROCEDURE update_user(
IN _id int,
IN _name varchar(50),
IN _email varchar(50),
IN _country varchar(50)
)
BEGIN
   update users
   set name = _name,email=_email,country=_country
   where id = _id;
    END$$
DELIMITER ;
call update_user(3,'longg','huyhaivan@gmail.com','Da Nang')

DELIMITER $$
CREATE PROCEDURE delete_user(IN _id int)
BEGIN
  delete from users where id = _id;
    END$$
DELIMITER ;


