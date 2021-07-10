create database resort;
use resort;

create table ViTri(
IDViTri int auto_increment primary key,
TenViTri varchar(45) not null
);

create table TrinhDo(
IDTrinhDo int auto_increment primary key,
TrinhDo varchar(45) not null
);

create table BoPhan(
IDBoPhan int auto_increment primary key,
TenBoPhan varchar(45) not null
);

create table NhanVien(
IDNhanVien int auto_increment primary key,
HoTen varchar(45) not null,
IDViTri int not null,
IDTrinhDo int not null,
IDBoPhan int not null,
NgaySinh date not null,
SoCMND varchar(45) not null unique,
Luong varchar(45) not null,
SDT varchar(45) not null unique,
Email varchar(45) unique,
DiaChi varchar(45) not null,
foreign key(IDViTri) references ViTri(IDViTri) on delete cascade,
foreign key(IDTrinhDo) references TrinhDo(IDTrinhDo) on delete cascade,
foreign key(IDBoPhan) references BoPhan(IDBoPhan) on delete cascade
);


create table LoaiKhach(
IDLoaiKhach int auto_increment primary key,
TenLoaiKhach varchar(45) not null unique
);

create table KhachHang(
IDKhachHang int auto_increment primary key,
IDLoaiKhach int not null,
HoTen varchar(45) not null,
NgaySinh date not null,
SoCMND varchar(45) not null unique,
SDT varchar(45) not null unique,
Email varchar(45) unique,
DiaChi varchar(45) not null,
foreign key(IDLoaiKhach) references LoaiKhach(IDLoaiKhach)
);

create table KieuThue(
IDKieuThue int auto_increment primary key,
TenKieuThue varchar(45) not null unique
);

create table LoaiDichVu(
IDLoaiDichVu int auto_increment primary key,
TenLoaiDichVu varchar(45) not null unique
);

create table DichVu(
IDDichVu int auto_increment primary key,
TenDichVu varchar(45) not null unique,
DienTich int not null,
SoTang int not null,
SoNguoiToiDa int not null,
ChiPhiThue int not null,
IDKieuThue int not null,
IDLoaiDichVu int not null,
TrangThai varchar(45) not null,
foreign key(IDKieuThue) references KieuThue(IDKieuThue) on delete cascade,
foreign key(IDLoaiDichVu) references LoaiDichVu(IDLoaiDichVu) on delete cascade
);

create table HopDong(
IDHopDong int auto_increment primary key,
IDNhanVien int not null,
IDKhachHang int not null,
IDDichVu int not null,
NgayLamHopDong date not null,
NgayKetThuc date not null,
TienDatCoc int not null,
TongTien int ,
foreign key(IDNhanVien) references NhanVien(IDNhanVien) on delete cascade,
foreign key(IDKhachHang) references KhachHang(IDKhachHang) on delete cascade,
foreign key(IDDichVu) references DichVu(IDDichVu) on delete cascade
);


create table DichVuDiKem(
IDDichVuDiKem int auto_increment primary key,
TenDichVuDiKem varchar(45) not null unique,
Gia int not null,
DonVi int not null,
TrangThaiKhaDung varchar(45) not null
);

create table HopDongChiTiet(
IDHopDongChiTiet int auto_increment primary key,
IDHopDong int not null,
IDDichVuDiKem int not null,
SoLuong int not null,
foreign key(IDHopDong) references HopDong(IDHopDong) on delete cascade,
foreign key(IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem) on delete cascade
);


insert into vitri(TenViTri)
value('Le Tan');
insert into vitri(TenViTri)
value('Phuc Vu');
insert into vitri(TenViTri)
value('Chuyen Vien');
insert into vitri(TenViTri)
value('Giam Sat');
insert into vitri(TenViTri)
value('Quan Ly');
insert into vitri(TenViTri)
value('Giam Doc');

insert into trinhdo(TrinhDo)
value('Trung Cap');
insert into trinhdo(TrinhDo)
value('Cao Dang');
insert into trinhdo(TrinhDo)
value('Dai hoc');
insert into trinhdo(TrinhDo)
value('Sau Dai Hoc');

insert into bophan(TenBoPhan)
value('Sale-Marketing');
insert into bophan(TenBoPhan)
value('Hanh Chinh');
insert into bophan(TenBoPhan)
value('Phuc Vu');
insert into bophan(TenBoPhan)
value('Quan Ly');

insert into kieuthue(TenKieuThue)
value ('Ngày'),
      ('Tháng'),
      ('Năm'),
      ('Giờ');
insert into loaidichvu(TenLoaiDichVu)
value('Villa'),('House'),('Room');
      
insert into dichvu(TenDichVu,DienTich,SoTang,SoNguoiToiDa,
ChiPhiThue,IDKieuThue,IDLoaiDichVu,TrangThai)
value ('Villa 1', 50, 2, 4, 200000, 4, 1, 'Còn khách'),
      ('Villa 2', 50, 3, 7, 1000000, 1, 1, 'Trống khách'),
      ('Villa 3', 50, 2, 4, 100000, 4, 1, 'Còn khách'),
      ('House 1', 30, 2, 4, 200000, 3, 2, 'Còn khách'),
      ('House 2', 50, 3, 7, 1000000, 1, 2, 'Trống khách'),
      ('House 3', 60, 2, 4, 2000000, 4, 2, 'Còn khách'),
      ('Room 1', 30, 2, 4, 200000, 2, 3, 'Còn khách'),
      ('Room 2', 50, 3, 7, 1000000, 1, 3, 'Trống khách'),
      ('Room 3', 60, 2, 4, 2000000, 2, 3, 'Còn khách');
insert into dichvu(TenDichVu,DienTich,SoTang,SoNguoiToiDa,
ChiPhiThue,IDKieuThue,IDLoaiDichVu,TrangThai)
value ('Villa cao cap', 500, 9, 10, 20000000, 4, 1, 'Còn khách');

insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Huynh Nhat Long',1,1,1,'1996-05-03','201743987','5000000','0384339012',
'Longhaivan@gmail.com','Hai Chau');
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Huynh Van Toan',1,2,3,'2000-07-03','201345987','6000000','03345339012',
'Toanhaivan@gmail.com','K30/5 OngIchDuong');
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Nguyen Van Toan',2,3,3,'2001-09-23','201346987','7000000','0534539018',
'Toanvan@gmail.com','H30/5 OngIchDuong');
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Nguyen Truong Khanh',3,3,3,'1991-09-09','290346987','12000000','0534099019',
'Khanhvan@gmail.com','H30/5 IchDuong');
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Nguyen Vo Dung',3,3,3,'1991-09-09','290340987','1000000','0539999019',
'Vodung@gmail.com','Hai Chau');

insert into loaikhach(TenLoaiKhach)
value('Diamond'),
     ('Platinium'),
     ('Gold'),
     ('Silver'),
     ('Member');
     
insert into khachhang(IDLoaiKhach,HoTen,NgaySinh,SoCMND,SDT,Email,DiaChi)
value(1,'Ha Thi Tung','2000-08-12','113454678','0694559356','Thanhtung@gmail.com','Da Nang'),
     (2,'Ha Van Mai','2004-05-17','167454678','0694589356','Vanmai@gmail.com','Da Nang'),
     (3,'Nguyen Thi Ut','1988-08-22','111254678','0694559566','Thiut@gmail.com','Quang Tri'),
     (4,'Tran Nga','1980-08-22','111256678','0123559566','Trannga@gmail.com','Quy Nhon');
insert into khachhang(IDLoaiKhach,HoTen,NgaySinh,SoCMND,SDT,Email,DiaChi)
value(1,'Nguyen Van Vinh','2002-08-12','110454678','0694509356','Vinh@gmail.com','Vinh'),
     (1,'Nguyen Van Ngãi','1978-08-12','110054678','0694509006','Ngai@gmail.com','Quang Ngai');
insert into khachhang(IDLoaiKhach,HoTen,NgaySinh,SoCMND,SDT,Email,DiaChi)
value(1,'Tran Nga','2001-08-12','111234678','0987659356','Trannga2@gmail.com','Da Nang');
insert into khachhang(IDLoaiKhach,HoTen,NgaySinh,SoCMND,SDT,Email,DiaChi)
value(2,'Tran Giàu','2001-08-12','101234678','0987651356','Trangiau2@gmail.com','Da Nang');


 insert into hopdong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc)
 value (1,1,1,'2021-06-10','2021-06-12',100000),
       (2,1,1,'2021-06-13','2021-06-14',100000),
       (3,2,4,'2021-06-19','2021-07-19',1000000),
       (4,2,4,'2020-06-19','2020-07-19',1000000);
insert into hopdong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc)
 value (4,2,2,'2018-04-11','2018-06-12',2000000);
 insert into hopdong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc)
 value (1,2,2,'2020-04-11','2020-06-12',2000000);
 insert into hopdong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc)
 value (3,6,1,'2020-04-11','2020-06-12',2000000),
       (3,7,4,'2021-04-11','2021-06-12',2000000);
insert into hopdong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc)
 value (3,6,1,'2021-12-11','2021-12-12',2000000),
       (3,7,4,'2021-11-11','2021-12-12',2000000),
	   (3,6,2,'2021-10-11','2021-10-12',2000000);
insert into hopdong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc)
 value (4,9,10,'2021-08-16','2021-12-13',2000000);
 
	
       
insert into dichvudikem (TenDichVuDiKem,Gia,DonVi,TrangThaiKhaDung)
value('massage', 200000, 1, 'ok'),
     ('karaoke', 100000, 1, 'ok'),
     ('thức ăn', 50000, 1, 'ok'),
     ('nước uống', 10000, 1, 'ok'),
     ('thuê xe di chuyển tham quan resort', 500000, 1, 'ok');
insert into hopdongchitiet(IDHopDong,IDDichVuDiKem,SoLuong)
value(1,1,1),
     (1,2,2),
     (1,3,2),
     (2,3,3),
     (2,4,3);
insert into hopdongchitiet(IDHopDong,IDDichVuDiKem,SoLuong)
value(10,5,1),
     (11,5,1);