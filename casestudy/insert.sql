use furama;
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
value('Huynh Nhat Long',1,1,1,3/5/1996,201743987,'5000000','0384339012','Huyhaivan@gmail.com','K30/9 Tran Huy Lieu');
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Huynh Van Toan',1,2,3,7/5/2000,201345987,'6000000','03345339012','Longhaivan@gmail.com','K30/5 OngIchDuong');
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value('Nguyen Van Toan',2,3,3,3/4/2001,201346987,'7000000','0534539012','Toanvan@gmail.com','H30/5 OngIchDuong');