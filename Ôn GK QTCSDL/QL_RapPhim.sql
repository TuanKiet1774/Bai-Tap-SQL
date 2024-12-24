create database RapChieuPhim;
use RapChieuPhim;

create table Rap(
MaRap varchar(10) constraint pk_rap primary key,
TenRap nvarchar(30),
Diachi nvarchar(50),
TongSoGhe int,
)

create table Phim(
MaPhim varchar(10) constraint pk_phim primary key,
TenPhim nvarchar(30),
NamSanXuat int,
HangSanXuat nvarchar(30)
)

create table XuatChieu(
MaXuatChieu varchar(5) constraint pk_xuatchieu primary key,
TenXuat nvarchar(10),
TuGio time,
GiaVe money
)

create table BanVe(
Ngay datetime,
MaRap varchar(10) constraint fk_bv_r foreign key (MaRap) references Rap(MaRap),
MaXuatChieu varchar(5)constraint fk_bv_xc foreign key (MaXuatChieu) references XuatChieu(MaXuatChieu),
MaPhim varchar(10) constraint fk_bv_p foreign key (MaPhim) references Phim(MaPhim),
SoVeBan int
constraint pk_bv primary key (Ngay, MaRap, MaXuatChieu),
)

insert into Rap values
('MN',N'Rap Mini',N'21 Hoàng Hoa Thám',200),
('TT',N'Rap Tân Tiến',N'8 Lê Thành Phương', 300),
('CGV',N'Rap CGV Nha Trang',N'754 Vĩnh Hiệp, Nha Trang',400),
('LTN',N'Rap Lote Thái Nguyên', N'60 Thái Nguyên, Phước Tân',500),
('LTP',N'Rap lote Trần Phú', N'78 Trần Phú, P.Lộc Thọ', 500)

insert into Phim values 
('P001',N'Lời Nguyền Huyết Ngải',2021,N'Giải Phóng'),
('P002',N'King Kong',2020,N'Universal'),
('P003',N'Avengers: End Game',2019,N'Marvel Studios'),
('P004',N'Bố Già',2021,N'Trấn Thành Town HKFilm'),
('P005',N'Nghê Siêu Dễ',2023,N'Thu Trang Entertainment')

select * from Phim
insert into XuatChieu values
('S1',N'Sáng','09:00',30.000),
('S2',N'Sáng','09:30',35.000),
('C1',N'Chiều','14:00',45.000),
('C2',N'Chiều','16:30',45.000),
('T1',N'Tối','18:45',55.000),
('T2',N'Tối','20:00',50.000)

insert into BanVe values
('2023-07-17','CGV','C2','P003',30),
('2023-12-17','LTN','S1','P004',50),
('2023-04-02','LTP','T1','P002',40),
('2023-10-17','TT','C1','P001',20),
('2023-10-30','TT','T2','P005',60)


--Câu 2
--a. Phim đạt doanh thu cao nhất trong tháng 10/2023 (Mã phim, tên phim, hãng sản xuất, doanh thu)
select top 1 with ties  p.MaPhim as 'Mã phim', p.TenPhim as 'Tên phim', p.HangSanXuat as 'Hãng sản xuất',
sum(bv.SoVeBan * xc.GiaVe) as 'Doanh thu'
from Phim p inner join BanVe bv on bv.MaPhim = p.MaPhim
inner join XuatChieu xc on xc.MaXuatChieu = bv.MaXuatChieu
where month(bv.Ngay) = 10 and year(bv.Ngay) = 2023
group by p.MaPhim, p.TenPhim, p.HangSanXuat
order by 'Doanh thu' desc

--b. Tính số vé bán được theo từng phim của từng rap tháng 12/2023
select p.TenPhim as'Phim', r.TenRap as 'Rạp' ,sum(bv.SoVeBan) as'Số vé đã bán' 
from  Phim p inner join BanVe bv on p.MaPhim = bv.MaPhim 
inner join Rap r on r.MaRap = bv.MaRap
where month(bv.Ngay) = 12 and year(bv.Ngay) = 2023
group by p.TenPhim,r.TenRap

--c. Liệt kê các phim có chiếu nhưng không có khán giả nào xem (Mã phim, tên phim, hãng sản xuất, năm sản xuất)
select p.MaPhim as 'Mã phim', p.TenPhim as 'Tên phim', p.HangSanXuat as 'Hãng SX', p.NamSanXuat as 'Năm' 
from Phim p inner join BanVe bv on bv.MaPhim = p.MaPhim
where bv.SoVeBan is null

--d. Bổ sung cho các rap có số ghế dưới 30, mỗi rap thêm 20 ghế
update Rap set TongSoGhe = TongSoGhe + 20 where TongSoGhe < 30

--e. Cho biết 2 phim có đông khán giả nhất năm 2023 (Mã phim, tên phim, số khán giả)
select top 2 with ties p.MaPhim as 'Mã', p.TenPhim as 'Phim', sum(bv.SoVeBan) as 'Số khán giả' 
from Phim p inner join BanVe bv on bv.MaPhim = p.MaPhim
where year(bv.Ngay) = 2023
group by p.MaPhim, p.TenPhim
order by sum(bv.SoVeBan) desc

--f. Liệt kê tên phim chiếu trong tất cả các rạp
select r.TenRap as 'Rạp phim', p.TenPhim as 'Phim' from Phim p inner join BanVe bv on bv.MaPhim = p.MaPhim
inner join Rap r on r.MaRap = bv.MaRap

--Câu 3
--a. Tạo thủ tục cho phép chèn dữ liệu vào bảng BanVe
create proc Chen_BanVe
@Ngay datetime,
@MaRap varchar(10),
@MaXuatChieu varchar(5),
@MaPhim varchar(10),
@SoVeBan int
as
begin insert into BanVe (Ngay, MaRap, MaXuatChieu, MaPhim, SoVeBan)
values (@Ngay, @MaRap, @MaXuatChieu, @MaPhim, @SoVeBan) end

--Vd minh họa
exec Chen_BanVe '2023-03-25', 'LTN', 'S1', 'P002', 100;

--b. Tạo hàm trả về một bảng, liệt kê thông tin các rạp có chiếu phim 'Lời Nguyền Huyết Ngãi' 
--(Tên rạp, Địa chỉ, ngày chiếu, xuất chiếu, Tổng số vé bán được )
create function LietKeThongTin () 
returns table
as return (
select r.TenRap as 'Rạp', r.DiaChi as 'Địa chỉ', bv.Ngay as 'Ngày chiếu', xc.TenXuat as 'Xuất chiếu',
sum(bv.SoVeBan) as 'Tổng số vé'
from Rap r inner join BanVe bv on bv.MaRap = r.MaRap
inner join Phim p on p.MaPhim = bv.MaPhim
inner join XuatChieu xc on xc.MaXuatChieu = bv.MaXuatChieu
where p.TenPhim = N'Lời Nguyền Huyết Ngải'
group by r.TenRap, r.DiaChi, bv.Ngay, xc.TenXuat
)

--Vd minh họa
select * from LietKeThongTin()