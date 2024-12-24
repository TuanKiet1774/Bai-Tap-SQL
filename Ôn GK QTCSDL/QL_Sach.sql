create database QL_Sach;
use QL_Sach;

create table NguoiMuon(
MSNM varchar(5) constraint pk_msnm primary key,
HoLotNM nvarchar(30),
TenNM nvarchar(10),
Doi smallint,
Thon nvarchar(50)
)

create table PhanLoai(
MPL varchar(10) constraint pk_pl primary key,
ThongTinPL nvarchar(50),
)

create table NXB(
MSNXB varchar(5) constraint pk_nxb primary key,
TenNXB nvarchar(50),
)

create table Sach(
MSSACH varchar(10) constraint pk_mss primary key,
TenSach nvarchar(50),
MPL varchar(10) constraint fk_s_pl foreign key (MPL) references PhanLoai(MPL),
MSNXB varchar(5) constraint fk_s_nxb foreign key (MSNXB) references NXB(MSNXB),
)

create table ChiTietMS(
MSNM varchar(5) constraint fk_ctms_nm foreign key (MSNM) references NguoiMuon(MSNM),
MSSACH varchar(10) constraint fk_ctms_mss foreign key (MSSACH) references Sach(MSSACH),
NgayMuon date,
NgayTra date null,
constraint pk_ctms primary key (MSNM,MSSACH,NgayMuon)
)

insert into NguoiMuon values
('TN001',N'Nguyễn Văn',N'Mít',01,N'Thôn Đoài'),
('TN002',N'Lê Thị Mỹ',N'Xoài',02,N'Thôn Đông'),
('TN003',N'Võ Thị',N'Cam',03,N'Thôn Tây'),
('TN004',N'Vũ Minh',N'Đào',04,N'Thôn Nam'),
('TN005',N'Phạm Thị',N'Hồng',05,N'Thôn Bắc')

insert into PhanLoai values
('KTNN56',N'Kỹ thuật nuôi vit cỏ'),
('VHTD09',N'Địa lý thế giới'),
('CNTT23',N'Khoa học máy tính cơ bản'),
('VHTD13',N'Lịch sử thế giới hiện đại'),
('VHTD17',N'Văn học Việt Nam hiện đại')

insert into NXB values 
('GD00',N'NXB Giáo dục'),
('KHKT',N'NXB Khoa học kỹ thuật'),
('XH00', N'NXB Xã hội'),
('VH00', N'NXB Văn hóa'),
('QT00', N'NXB Quốc tế')

insert into Sach values
('NN0024',N'Kỹ thuật nuôi vit cỏ','KTNN56','KHKT'),
('TS0035', N'Địa lý thế giới', 'VHTD09', 'GD00'),
('CN0042', N'Khoa học máy tính cơ bản', 'CNTT23', 'KHKT'),
('LS0057', N'Lịch sử thế giới hiện đại', 'VHTD13', 'XH00'),
('VH0065', N'Văn học Việt Nam hiện đại', 'VHTD17', 'VH00')

insert into ChiTietMS values
('TN001', 'VH0065', '2021-03-12', '2021-03-15'),
('TN002', 'NN0024', '2021-11-07', null),
('TN003', 'LS0057', '2021-03-27', null),
('TN004', 'TS0035', '2021-05-07', '2021-05-10'),
('TN005', 'CN0042', '2021-07-17', '2021-07-25')

select * from NguoiMuon
select * from ChiTietMS
select * from Sach
select * from PhanLoai
select * from NXB

--Câu 2
--a. Liệt kê những cuốn sách người mượn trước ngày 1/4/2021 nhưng chưa trả (Mã sách, tên sách, họ tên người mượn, ngày mượn, số ngày quá hạn)
select s.MSSACH, s.TenSach, nm.HoLotNM+' '+nm.TenNM as 'Ngươi mượn', ct.NgayMuon, datediff(day,ct.NgayMuon,getdate()) as 'Số ngày quá hạn'
from Sach s inner join ChiTietMS ct on ct.MSSACH = s.MSSACH
inner join NguoiMuon nm on nm.MSNM = ct.MSNM
where ct.NgayMuon < '2021-04-01' and ct.NgayTra is null
group by s.MSSACH, s.TenSach,nm.HoLotNM+' '+nm.TenNM, ct.NgayMuon

--b. Đếm số người mượn theo từng thôn của từng quý năm 2021
select nm.Thon as 'Thôn', 
case
when month(NgayMuon) between 1 and 3 then 'Quý 1'
when month(NgayMuon) between 4 and 6 then 'Quý 2'
when month(NgayMuon) between 7 and 9 then 'Quý 3'
else 'Quý 4'
end as 'Quý',
count(nm.MSNM) as 'Số lượng'
from NguoiMuon nm inner join ChiTietMS ct on ct.MSNM = nm.MSNM
where year(ct.NgayMuon) = 2021
group by nm.Thon,
case
when month(NgayMuon) between 1 and 3 then 'Quý 1'
when month(NgayMuon) between 4 and 6 then 'Quý 2'
when month(NgayMuon) between 7 and 9 then 'Quý 3'
else 'Quý 4'
end

--c. Cho biết tên 2 phân loại có số lượng sách nhiều nhất
select top 2 pl.ThongTinPL as 'Thông tin', count(s.MSSACH) as 'Số lượng sách'
from PhanLoai pl inner join Sach s on s.MPL = pl.MPL
group by pl.ThongTinPL
order by count(s.MSSACH) desc

--d. Tính tiền phạt cho các cuốn sách mượn quá 20 ngày, biết mỗi ngày phạt 1000 đồng
select nm.TenNM as 'Người mượn', s.TenSach as 'Sách', datediff(day,ct.NgayMuon,getdate()) - 20 as 'Số ngày trễ', 
case
when datediff(day,ct.NgayMuon,getdate()) > 20 then (datediff(day,ct.NgayMuon,getdate()) - 20) * 1.000
else 0
end as 'Tiền phạt'
from Sach s inner join ChiTietMS ct on ct.MSSACH = s.MSSACH
inner join NguoiMuon nm on nm.MSNM = ct.MSNM
where ct.NgayTra is null and datediff(day,ct.NgayMuon,getdate()) > 20

--e. Liệt kê tên các nhà xuất bản có 10 (2) đầu sách trở lên
select n.TenNXB as 'Nhà xuất bản', count(s.MSSACH) as 'Số đầu sách'
from NXB n inner join Sach s on s.MSNXB = n.MSNXB
group by n.TenNXB
having count(s.MSSACH) >= 2

--f. Liệt kê tên những người mượn có mượn tất cả các sách của thư viện
select nm.HoLotNM+' '+nm.TenNM as 'Người mượn' from NguoiMuon nm
where not exists (select * from Sach s where not exists (select * from ChiTietMS ct where ct.MSNM = nm.MSNM and s.MSSACH = ct.MSSACH))

--Câu 3
--a. Tạo thủ tục cho phép chèn dữ liệu vào bảng ChiTietMS
create proc Chen_DL
@MSNM varchar(5),
@MSSACH varchar(10),
@NgayMuon date,
@NgayTra date
as begin 
insert into ChiTietMS (MSNM,MSSACH,NgayMuon,NgayTra)
values (@MSNM,@MSSACH,@NgayMuon,@NgayTra) end

-- Minh họa sử dụng thủ tục
exec Chen_DL 'TN003', 'VH0065', '2021-12-10', '2021-12-17'

--b. Hàm tạo trả về một bảng thống kê thông tin của tất cả các sách và tổng số lần được mượn của mỗi sách
--(Mã sách, tên sách, tên nhà xuất bản, tổng số lần mượn)
create function ThongKe() 
returns table
as return (
select s.MSSACH as 'Mã sách', s.TenSach as 'Sách', n.TenNXB as 'Nhà Xuất Bản', count(ct.MSNM) as 'Số lần mượn'
from ChiTietMS ct inner join Sach s on ct.MSSACH = s.MSSACH 
inner join NXB n on n.MSNXB = s.MSNXB
group by s.MSSACH , s.TenSach , n.TenNXB
)

--Minh họa sử dụng hàm
select * from ThongKe();