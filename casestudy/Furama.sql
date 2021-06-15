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
NgaySinh datetime not null,
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
