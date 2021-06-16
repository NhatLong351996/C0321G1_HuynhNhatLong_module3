-- task1: 1.Thêm mới thông tin cho tất cả các bảng có trong CSDL
--  để có thể thõa mãn các yêu cầu bên dưới.

create database furama;
use furama;

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
foreign key(IDViTri) references ViTri(IDViTri),
foreign key(IDTrinhDo) references TrinhDo(IDTrinhDo),
foreign key(IDBoPhan) references BoPhan(IDBoPhan)
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
TenKieuThue varchar(45) not null unique,
Gia int not null
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
foreign key(IDKieuThue) references KieuThue(IDKieuThue),
foreign key(IDLoaiDichVu) references LoaiDichVu(IDLoaiDichVu)
);

create table HopDong(
IDHopDong int auto_increment primary key,
IDNhanVien int not null,
IDKhachHang int not null,
IDDichVu int not null,
NgayLamHopDong date not null,
NgayKetThuc date not null,
TienDatCoc int not null,
TongTien int not null,
foreign key(IDNhanVien) references NhanVien(IDNhanVien),
foreign key(IDKhachHang) references KhachHang(IDKhachHang),
foreign key(IDDichVu) references DichVu(IDDichVu)
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
foreign key(IDHopDong) references HopDong(IDHopDong),
foreign key(IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem)
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

insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Huynh Nhat Long',1,1,1,'1996-05-03','201743987','5000000','0384339012',
'Longhaivan@gmail.com','K30/9 Tran Huy Lieu');
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Huynh Van Toan',1,2,3,'2000-07-03','201345987','6000000','03345339012',
'Toanhaivan@gmail.com','K30/5 OngIchDuong');
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Nguyen Van Toan',2,3,3,'2001-09-23','201346987','7000000','0534539018',
'Toanvan@gmail.com','H30/5 OngIchDuong');
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Nguyen Truong Khanh',3,3,3,'1991-09-09','290346987','12000000','0534099019',
'Khanhvan@gmail.com','H30/5 IchDuong');

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
     

-- task2:Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
--  một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.

select * from nhanvien
where (HoTen like 'H%'or'K%' or 'T%') and character_length(HoTen)<=15;

-- task3:3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khachhang
where (year(now())-year(NgaySinh))>=18 and (year(now())-year(NgaySinh))<=50 
and DiaChi='Da Nang' or DiaChi ='Quang Tri';

-- task4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.