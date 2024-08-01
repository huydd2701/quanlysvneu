create database QLSV
use QLSV
go
Create Table TaiKhoan
 (
   TenTK char(30) primary key,
   Matkhau char(30) not null,
   Tennguoidung nvarchar(30) not null,
   Chucvu nvarchar(30),
   Ngaysinh datetime,
   Gioitinh char(5) CHECK (Gioitinh IN ('Nam', 'Nu')),
   Dienthoai varchar(10) check (Dienthoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
   DiaChi nvarchar(50) not null,
   Email char(30),
 )
 Insert into TaiKhoan(TenTK,Matkhau,Tennguoidung,Chucvu,Ngaysinh,Gioitinh,Dienthoai,DiaChi,Email) Values
 ( 'admin','admin','Nguyễn Văn A','Quản lí hồ sơ','1/1/1970','Nam','0123456789','Hà Nội','admin@gmail.com');
 Insert into TaiKhoan(TenTK,Matkhau,Tennguoidung,Chucvu,Ngaysinh,Gioitinh,Dienthoai,DiaChi,Email) Values
 ( 'abc','123','Lê Thị H','Quản lí hồ sơ','2/1/1975','Nu','0123456788','Hà Nam','LTH@gmail.com');
 Insert into TaiKhoan(TenTK,Matkhau,Tennguoidung,Chucvu,Ngaysinh,Gioitinh,Dienthoai,DiaChi,Email) Values
 ( 'xyz','789','Nguyễn Văn B','Hiệu phó','3/3/1979','Nam','0123456799','Thái Bình','xyz@gmail.com');
 select * from TaiKhoan


Create Table HeDT
 (
   MaHeDT char(5) primary key,
   TenHeDT nvarchar(40) not null
 )
 Insert into HeDT(MaHeDT,TenHeDT) Values ('DT1','Chính qui');
 Insert into HeDT(MaHeDT,TenHeDT) Values ('DT2','Từ xa');
 Insert into HeDT(MaHeDT,TenHeDT) Values ('DT3','Tại chức');
 select* from HeDT

  Create Table Khoa
 (
   MaKhoa char(5) primary key,
   TenKhoa nvarchar(30) not null,
   DiaChiVanPhong nvarchar(50) not null,
   DienThoai varchar(20) not null
 )
 Insert into Khoa(MaKhoa,TenKhoa,DiaChiVanPhong,DienThoai) Values('K1','CNTT','Phòng D1','01234567')
 Insert into Khoa(MaKhoa,TenKhoa,DiaChiVanPhong,DienThoai) Values('K2','Kinh tế','Phòng D2','01234568')
 Insert into Khoa(MaKhoa,TenKhoa,DiaChiVanPhong,DienThoai) Values('K3','Bảo hiểm','Phòng D4','01234587')
 Insert into Khoa(MaKhoa,TenKhoa,DiaChiVanPhong,DienThoai) Values('K4','Xã hội','Phòng D5','01234569')
 select * from Khoa

 create table GVCoVan
(
MaGV char(15) primary key,
TenGV varchar(50),
Gioitinh char(5) CHECK (Gioitinh IN ('Nam', 'Nu')),
NgaySinh datetime ,
Email char(30),
DienThoai varchar(20) not null check (DienThoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
DiaChi nvarchar(50) not null,
MaKhoa char(5) foreign key references Khoa (MaKhoa),
)

insert into GVCoVan(MaGV,TenGV,Gioitinh,NgaySinh,Email,DienThoai,DiaChi,MaKhoa) values 
('GV1','Hoang Hà','Nu','8/3/1990','T@gmail.com','7894561230','Cầu Giấy Hà Nội','K1')
insert into GVCoVan(MaGV,TenGV,Gioitinh,NgaySinh,Email,DienThoai,DiaChi,MaKhoa) values 
('GV5','Hoang Thu','Nu','8/9/1990','KK@gmail.com','7894561233','Cầu Giấy Hà Nội','K2')
insert into GVCoVan(MaGV,TenGV,Gioitinh,NgaySinh,Email,DienThoai,DiaChi,MaKhoa) values 
('GV9','Hoang K','Nam','1/3/1985','xg@gmail.com','7894561231','Thanh Xuân Hà Nội','K3')
insert into GVCoVan(MaGV,TenGV,Gioitinh,NgaySinh,Email,DienThoai,DiaChi,MaKhoa) values 
('GV10','Hoang Nam','Nam','1/10/1985','xxb@gmail.com','7894561331','Thanh Xuân Hà Nội','K3')
select* from GVCoVan

  Create Table ChuyenNganh
 (
   MaCN char(5) primary key,
   TenCN nvarchar(30) not null,
   Tongtin int,
   MaKhoa char(5) foreign key references Khoa (MaKhoa),
  )
 insert into ChuyenNganh(MaCN,TenCN,Tongtin,MaKhoa) values('CN1','Khoa học máy tính','130','K1')
 insert into ChuyenNganh(MaCN,TenCN,Tongtin,MaKhoa) values('CN2','Hệ thống quản lí','130','K1')
 insert into ChuyenNganh(MaCN,TenCN,Tongtin,MaKhoa) values('CC1','Kinh tế đầu tư','150','K2')
 insert into ChuyenNganh(MaCN,TenCN,Tongtin,MaKhoa) values('CC2','Toán kinh tế','150','K2')
 insert into ChuyenNganh(MaCN,TenCN,Tongtin,MaKhoa) values('CH1','Bảo hiểm','130','K3')
 insert into ChuyenNganh(MaCN,TenCN,Tongtin,MaKhoa) values('CH2','Tâm lí','130','K4')
 select * from ChuyenNganh

  Create Table Lop
 (
   MaLop char(5) primary key,
   TenLop nvarchar(30) not null,
   MaHeDT char(5) foreign key references HeDT (MaHeDT),
   MaCN char(5) foreign key references ChuyenNganh (MaCN),
   MaGV char(15) foreign key references GVCoVan (MaGV),
 )
 insert into Lop(MaLop,TenLop,MaHeDT,MaCN,MaGV) values ('C1','CNTT60','DT1','CN1','GV1')
 insert into Lop(MaLop,TenLop,MaHeDT,MaCN,MaGV) values ('C2','CNTT61','DT2','CN1','GV1')
 insert into Lop(MaLop,TenLop,MaHeDT,MaCN,MaGV) values ('C31','Baohiem60','DT1','CH1','GV9')
 insert into Lop(MaLop,TenLop,MaHeDT,MaCN,MaGV) values ('C30','Baohiem58','DT1','CH1','GV10')
 insert into Lop(MaLop,TenLop,MaHeDT,MaCN) values ('C21','Toankinhte60','DT3','CC2')
 select * from Lop

Create Table MonHoc
 (
   MaMH char(5) primary key,
   TenMH nvarchar(30) not null,
   SoTin int not null check ( (SoTin>1)and (SoTin<4) ),
   NamHoc nvarchar(4) check (NamHoc like '[0-9][0-9][0-9][0-9]'),
   HocKy int check( (HocKy>0) and (HocKy<4)) not null,
   MaCN char(5) foreign key references ChuyenNganh (MaCN),
 )
 insert into MonHoc(MaMH,TenMH,SoTin,NamHoc,HocKy,MaCN) values ('L1','Lí đại cương',3,'2002',1,'CN1')
 insert into MonHoc(MaMH,TenMH,SoTin,NamHoc,HocKy,MaCN) values ('L2','Lập trình2',3,'2002',1,'CN1')
 insert into MonHoc(MaMH,TenMH,SoTin,NamHoc,HocKy,MaCN) values ('L3','Lập trình',3,'2002',2,'CN1')
 insert into MonHoc(MaMH,TenMH,SoTin,NamHoc,HocKy,MaCN) values ('T1','Toán cao cấp',2,'2002',1,'CC1')
 insert into MonHoc(MaMH,TenMH,SoTin,NamHoc,HocKy,MaCN) values ('T2','Toán cao cấp2',2,'2002',1,'CC2')
 insert into MonHoc(MaMH,TenMH,SoTin,NamHoc,HocKy,MaCN) values ('T3','Giải tích',3,'2002',1,'CH1')
select * from MonHoc


Create Table SinhVien
 (
   MaSV char(15) primary key,
   TenSV nvarchar(20) ,
   Gioitinh char(5) CHECK (Gioitinh IN ('Nam', 'Nu')),
   NgaySinh datetime ,
   QueQuan nvarchar(30) ,
   Diachi nvarchar(50) not null,
   Dienthoai varchar(10) check (Dienthoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
   Email char(30),
   MaLop char(5) foreign key references Lop (MaLop),
 )
 Insert into SinhVien(MaSV,TenSV,Gioitinh,NgaySinh,QueQuan,Diachi,Dienthoai,Email,MaLop) values
 ('SV1','Hoàng Văn A','Nam','6/6/2001',N'Hà Nội',N'Ba Đình Hà NỘi','9876543210','dat@gamil.com','C1')
 Insert into SinhVien(MaSV,TenSV,Gioitinh,NgaySinh,QueQuan,Diachi,Dienthoai,Email,MaLop) values
 ('SV2','Hoàng Văn C','Nam','1/26/2001',N'Hà Nội','Đống ĐA Hà NỘi','9876543211','C@gamil.com','C1')
 Insert into SinhVien(MaSV,TenSV,Gioitinh,NgaySinh,QueQuan,Diachi,Dienthoai,Email,MaLop) values
 ('SV20','Hoàng Văn Anh','Nu','6/2/2001',N'Huế','Đống Đa Hà NỘi','9876543219','y@gamil.com','C30')
 Insert into SinhVien(MaSV,TenSV,Gioitinh,NgaySinh,QueQuan,Diachi,Dienthoai,Email,MaLop) values
 ('SV5','Lê Ha','Nam','9/9/2001','Hà Nam',N'Ba Đình Hà NỘi','9876543218','z@gamil.com','C30')
  Insert into SinhVien(MaSV,TenSV,Gioitinh,NgaySinh,QueQuan,Diachi,Dienthoai,Email,MaLop) values
 ('SV9','Lê Nam','Nu','9/9/2001','Thai Binh',N'Ba Đình Hà NỘi','9876543299','99@gamil.com','C21')
  Insert into SinhVien(MaSV,TenSV,Gioitinh,NgaySinh,QueQuan,Diachi,Dienthoai,MaLop) values
 ('SV99','Lê Quỳnh','Nu','9/9/2000','Hà Tĩnh',N'Long Bien Hà NỘi','9876543288','C31')
 Select* from SinhVien

Create Table BangDiem
 (
   MaBD char(5) primary key,
   MaSV char(15) foreign key references SinhVien (MaSV),
   MaMH char(5) foreign key references MonHoc (MaMH),
   DiemHK float,
   Diemgiuaki float ,
   Diemchuyencan float
)
insert into BangDiem(MaBD,MaSV,MaMH,DiemHK,Diemgiuaki,Diemchuyencan) values ('BD1','SV1','L1',9,9,9)
insert into BangDiem(MaBD,MaSV,MaMH,DiemHK,Diemgiuaki,Diemchuyencan) values ('BD11','SV2','L1',9,9,9)
insert into BangDiem(MaBD,MaSV,MaMH,DiemHK,Diemgiuaki,Diemchuyencan) values ('BD2','SV1','L2',5,9,8)
insert into BangDiem(MaBD,MaSV,MaMH,DiemHK,Diemgiuaki,Diemchuyencan) values ('BD6','SV20','T3',9,10,9)
insert into BangDiem(MaBD,MaSV,MaMH,DiemHK,Diemgiuaki,Diemchuyencan) values ('BD88','SV9','T2',6,8,6)
select * from BangDiem




