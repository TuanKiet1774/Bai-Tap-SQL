create database QL_HangHoa;
use QL_HangHoa;

create table KHACHHANG(
MAKHACHHANG varchar(10) primary key,
TENCONGTY nvarchar(100),
TENGIAODICH nvarchar(100),
DIACHI nvarchar(100),
EMAIL varchar(20),
DIENTHOAI varchar(20),
FAX varchar(20),
)

create table NHANVIEN(
MANHANVIEN varchar(10) primary key,
HO nvarchar(10),
TEN nvarchar(10),
NGAYSINH date,
NGAYLAMVIEC date,
DIACHI nvarchar(100),
DIENTHOAI varchar(20),
LUONGCOBAN money,
PHUCAP money,
)

alter table NHANVIEN alter column DIENTHOAI varchar(20) null

create table NHACUNGCAP(
MACONGTY  varchar(10) primary key,
TENCONGTY nvarchar(100),
TENGIAODICH nvarchar(100),
DIACHI nvarchar(100),
DIENTHOAI  varchar(20),
FAX  varchar(20),
EMAIL varchar(20),
)

create table LOAIHANG(
MALOAIHANG varchar(10) primary key,
TENLOAIHANG nvarchar(100),
)

create table MATHANG(
MAHANG varchar(10) primary key,
TENHANG nvarchar(100),
MACONGTY varchar(10) foreign key references NHACUNGCAP(MACONGTY),
MALOAIHANG varchar(10) foreign key references LOAIHANG(MALOAIHANG),
SOLUONG decimal(10,2),
DONVITINH nvarchar(20),
GIAHANG money,
)

create table DONDATHANG(
SOHOADON varchar(10) primary key,
MAKHACHHANG varchar(10) foreign key references KHACHHANG(MAKHACHHANG),
MANHANVIEN varchar(10) foreign key references NHANVIEN(MANHANVIEN),
NGAYDATHANG datetime,
NGAYGIAOHANG datetime,
NGAYCHUYENHANG datetime,
NOIGIAOHANG nvarchar(100),
)

alter table DONDATHANG alter column NGAYDATHANG datetime null
alter table DONDATHANG alter column NGAYGIAOHANG datetime null
alter table DONDATHANG alter column NGAYCHUYENHANG datetime null
alter table DONDATHANG alter column NOIGIAOHANG nvarchar(100) null

create table CHITIETDATHANG(
SOHOADON varchar(10) foreign key references DONDATHANG(SOHOADON),
MAHANG varchar(10) foreign key references MATHANG(MAHANG),
GIABAN money,
SOLUONG decimal (10,2),
MUCGIAMGIA decimal (4,2),
primary key(SOHOADON,MAHANG),
)


insert into KHACHHANG values
('KH001', N'Công ty Á Châu', N'ACHAU', N'123 Đường Lạc Long Quân, Quận 1, TP.HCM', 'accompany@gmail.com', '0123456789', '0123456789'),
('KH002', N'Công ty Vinamilk', N'VINAMILK', N'456 Đường Ngô Quyền, Quận 2, TP.HCM', 'vnmcompany@gmail.com', '0987654321', '0987654321'),
('KH003', N'Công ty Chánh Hải', N'CHANHHAI', N'789 Đường Lý Thường Kiệt, Quận Đống Đa, Hà Nội', 'chcompany@gmail.com', '0967547231', '0967547231'),
('KH004', N'Công ty Việt Tiến', N'VIETTIEN', N'79 Đường Phạm Văn Đồng, Nha Trang, Khánh Hòa', 'vtcommpany@gmail.com', '0956483927', '0956483927'),
('KH005', N'Công ty Eco Phước Long', N'EPHUOCLONG', N'27 Tôn Thất Tùng, Đà Nẵng', 'eplcompany@gmail.com', '0125697428', '0125697428');

insert into NHANVIEN values 
('NV01', N'Đinh', N'Bá Tiến', '1985-09-01', '2010-01-01', N'731 Trần Hưng Đạo, Q1, TP.HCM', '0876543219', 5000000, 1000000),
('NV02', N'Võ', N'Thanh Tùng', '1975-08-12', '2014-10-02', N'638 Trần Hưng Đạo', '0326328921', 4500000, 900000),
('NV03', N'Trần', N'Thanh Tâm', '1982-07-31', '2012-08-03', N'853 Mai Thi Lưu, Q1, TP.HCM', '0987654325', 7000000, 1200000),
('NV04', N'Lê', N'Ngọc Quyên', '1990-10-10', '2016-03-31', N'450 Trưng Vương, Hà Nội', '0956688937', 6000000, 1000000),
('NV05', N'Trần', N'Minh Khang', '1993-09-24', '2017-05-05', N'Trần Bình Trọng, TP.HCM', '0562839491', 8000000, 2000000);

insert into NHACUNGCAP values
('CT01', N'Công ty Á Châu', N'ACHAU', N'123 Đường Lạc Long Quân, Quận 1, TP.HCM', '0876543219', '0876543219', 'accompany@gmail.com'),
('CT02', N'Công ty Vinamilk', N'VINAMILK', N'456 Đường Ngô Quyền, Quận 2, TP.HCM', '0987654321', '0987654321', 'vnmcompany@gmail.com'),
('CT03', N'Công ty Chánh Hải', N'CHANHHAI', N'89 Đường Lý Thường Kiệt, Quận Đống Đa, Hà Nội', '0967547231', '0967547231', 'chcompany@gmail.com'),
('CT04', N'Công ty Việt Tiến', N'VIETTIEN', N'79 Đường Phạm Văn Đồng, Nha Trang, Khánh Hòa', '0956483927', '0956483927', 'vtcommpany@gmail.com'),
('CT05', N'Công ty Eco Phước Long', N'EPHUOCLONG', N'27 Tôn Thất Tùng, Đà Nẵng', '0125697428', '0125697428', 'eplcompany@gmail.com');

insert into LOAIHANG values
('LH01', N'Thức ăn nhanh'),
('LH02', N'Vật liệu xây dựng'),
('LH03', N'Thực phẩm'),
('LH04', N'Mỹ phẩm'),
('LH05', N'Đồ gia dụng');

insert into MATHANG values
('MH01', N'Mì ăn liền', 'CT01', 'LH01', 100, N'Gói', 6000),
('MH02', N'Sữa tươi', 'CT02', 'LH03', 500, N'Hộp', 8000),
('MH03', N'Xi măng', 'CT03', 'LH02', 300, N'Bao', 50000),
('MH04', N'Kem chống nắng', 'CT05', 'LH04', 700, N'Tuýp', 200000),
('MH05', N'Bếp gas', 'CT04', 'LH05', 400, N'Cái', 3000000);

insert into DONDATHANG values
('HD01', 'KH001', 'NV01', '2023-12-03', '2023-12-05', '2023-12-06', N'123 Đường Lạc Long Quân, Quận 1, TP.HCM'),
('HD02', 'KH002', 'NV02', '2023-06-05', '2023-06-08', '2023-06-08', N'456 Đường Ngô Quyền, Quận 2, TP.HCM'),
('HD03', 'KH003', 'NV03', '2023-09-01', '2023-09-03', '2023-09-04', N'789 Đường Lý Thường Kiệt, Quận Đống Đa, Hà Nội'),
('HD04', 'KH004', 'NV04', '2023-04-11', '2023-04-13', '2023-04-14', N'79 Đường Phạm Văn Đồng, Nha Trang, Khánh Hòa'),
('HD05', 'KH005', 'NV05', '2023-02-04', '2023-02-05', '2023-02-06', N'27 Tôn Thất Tùng, Đà Nẵng');

insert into CHITIETDATHANG values
('HD01', 'MH01', 6000, 2, 10),
('HD02', 'MH02', 8000, 5, 10),
('HD03', 'MH03', 50000, 10, 20),
('HD04', 'MH04', 200000, 100, 30),
('HD05', 'MH05', 30000000, 4, 30);

select * from KHACHHANG
select * from NHANVIEN
select * from NHACUNGCAP
select * from MATHANG
select * from LOAIHANG
select * from DONDATHANG
select * from CHITIETDATHANG

--1 Cho biết danh sách các đối tác cung cấp hàng cho công ty
select ncc.TENCONGTY as 'Đối tác' from NHACUNGCAP ncc

--2 Cho biết mã hàng, tên hàng và số lượng của các mặt hàng hiện có trong công ty
select mh.MAHANG as 'Mã hàng', mh.TENHANG as 'Tên hàng', mh.SOLUONG as 'Số lượng' from MATHANG mh

--3 Cho biết họ tên, địa chỉ và năm bắt đầu làm việc của các nhân viên trong công ty
select nv.HO+' '+nv.TEN as 'Họ tên', nv.DIACHI as'Địa chỉ', year(nv.NGAYLAMVIEC) as 'Năm làm việc'from NHANVIEN nv

--4 Cho biết địa chỉ và điện thoại của nhà cung cấp có tên giao dịch VINAMILK
select ncc.DIACHI as 'Địa chỉ', ncc.DIENTHOAI 'Số điện thoại' from NHACUNGCAP ncc where ncc.TENGIAODICH like N'VINAMILK'

--5 Cho biết mã và tên các mặt hàng có giá > 100000 và số lượng hiện có ít hơn 50
select mh.MAHANG as'Mã hàng', mh.TENHANG as 'Tên hàng' from MATHANG mh where mh.GIAHANG > 100000 and mh.SOLUONG <50

--6 Cho biết mỗi mặt hàng trong công ty do ai cung cấp
select mh.TENHANG as 'Mặt hàng' ,ncc.TENCONGTY as 'Tên Công ty' 
from NHACUNGCAP ncc inner join MATHANG mh on mh.MACONGTY = ncc.MACONGTY
group by ncc.TENCONGTY, mh.TENHANG

--7 Công ty Việt Tiến đã cung cấp những mặt hàng nào
select mh.TENHANG as 'Mặt hàng'
from NHACUNGCAP ncc inner join MATHANG mh on mh.MACONGTY = ncc.MACONGTY
where ncc.TENCONGTY like N'Công ty Việt Tiến'

--8 Loại hàng thực phẩm do công ty nào cung cấp và địa chỉ của công ty đó
select ncc.TENCONGTY as 'Công ty'
from NHACUNGCAP ncc inner join MATHANG mh on mh.MACONGTY = ncc.MACONGTY
inner join LOAIHANG lh on lh.MALOAIHANG = mh.MALOAIHANG
where lh.TENLOAIHANG like N'Thực phẩm'

--9 Những khách hàng nào (Tên giao dịch) đã đặt mua mặt hàng Sữa hộp XYZ
select kh.TENGIAODICH as 'Khách hàng'
from KHACHHANG kh inner join DONDATHANG ddh on kh.MAKHACHHANG = ddh.MAKHACHHANG
inner join CHITIETDATHANG ct on ct.SOHOADON = ddh.SOHOADON
inner join MATHANG mh on mh.MAHANG = ct.MAHANG
where mh.TENHANG like N'%Sữa hộp%'

--10 Cho đơn hàng số 10 do ai đặt và do nhân viên nào lập, thời gian và địa điểm giao hàng là ở đâu?
select kh.TENCONGTY as 'Khách hàng' ,nv.HO+' '+nv.TEN as 'Nhân viên', ddh.NGAYGIAOHANG as 'Thời gian giao', ddh.NOIGIAOHANG as 'Địa điểm'
from KHACHHANG kh inner join DONDATHANG ddh on kh.MAKHACHHANG = ddh.MAKHACHHANG
inner join NHANVIEN nv on nv.MANHANVIEN = ddh.MANHANVIEN
where ddh.SOHOADON like 'HD10'

--11 Cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (Lương = lương cơ bản + phụ cấp)
select nv.HO+' '+nv.TEN as 'Nhân viên', nv.LUONGCOBAN + nv.PHUCAP as 'Lương'
from NHANVIEN nv

--12 Cho biết đơn đặt hàng số 3 đã đặt mua những mặt hàng nào và số tiền mà khách hàng phải trả cho mỗi mặt hàng là bao nhiêu 
--(Tiền phải trả = SOLUONG x GIABAN - SOLUONG X GIABAN X MUCGIAMGIA/100)
select mh.TENHANG as 'Mặt hàng của đơn số 3', (ct.SOLUONG*ct.GIABAN*(1-(ct.MUCGIAMGIA/100))) as 'Tiền trả'
from DONDATHANG dh inner join CHITIETDATHANG ct on ct.SOHOADON  = dh.SOHOADON
inner join MATHANG mh on mh.MAHANG = ct.MAHANG
where ct.SOHOADON like 'HD03'

--13 Hãy cho biết những khách hàng nào lại chính là đối tác cung cấp hàng cho công ty (Tức là có cùng tên giao dịch)
select kh.TENGIAODICH as 'Khách hàng'
from KHACHHANG kh inner join NHACUNGCAP ncc on kh.TENGIAODICH = ncc.TENGIAODICH

--14 Trong công ty có những nhân viên nào có cùng ngày sinh?
select nv1.HO + ' ' + nv1.TEN, nv1.HO + ' ' + nv1.TEN, nv1.NGAYSINH
from NHANVIEN nv1 inner join NHANVIEN nv2 on nv1.MANHANVIEN <> nv2.MANHANVIEN
where nv1.NGAYSINH = nv2.NGAYSINH

--15 Những đơn đặt hàng nào yêu cầu giao hàng ngay tại công ty đặt hàng và những đơn đó của công ty nào
select dh.SOHOADON, kh.TENCONGTY as 'Công ty đặt hàng'
from DONDATHANG dh
inner join KHACHHANG kh on dh.MAKHACHHANG = kh.MAKHACHHANG
where dh.NGAYGIAOHANG = dh.NGAYDATHANG

--16 Cho biết tên công ty, tên giao dịch, địa chỉ và điện thoại của các khách hàng và các nhà cung cấp hàng cho công ty
select distinct kh.TENCONGTY as 'Công ty', kh.TENGIAODICH as 'Giao dịch', kh.DIACHI as 'Địa chỉ', kh.DIENTHOAI as 'Điện thoại',
				ncc.TENCONGTY as 'Công ty nhà cung cấp', ncc.TENGIAODICH as 'Giao dịch nhà cung cấp', kh.DIACHI as 'Địa chỉ nhà cung cấp', kh.DIENTHOAI as 'Điện thoại nhà cung cấp'
from KHACHHANG kh, NHACUNGCAP ncc

--17 Những mặt hàng nào chưa từng được khách hàng đặt mua 
select mh.MAHANG as 'Mặt hàng chưa có người mua'
from MATHANG mh inner join CHITIETDATHANG ct on ct.MAHANG = mh.MAHANG
where mh.MAHANG not in (select distinct MAHANG from CHITIETDATHANG)

--18 Những nhân viên nào của công ty chưa từng lập bất kỳ một hóa đơn đặt hàng nào 
select nv.HO+' '+nv.TEN as 'Nhân viên chưa có đơn hàng nào'
from NHANVIEN nv inner join DONDATHANG dh on nv.MANHANVIEN = dh.MANHANVIEN
where nv.MANHANVIEN not in (select MANHANVIEN from DONDATHANG)

--19 Những nhân viên nào của công ty có lương cơ bản cao nhất
select top 1 nv.HO+' '+nv.TEN as 'Nhân viên có lương cơ bản cao nhất'
from NHANVIEN nv
order by nv.LUONGCOBAN desc

--20 Tổng số tiền mà khách hàng phải trả cho mỗi đơn đặt hàng là bao nhiêu
select mh.TENHANG as 'Mặt hàng', sum(ct.SOLUONG*ct.GIABAN*(1-(ct.MUCGIAMGIA/100))) as 'Tiền trả'
from KHACHHANG kh inner join DONDATHANG dh on dh.MAKHACHHANG = kh.MAKHACHHANG
inner join CHITIETDATHANG ct on ct.SOHOADON = dh.SOHOADON
inner join MATHANG mh on mh.MAHANG = ct.MAHANG
group by mh.TENHANG

--21 Trong năm 2021, những mặt hàng nào chỉ được đặt mua đúng một lần 
select mh.MAHANG ,mh.TENHANG as 'Mặt hàng'
from CHITIETDATHANG ct inner join MATHANG mh on mh.MAHANG = ct.MAHANG
inner join DONDATHANG dh on dh.SOHOADON = ct.SOHOADON
where year(dh.NGAYDATHANG) = 2021
group by mh.TENHANG, mh.MAHANG
having count(ct.SOHOADON) = 1

--22 Cho biết mỗi khách hàng đã phải bỏ ra bao nhiêu tiền để đặt mua mặt hàng
select kh.TENCONGTY as 'Khách hàng', sum(ct.SOLUONG*ct.GIABAN*(1-(ct.MUCGIAMGIA/100))) as 'Tiền trả'
from KHACHHANG kh inner join DONDATHANG dh on dh.MAKHACHHANG = kh.MAKHACHHANG
inner join CHITIETDATHANG ct on ct.SOHOADON = dh.SOHOADON
inner join MATHANG mh on mh.MAHANG = ct.MAHANG
group by kh.TENCONGTY

--23 Mỗi nhân viên của công ty đã lập bao nhiêu đơn đặt hàng (nếu chưa thì cho kết quả là 0)
select nv.MANHANVIEN as 'Mã nhân viên' ,nv.HO+' '+nv.TEN as 'Nhân viên', 
case 
when count(dh.SOHOADON) = 0 then 0
else count(dh.SOHOADON) end as 'Số đơn đặt hàng'
from NHANVIEN nv inner join DONDATHANG dh on dh.MANHANVIEN = nv.MANHANVIEN
group by nv.HO, nv.TEN, nv.MANHANVIEN

--24 Cho biết tổng số tiền hàng mà của hàng thu được trong mỗi tháng của năm 2021 (Thời gian được tính theo ngày đặt hàng)
select month(dh.NGAYDATHANG) as 'Tháng', sum(ct.SOLUONG*ct.GIABAN) as 'Tiền hàng' 
from CHITIETDATHANG ct inner join DONDATHANG dh on dh.SOHOADON = ct.SOHOADON
where  year(dh.NGAYDATHANG) = 2021
group by  month(dh.NGAYDATHANG)

--25 Hãy cho biết tổng số tiền lời mà công ty thu được từ mỗi mặt hàng trong năm 2021
select mh.MAHANG as 'Mã hàng', mh.TENHANG as 'Tên hàng', sum((ct.SOLUONG*ct.GIABAN*(1-(ct.MUCGIAMGIA/100))) - (ct.SOLUONG*mh.GIAHANG)) as 'Tiền lời'
from MATHANG mh inner join CHITIETDATHANG ct on ct.MAHANG = mh.MAHANG
inner join DONDATHANG dh on dh.SOHOADON = ct.SOHOADON
where year(dh.NGAYDATHANG) = 2023
group by mh.MAHANG, mh.TENHANG

--26 Hãy cho biết tổng số lượng mặt hàng của mỗi mặt hàng mà công ty đã có (Tổng số hàng hiện có và đã bán)
select mh.MAHANG as 'Mã', mh.TENHANG as 'Tên hàng', sum(mh.SOLUONG) as 'Tổng số hàng'
from MATHANG mh
inner join CHITIETDATHANG ct ON mh.MAHANG = ct.MAHANG
group by mh.MAHANG, mh.TENHANG

--27 Nhân viên nào của công ty bán được số lượng mặt hàng nhiều nhất và số lượng mặt hàng bán được là bao nhiêu
select top 1 with ties nv.HO+' '+nv.TEN as 'Nhân viên ', sum(ct.SOLUONG) as 'Số lượng hàng'
from NHANVIEN nv inner join DONDATHANG dh on dh.MANHANVIEN = nv.MANHANVIEN
inner join CHITIETDATHANG ct on ct.SOHOADON = dh.SOHOADON
group by nv.HO, nv.TEN
order by  sum(ct.SOLUONG) desc

--28 Đơn đặt hàng có số lượng mặt hàng được đặt mua ít nhất
select top 1 with ties dh.SOHOADON, count(*) as 'Số lượng đặt hàng'
from DONDATHANG dh
inner join CHITIETDATHANG ct on dh.SOHOADON = ct.SOHOADON
group by dh.SOHOADON
order by count(*) asc

--29 Số tiền nhiều nhất mà mỗi khách hàng đã từng bỏ ra để đặt hàng trong các đơn đặt hàng là bao nhiêu
select kh.TENCONGTY as 'Tên khách hàng' ,sum(ct.SOLUONG * ct.GIABAN- ct.SOLUONG * ct.GIABAN * ct.MUCGIAMGIA/100) 'Tiền khách bỏ ra nhiều nhất'
from KHACHHANG kh inner join DONDATHANG dh on kh.MAKHACHHANG = dh.MAKHACHHANG
inner join CHITIETDATHANG ct on dh.SOHOADON = ct.SOHOADON
group by kh.TENCONGTY
order by 1 desc

--30 Thống kê xem mỗi mặt hàng trong mỗi tháng và trong cả năm 2021, bán được với số lượng là bao nhiêu.
-- Kết quả được hiển thị dưới dạng bảng, hai cột đầu là mã hàng và tên hàng, các cột còn lại tương ứng với các tháng từ 1 đến 12 và cả năm
select mh.MAHANG as 'Mã hàng', mh.TENHANG as 'Tên hàng',
    sum(case when month(NGAYDATHANG) = 1 then ct.SOLUONG else 0 end) as 'Tháng 1',
    sum(case when month(NGAYDATHANG) = 2 then ct.SOLUONG else 0 end) as 'Tháng 2',
    sum(case when month(NGAYDATHANG) = 3 then ct.SOLUONG else 0 end) as 'Tháng 3',
    sum(case when month(NGAYDATHANG) = 4 then ct.SOLUONG else 0 end) as 'Tháng 4',
    sum(case when month(NGAYDATHANG) = 5 then ct.SOLUONG else 0 end) as 'Tháng 5',
    sum(case when month(NGAYDATHANG) = 6 then ct.SOLUONG else 0 end) as 'Tháng 6',
    sum(case when month(NGAYDATHANG) = 7 then ct.SOLUONG else 0 end) as 'Tháng 7',
    sum(case when month(NGAYDATHANG) = 8 then ct.SOLUONG else 0 end) as 'Tháng 8',
    sum(case when month(NGAYDATHANG) = 9 then ct.SOLUONG else 0 end) as 'Tháng 9',
    sum(case when month(NGAYDATHANG) = 10 then ct.SOLUONG else 0 end) as 'Tháng 10',
    sum(case when month(NGAYDATHANG) = 11 then ct.SOLUONG else 0 end) as 'Tháng 11',
    sum(case when month(NGAYDATHANG) = 12 then ct.SOLUONG else 0 end) as 'Tháng 12',
    sum(ct.SOLUONG) as 'Cả năm 2021'
from MATHANG mh
inner join CHITIETDATHANG ct on mh.MAHANG = ct.MAHANG
inner join DONDATHANG dh on ct.SOHOADON = dh.SOHOADON
where year(dh.NGAYDATHANG) = 2021
group by mh.MAHANG, mh.TENHANG

--31 Cập nhật lại giá trị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG is null trong bảng DONDATHANG bằng với giá trị của trường NGAYDATHANG
update DONDATHANG set NGAYCHUYENHANG = NGAYDATHANG where NGAYCHUYENHANG is null

--32 Tăng số lượng hàng của những mặt hàng do công ty VINAMILK cung cấp lên gấp đôi
update MATHANG set SOLUONG = SOLUONG * 2 where MACONGTY like 'CT02'

--33 Cập nhật giá trị của trường NOIGIAOHANG trong bang DONDATHANG bằng địa chỉ của khách hàng đối với những đơn đặt hàng chưa xác định được nơi giao hàng
update DONDATHANG set NOIGIAOHANG = kh.DIACHI from KHACHHANG kh where NOIGIAOHANG is null 

--34 Cập nhật lại dữ liệu trong bảng KHACHHANG sao cho nếu tên công ty và tên giao dịch của khách hàng trùng với tên công ty và tên giao dịch của một nhà cung cấp nào đó 
--thì địa chỉ, điện thoại, fax và e-mail phải giống nhau
update KHACHHANG set DIACHI = ncc.DIACHI, DIENTHOAI = ncc.DIENTHOAI, FAX = ncc.FAX, EMAIL = ncc.EMAIL
from NHACUNGCAP ncc inner join KHACHHANG kh on kh.TENCONGTY = ncc.TENCONGTY and kh.TENGIAODICH = ncc.TENGIAODICH

--35 Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2018
update NHANVIEN set LUONGCOBAN = LUONGCOBAN * 1.5
where MANHANVIEN in (select MANHANVIEN from DONDATHANG ddh inner join CHITIETDATHANG ctdh on ddh.SOHOADON = ctdh.SOHOADON
					 where year(ddh.NGAYDATHANG) = 2018  group by MANHANVIEN having sum(ctdh.SOLUONG) > 100)
--36 Tăng phụ cắp lên bằng 50% lương cho những nhân viên bán được nhiều hàng nhất
update NHANVIEN set PHUCAP = LUONGCOBAN / 2
where MANHANVIEN in 
(select top 1 with ties nv.MANHANVIEN 
from NHANVIEN nv inner join DONDATHANG dh on dh.MANHANVIEN = nv.MANHANVIEN 
inner join CHITIETDATHANG ct on ct.SOHOADON = dh.SOHOADON
group by nv.MANHANVIEN
order by sum(ct.SOLUONG) desc )

--37 Giảm 25% lương của những nhân viên trong năm 2018 không lập được bất cứ đơn hàng nào
update NHANVIEN set LUONGCOBAN = LUONGCOBAN * 0.75
where MANHANVIEN in 
(select nv.MANHANVIEN from NHANVIEN nv inner join DONDATHANG dh ON nv.MANHANVIEN = dh.MANHANVIEN
where year(dh.NGAYDATHANG) = 2018 or dh.NGAYDATHANG is null group by nv.MANHANVIEN having count(dh.SOHOADON) = 0)

--38 Giả sử trong bảng DONDATHANG có thêm trường SOTIEN cho biết số tiền mà khách hàng phải trả cho mỗi đơn đặt hàng, Tính giá trị cho trường này.
alter table DONDATHANG add SOTIEN money
update DONDATHANG set SOTIEN = (select sum((SOLUONG * GIABAN) * (1 - MUCGIAMGIA/100))
from CHITIETDATHANG ct
where ct.SOHOADON = DONDATHANG.SOHOADON)

--39 Xóa khỏi bảng NHANVIEN những nhân viên đã làm việc trong công ty quá 40 năm 
delete from NHANVIEN where datediff(year, NGAYLAMVIEC, getdate()) >= 40;

--40 Xóa những đơn đặt hàng trước năm 2022 ra khỏi cơ sở dữ liệu
delete from DONDATHANG where year(NGAYDATHANG) < 2022

--41 Xóa khỏi bảng LOAIHANG những loại hàng hiện không có mặt hàng
delete from LOAIHANG where MALOAIHANG not in (select MALOAIHANG from MATHANG)

--42 Xóa khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty
delete from KHACHHANG where MAKHACHHANG not in (select MAKHACHHANG from DONDATHANG )

--43 Xóa khỏi bẳng MATHANG những mặt hàng có số lượng bằng 0 và không được đặt mua trong bất cứ đơn hàng nào
delete from MATHANG where SOLUONG = 0 and MAHANG not in (select MAHANG from CHITIETDATHANG)

--Bài tập chương 6
--1 Tạo thủ tục lưu trữ để thông qua thủ tục này có thể bổ sung thêm một bản ghi mới cho bảng MATHANG 
--(thủ tục phải thực hiện kiểm tra tính hợp lệ của dữ liệu cần bổ sung: không trùng khoá chính và đảm bảo toàn vẹn tham chiếu)
create proc sp_THEMMATHANG (
	@MAHANG varchar(10),
	@TENHANG nvarchar(100),
	@MACONGTY varchar(10),
	@MALOAIHANG varchar(10),
	@SOLUONG decimal(10,2),
	@DONVITINH nvarchar(20),
	@GIAHANG money
)as
begin set nocount on;
    if exists (select 1 from MATHANG where MAHANG = @MAHANG)
    begin
        print N'ĐÃ trùng khóa chính';
        return;
    end
    if not exists (select 1 from NHACUNGCAP where MACONGTY = @MACONGTY)
    begin
        print N'Chưa có mã công ty của nhà cung cấp này';
        return;
    end
    if not exists (select 1 from LOAIHANG where MALOAIHANG = @MALOAIHANG)
    begin
        print N'Chưa có mã loại hàng này';
        return;
    end
    insert into MATHANG (MAHANG, TENHANG, MACONGTY, MALOAIHANG, SOLUONG, DONVITINH, GIAHANG)
    values (@MAHANG, @TENHANG, @MACONGTY, @MALOAIHANG, @SOLUONG, @DONVITINH, @GIAHANG);
end

--2 Tạo thủ tục lưu trữ có chức năng thống kê tổng số lượng hàng bán được của một mặt hàng có mã bất kỳ (mã mặt hàng cần thống kê là tham số của thủ tục).
create proc thong_ke @MaHang varchar(10)
as
begin
    select sum(SOLUONG) as 'Thống kê' from CHITIETDATHANG where MAHANG = @MaHang;
end

--3 Viết hàm trả về một bảng trong đó cho biết tổng số lượng hàng bán được của mỗi mặt hàng. Sử dụng hàm này để thống kê xem tổng số lượng hàng (hiện có và đã bán) của mỗi mặt hàng là bao nhiêu
create function Bang_thong_ke ()
returns table
as
return 
(
    select M.MAHANG as 'Mã Hàng', M.TENHANG as 'Tên Hàng', isnull(sum(D.SOLUONG), 0) as 'Số lượng'
    from MATHANG M inner join CHITIETDATHANG D on M.MAHANG = D.MAHANG
    group by M.MAHANG, M.TENHANG
)

--4 Viết trigger cho bảng CHITIETDATHANG theo yêu cầu sau:
--4.1 Khi một bản ghi mới được bổ sung vào bảng này thì giảm số lượng hàng hiện có nếu số lượng hàng hiện có lớn hơn hoặc bằng số lượng hàng được bán ra. Ngược lại thì huỷ bỏ thao tác bổ sung.
create trigger GiamSoLuongHang 
on CHITIETDATHANG
after insert
as
begin
set nocount on;
    declare @MAHANG varchar(10);
    declare @SOLUONG_BAN decimal(10,2);

    select @MAHANG = inserted.MAHANG, @SOLUONG_BAN = inserted.SOLUONG 
    from inserted;

    declare @SOLUONG_HIENTAI decimal(10,2);
    select @SOLUONG_HIENTAI = SOLUONG from MATHANG where MAHANG = @MAHANG;

    if @SOLUONG_HIENTAI >= @SOLUONG_BAN
    begin
        update MATHANG set SOLUONG = @SOLUONG_HIENTAI - @SOLUONG_BAN
        where MAHANG = @MAHANG;
    end
    else
    begin
        print N'Số lượng hàng hiện có không đủ để bán';
    end
end

--4.2 Khi cập nhật lại số lượng hàng được bán, kiểm tra số lượng hàng được cập nhật lại có phù hợp hay không (số lượng hàng bán ra không được vượt quá số lượng hàng hiện có và không được nhỏ hơn 1). 
--Nếu dữ liệu hợp lệ thì giảm (hoặc tăng) số lượng hàng hiện có trong công ty, ngược lại thì huỷ bỏ thao tác cập nhật.
create trigger KiemTraCapNhatSoLuongHang
on CHITIETDATHANG
after update
as
begin
    set nocount on;

    declare @MAHANG varchar(10);
    declare @SOLUONG_BAN_CU decimal(10,2);
    declare @SOLUONG_BAN_MOI decimal(10,2);

    select @MAHANG = inserted.MAHANG, @SOLUONG_BAN_CU = deleted.SOLUONG, @SOLUONG_BAN_MOI = inserted.SOLUONG 
    from inserted inner join deleted on inserted.SOHOADON = deleted.SOHOADON AND inserted.MAHANG = deleted.MAHANG;

    declare @SOLUONG_HIENTAI decimal(10,2);
    select @SOLUONG_HIENTAI = SOLUONG from MATHANG where MAHANG = @MAHANG;

    if @SOLUONG_BAN_MOI >= 1 AND @SOLUONG_BAN_MOI <= @SOLUONG_HIENTAI + @SOLUONG_BAN_CU
    begin
        update MATHANG set SOLUONG = @SOLUONG_HIENTAI + @SOLUONG_BAN_CU - @SOLUONG_BAN_MOI
        where MAHANG = @MAHANG;
    end
    else
    begin
        print N'Số lượng hàng được cập nhật không hợp lệ'
    end
end

--5 Viết trigger cho bảng CHITIETDATHANG để sao cho chỉ chấp nhận giá hàng bán ra phải lớn hơn hoặc bằng giá gốc (giá của mặt hàng trong bàng MATHANG).
create trigger CHECKGIA  
on CHITIETDATHANG 
for insert , update  as
begin
    if update(GIABAN)
		if exists (select inserted.mahang from MATHANG inner join INSERTED on MATHANG.MAHANG=INSERTED.MAHANG
		where MATHANG.GIAHANG<inserted.GIABAN)
		rollback transaction
end