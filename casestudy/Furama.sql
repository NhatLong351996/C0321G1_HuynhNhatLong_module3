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
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Nguyen Vo Dung',3,3,3,'1991-09-09','290340987','1000000','0539999019',
'Vodung@gmail.com','U30/9 IchDuongStr');

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
value(1,'Tran Giàu','2001-08-12','101234678','0987651356','Trangiau2@gmail.com','Da Nang');


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
     


-- task2:Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
--  một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.

select * from nhanvien
where (HoTen like 'H%'or'K%' or 'T%') and character_length(HoTen)<=15;

-- task3:3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khachhang
where (year(now())-year(NgaySinh))>=18 and (year(now())-year(NgaySinh))<=50 
and (DiaChi='Da Nang' or DiaChi ='Quang Tri');

-- task4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.HoTen, count(IDHopDong) as so_lan_dat_phong
from hopdong hd join khachhang kh on hd.IDKhachHang=kh.IDKhachHang
where kh.IDLoaiKhach =1
group by hd.IDKhachHang
order by so_lan_dat_phong;

-- task5: 5, Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong,
-- NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia,
-- với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. 
-- (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.IDKhachHang,kh.HoTen,lk.TenLoaiKhach,hd.IDHopDong,dv.TenDichVu,hd.NgayLamHopDong,hd.NgayKetThuc,
case when (hd.IDHopDong in (select IDHopDong from hopdongchitiet)) then (dv.ChiPhiThue+ sum(dvdk.Gia*hdct.SoLuong))  else dv.ChiPhiThue end as total
 from loaikhach lk 
 join khachhang kh on lk.IDLoaiKhach = kh.IDLoaiKhach
 left join hopdong hd on hd.IDKhachHang=kh.IDKhachHang
 left join dichvu dv on dv.IDDichVu = hd.IDDichVu
 left join hopdongchitiet hdct on hdct.IDHopDong=hd.IDHopDong
 left join dichvudikem dvdk on dvdk.IDDichVuDiKem=hdct.IDDichVuDiKem
 group by hd.IDHopDong;
 
 -- task 6:	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại
 -- Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

 select dv.IDDichVu,dv.TenDichVu,dv.DienTich,dv.ChiPhiThue,ldv.TenLoaiDichVu
 from loaidichvu ldv join dichvu dv on ldv.IDLoaiDichVu = dv.IDLoaiDichVu 
 where dv.IDDichVu not in  (select IDDichVu from hopdong hd where year(hd.NgayLamHopDong) = 2021) ;
 
 
 -- task 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
 -- của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2020 nhưng chưa từng được
 -- Khách hàng đặt phòng  trong năm 2021.
 select dv.IDDichVu,dv.TenDichVu,dv.DienTich,dv.SoNguoiToiDa,dv.ChiPhiThue,ldv.TenLoaiDichVu
 from dichvu dv join loaidichvu ldv on dv.IDLoaiDichVu=ldv.IDLoaiDichVu
 where dv.IDDichVu in (select IDDichVu from hopdong hd where year(hd.NgayLamHopDong)=2020)
 and dv.IDDichVu not in (select IDDichVu from hopdong hd where year(hd.NgayLamHopDong)=2021);
 
 
 -- task 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống,
 -- với yêu cầu HoThenKhachHang không trùng nhau.
 -- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
 
 -- Cách 1:
 select * from khachhang
 group by HoTen;
 -- Cách 2:
 select distinct HoTen from khachhang;
 -- Cách 3:
 select HoTen from khachhang
 union
 select HoTen from khachhang;
 
 -- task 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021
 -- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
 select month(hd.NgayLamHopDong) as tháng ,count(IDHopDong) as so_luong_khach_dat_phong
 from hopdong hd
 where year(hd.NgayLamHopDong) =2021
 group by tháng;
 
 -- task 10.Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
 -- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, 
 -- SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
 select hd.IDHopDong, hd.NgayLamHopDong, hd.NgayKetThuc,hd.TienDatCoc,sum(hdct.SoLuong) as so_luong_dvdk
 from hopdong hd left join hopdongchitiet hdct on hd.IDHopDong=hdct.IDHopDong
 group by hd.IDHopDong;
 
 -- task 11. Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng 
 -- có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
 select dvdk.IDDichVuDiKem, dvdk.TenDichVuDiKem
 from dichvudikem dvdk 
 join hopdongchitiet hdct on hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem
 join hopdong hd on hd.IDHopDong = hdct.IDHopDong
 join khachhang kh on kh.IDKhachHang = hd.IDKhachHang
 join loaikhach lk on lk.IDLoaiKhach=kh.IDLoaiKhach
 where lk.TenLoaiKhach = 'Diamond' and kh.DiaChi in ('vinh','quang Ngai')
 group by dvdk.IDDichVuDiKem;
 
 -- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang,
 -- TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc 
 -- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2021 
 -- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
 
 select hd.IDHopDong, nv.HoTen, kh.HoTen,kh.SDT,dv.TenDichVu, sum(hdct.SoLuong) as so_dvdk,hd.TienDatCoc
 from nhanvien nv join hopdong hd on nv.IDNhanVien=hd.IDNhanVien
 join khachhang kh on kh.IDKhachHang=hd.IDKhachHang
 join dichvu dv on dv.IDDichVu=hd.IDDichVu
 left join hopdongchitiet hdct on hdct.IDHopDong=hd.IDHopDong
 where  month(hd.NgayLamHopDong) 
 in (10,11,12) and year(hd.NgayLamHopDong) = 2021
 and (dv.IDDichVu not in (select IDDichVu from hopdong where month(NgayLamHopDong)
 in (01,02,03,04,05,06)
 and year(NgayLamHopDong) =2021))
 group by hd.IDHopDong ;
 
 -- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
 
 select dvdk.*, count(IDHopDongChiTiet) as so_lan_su_dung
 from hopdongchitiet hdct  join dichvudikem dvdk on dvdk.IDDichVuDiKem=hdct.IDDichVuDiKem
 group by dvdk.IDDichVuDiKem
 having so_lan_su_dung >= all (select count(IDHopDongChiTiet) 
 from hopdongchitiet  group by hopdongchitiet.IDDichVuDiKem );
 
 -- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
 -- Thông tin hiển thị bao gồm IDHopDong, TenloaiDichVu, TenDichVuDiKem, SoLanSuDung.
 select hd.IDHopDong,ldv.TenLoaiDichVu,dvdk.TenDichVuDiKem, count(hdct.IDHopDongChiTiet) as so_lan_su_dung
 from loaidichvu ldv join dichvu dv on ldv.IDLoaiDichVu=dv.IDLoaiDichVu
 join hopdong hd on hd.IDDichVu=dv.IDDichVu
 join hopdongchitiet hdct on hdct.IDHopDong=hd.IDHopDong
 join dichvudikem dvdk on dvdk.IDDichVuDiKem=hdct.IDDichVuDiKem
 group by hdct.IDDichVuDiKem
 having so_lan_su_dung = 1 ;
 
--  15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
-- IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng
-- từ năm 2018 đến 2019.

select nv.IDNhanVien,nv.HoTen,td.TrinhDo,bp.TenBoPhan,nv.SDT,nv.DiaChi, count(hd.IDHopDong) as so_lan
from hopdong hd 
right join nhanvien nv on hd.IDNhanVien=nv.IDNhanVien
join trinhdo td on td.IDTrinhDo=nv.IDTrinhDo
join bophan bp on bp.IDBoPhan=nv.IDBoPhan
where year(hd.NgayLamHopDong) in (2018,2019)
group by nv.IDNhanVien
having so_lan <=3 ;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
SET sql_safe_updates=0;
delete from nhanvien
where IDNhanVien not in 
(select IDNhanVien 
from hopdong 
where year(NgayLamHopDong) between 2017 and 2019);
 
-- 17.Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019
-- là lớn hơn 10.000.000 VNĐ. 
 
 


