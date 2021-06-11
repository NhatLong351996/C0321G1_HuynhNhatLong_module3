create database QuanLyDiemThi;

use QuanLyDiemThi;
create table HocSinh(
MaHS varchar(20) primary key,
tenHS varchar(50),
NgaySinh datetime,
lop varchar(20),
GT varchar(20)
);

create table monhoc(
MaMH varchar(20) primary key,
TenMH varchar(50)
);

create table bangdiem(
MaHS varchar(20),
MaMH varchar(20),
DiemThi int,
NgayKT datetime,
primary key(MaHS,MaMH),
foreign key (MaHS) references hocsinh(MaHS),
foreign key(MaMH) references monhoc(MaMH)
);

create table giaovien(
MaGV varchar(20) primary key,
TenGV varchar(20),
SDT varchar(10)
);
ALTER TABLE MonHoc ADD MaGV VARCHAR(20);
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);