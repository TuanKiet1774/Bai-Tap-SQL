create database QL_BongDa;
use QL_BongDa;

create table TINH(
MATINH varchar(5) constraint pk_mt primary key,
TENTINH nvarchar(100),
)

create table QUOCGIA(
MAQG varchar(5) constraint pk_mqg primary key,
TENQG nvarchar(60),
)

create table SANVD(
MASAN varchar(5) constraint pk_ms primary key,
TENSAN nvarchar(100),
DIACHI nvarchar(200),
)

create table HUANLUYENVIEN(
MAHLV varchar(5) constraint pk_mhlv primary key,
TENHLV nvarchar(100),
NGAYSINGH datetime,
DIACHI nvarchar(200),
DIENTHOAI nvarchar(20),
MAQG varchar(5) constraint fk_HLV_QG foreign key (MAQG) references QUOCGIA(MAQG),
)

create table CAULACBO(
MACLB varchar(5) constraint pk_mclb primary key,
TENCLB nvarchar(100),
MASAN varchar(5) constraint fk_clb_s foreign key (MASAN) references SANVD(MASAN),
MATINH varchar(5) constraint fk_clb_t foreign key (MATINH) references TINH(MATINH),
)

create table HLV_CLB(
MAHLV varchar(5) constraint fk_hlvclb_hlv foreign key (MAHLV) references HUANLUYENVIEN(MAHLV),
MACLB varchar(5) constraint fk_hlvclb_clb foreign key (MACLB) references CAULACBO(MACLB),
VAITRO nvarchar(100),
)

create table CAUTHU(
MACT numeric identity(1,1) constraint pk_mct primary key,
HOTEN nvarchar(100) not null,
VITRI nvarchar(20) not null,
NGAYSINH datetime null,
DIACHI nvarchar(200) null,
MACLB varchar(5) not null constraint fk_ct_clb foreign key (MACLB) references CAULACBO(MACLB),
MAQG varchar(5) not null constraint fk_ct_qg foreign key (MAQG) references QUOCGIA(MAQG),
)

create table TRANDAU(
MATRAN numeric constraint pk_mtr primary key,
NAM int,
VONG int,
NGAYTD datetime,
MACLB1 varchar(5) constraint fk_td_clb foreign key (MACLB1) references CAULACBO(MACLB),
MACLB2 varchar(5) constraint fk_td_cl foreign key (MACLB2) references CAULACBO(MACLB),
MASAN varchar(5) constraint fk_td_sanvd foreign key (MASAN) references SANVD(MASAN),
KETQUA varchar(5),
)

create table BANGXH(
MACLB varchar(5) constraint fk_bxh_clb foreign key (MACLB) references CAULACBO(MACLB),
NAM int,
VONG int,
SOTRAN int,
THANG int,
HOA int, 
THUA int,
HIEUSO varchar(5),
DIEM int,
HANG int,
constraint pk_bangxh primary key(MACLB,NAM,VONG),
)

insert into QUOCGIA(MAQG,TENQG) values 
('VN',N'Vietek Nam'),
('ANH',N'Anh Quốc'),
('TBN',N'Tây Ban Nha'),
('BDN',N'Bồ Đào Nha'),
('BRA',N'Bra-xin'),
('ITA',N'Ý'),
('THA',N'Thái Lan');


insert into TINH(MATINH,TENTINH) values 
('BD',N'Bình Dương'),
('GL',N'Gia Lai'),
('DN',N'Đà Nẵng'),
('KH',N'Khánh Hòa'),
('PY',N'Phú Yên'),
('LA',N'Long An');

insert into SANVD(MASAN,TENSAN,DIACHI) values
('GD',N'Gò Đậu',N'123 QL1, TX Thủ Dầu Một, Bình Dương'),
('PL',N'Pleiku',N'22 Hồ Tùng Mậu, Thống Nhất, Thị Xẫ Pleiku, Gia Lai'),
('CL',N'Chi Lăng',N'127 Võ Văn Tần, Đà Nẵng'),
('NT',N'Nha Trang',N'128 Phan Chu Trinh, Nha Trang, Khánh Hòa'),
('TH',N'Tuy Hòa',N'57 Trường Chinh, Tuy Hòa, Phú Yên'),
('LA',N'Long An',N'102 Hùng Vương, Tp Tân An, Long An');

insert into CAULACBO(MACLB,TENCLB,MASAN,MATINH) values 
('BBD',N'BECAMEX BÌNH DƯƠNG','GD','BD'),
('HAGL',N'HOÀNG ANH GIA LAI','PL','GL'),
('SDN',N'SHB ĐÀ NẴNG','CL','DN'),
('KKH',N'KHATOCO KHÁNH HÒA','NT','KH'),
('TPY',N'THÉP PHÚ YÊN','TH','PY'),
('GDT',N'GẠCH ĐỒNG TÂM LONG','LA','LA');

alter table CAUTHU add SO int;
insert into CAUTHU(HOTEN,VITRI,NGAYSINH,DIACHI,MACLB,MAQG,SO) values
(N'Nguyễn Vũ Phong',N'Tiền vệ','1990/02/20',N'NULL','BBD','VN',17),
(N'Nguyễn Công Vinh',N'Tiền đạo','1992/03/10',N'NULL','HAGL','VN',9),
(N'Trần Tấn Tài',N'Tiền vệ','1999/11/12',N'NULL','BBD','VN',8),
(N'Phan Hồng Sơn',N'Thủ môn','1991/06/10',N'NULL','HAGL','VN',1),
(N'Ronaldo',N'Tiền vệ','1989/10/12',N'NULL','SDN','BRA',7),
(N'Robinho',N'Tiền vệ','1989/10/12',N'NULL','SDN','BRA',8),
(N'Vidic',N'Hậu vệ','1987',N'NULL','HAGL','ANH',3),
(N'Trần Văn Santos',N'Thủ môn','1990/10/21',N'NULL','BBD','BRA',1),
(N'Nguyễn Trường Sơn',N'Hậu vệ','1993/08/26',N'NULL','BBD','VN',4);


insert into HUANLUYENVIEN (MAHLV,TENHLV,NGAYSINGH,DIACHI,DIENTHOAI,MAQG) values
('HLV01',N'Vital','1975/10/15',N'NULL',N'0918011078','BDN'),
('HLV02',N'Lê Huỳnh Đức','1972/05/20',N'NULL',N'01223456789','VN'),
('HLV03',N'Kiatisuk','1970/12/11',N'NULL',N'01990123456','THA'),
('HLV04',N'Hoàng Anh Tuấn','1970/09/11',N'NULL',N'0989112233','VN'),
('HLV05',N'Trần Công Minh','1973/07/07',N'NULL',N'0909099990','VN'),
('HLV06',N'Trần Văn Phúc','1975/03/02',N'NULL',N'01650101234','VN');

insert into HLV_CLB(MAHLV,MACLB,VAITRO) values 
('HLV01','BBD',N'HLV Chính'),
('HLV02','',N'HLV Chính'),
('HLV03','',N'HLV Chính'),
('HLV04','',N'HLV Chính'),
('HLV05','',N'HLV Chính'),
('HLV06','',N'HLV Thủ môn');

insert into TRANDAU(MATRAN,NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values
(1,2023,1,'2023/02/07','BBD','SDN','GD','3-0'),
(2,2023,1,'2023/03/07','KKH','GDT','NT','1-1'),
(3,2023,2,'2023/02/16','SDN','KKH','CL','2-2'),
(4,2023,2,'2023/02/16','TPY','BBD','TH','5-0'),
(5,2023,3,'2023/03/01','TPY','GDT','TH','0-2'),
(6,2023,3,'2023/03/01','KKH','BBD','NT','0-1'),
(7,2023,4,'2023/03/07','KKH','TPY','NT','1-0'),
(8,2023,4,'2023/03/07','BBD','GDT','GD','2-2');

insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values 
('BBD',2023,1,1,1,0,0,'3-0',3,1),
('KKH',2023,1,1,0,1,0,'1-1',1,2),
('GDT',2023,1,1,0,0,0,'1-1',1,3),
('TPY',2023,1,0,0,0,0,'0-0',0,4),
('SDN',2023,1,1,0,0,1,'0-3',0,5),
('TPY',2023,2,1,1,0,0,'5-0',3,1),
('BBD',2023,2,2,1,0,1,'3-5',3,2),
('KKH',2023,2,2,0,2,0,'3-3',2,3),
('GDT',2023,2,1,0,1,0,'1-1',1,4),
('SDN',2023,2,2,1,1,0,'2-5',1,5),
('BBD',2023,3,3,2,0,1,'4-5',6,1),
('GDT',2023,3,2,1,1,0,'3-1',4,2),
('TPY',2023,3,2,1,0,1,'5-2',3,3),
('KKH',2023,3,3,0,2,1,'3-4',2,4),
('SDN',2023,3,2,1,1,0,'2-5',1,5),
('BBD',2023,4,4,2,1,1,'6-7',7,1),
('GDT',2023,4,3,1,2,0,'5-1',5,2),
('KKH',2023,4,4,1,2,1,'4-4',5,3),
('TPY',2023,4,3,1,0,2,'5-3',3,4),
('SDN',2023,4,2,1,1,0,'2-5',1,5);

select * from QUOCGIA
select * from TINH
select * from SANVD
select * from CAULACBO
select * from CAUTHU
select * from HUANLUYENVIEN
select * from HLV_CLB
select * from TRANDAU
select * from BANGXH

--1 Cho biết thông tin (Mã cầu thủ, họ tên, số áo, vị trí, ngày sinh, địa chỉ) của tất cả các cầu thủ
select MACT as 'Mã cầu thủ', HOTEN as'Tên cầu thủ', SO as 'Số áo', VITRI as 'Vị trí',NGAYSINH as 'Ngày sinh', DIACHI as 'Địa chỉ' from CAUTHU
--2 Hiển thị thông tin của càu thủ số áo 7 ở vị trí tiền vệ
select * from CAUTHU where SO = 7 and VITRI = N'Tiền vệ'
 --3 Cho biết tên, ngày sinh, địa chỉ, số điện thoại của tất cả các huấn luyện viên
 select TENHLV as 'Tên HLV', NGAYSINGH as 'Ngày sinh', DIACHI as 'Địa chỉ', DIENTHOAI as 'Số điện thoai' 
 from HUANLUYENVIEN
 --4 Hiển thị thông tin tất cả các cầu thủ có quốc tịch Việt Nam thuộc câu lạc bộ Becamex 
 select ct.MACT as 'Mã cầu thủ', ct.HOTEN as'Tên cầu thủ', ct.SO as 'Số áo', ct.VITRI as 'Vị trí', ct.NGAYSINH as 'Ngày sinh', ct.DIACHI as 'Địa chỉ'  
 from CAUTHU ct inner join CAULACBO clb on ct.MACLB = clb.MACLB
 where ct.MAQG = 'VN' and ct.MACLB = 'BBD'
 --5 Cho biêt mã số, họ tên, ngày sinh, địa chỉ, vị trí của các cầu thủ thuộc đội bóng "SHB Đà Nẵng" có quốc tịch Bra-xin
 select ct.MACT as 'Mã cầu thủ', ct.HOTEN as'Tên cầu thủ', ct.VITRI as 'Vị trí', ct.NGAYSINH as 'Ngày sinh', ct.DIACHI as 'Địa chỉ'
 from CAUTHU ct where ct.MACLB = 'SDN' and ct.MAQG = 'BRA'
--6 Hiển thị thông tin các cầu thủ đang thi đấu trong câu lạc bộ sân nhà "Long An"
select ct.MACT as 'Mã cầu thủ', ct.HOTEN as'Tên cầu thủ', ct.SO as 'Số áo', ct.VITRI as 'Vị trí', ct.NGAYSINH as 'Ngày sinh', ct.DIACHI as 'Địa chỉ'  
from CAUTHU ct inner join CAULACBO clb on clb.MACLB = ct.MACLB
where clb.MASAN = 'LA'
--7 Cho biết kết quả (MATRAN, NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) các trận đấu vòng 2 của mùa bóng năm 2021
select MATRAN, NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA from TRANDAU where VONG = 2 and NAM = 2021

--8 Cho biết mã huấn luyện viên, họ tên, ngày sinh, địa chỉ, vai trò và tên CLB đang làm viễ của các huấn luyện viên có quốc tịch "Việt Nam"
select hlv.MAHLV, hlv.TENHLV, hlv.NGAYSINGH, hlv.DIACHI, hclb.VAITRO, clb.TENCLB 
from HUANLUYENVIEN hlv inner join HLV_CLB hclb on hlv.MAHLV = hclb.MAHLV
					   inner join CAULACBO clb on clb.MACLB = hclb.MACLB
where hlv.MAQG like 'VN'

--9 Lấy tên 3 câu lạc bộ có điểm cao nhất sau vòng 3 năm 2023
select top 3 clb.TENCLB as 'Tên câu lạc bộ' from CAULACBO clb inner join BANGXH bxh on bxh.MACLB = clb.MACLB
where VONG = 3 and NAM = 2023 
order by bxh.DIEM desc

--10 Cho biết mã huấn luyện viên, họ tên, ngày sinh, địa chỉ, vai trò và tên CLB đang làm việc mà câu lạc bộ đó đóng ở tỉnh Bình Dương
select hlv.MAHLV, hlv.TENHLV, hlv.NGAYSINGH, hlv.DIACHI, hclb.VAITRO, clb.TENCLB 
from HUANLUYENVIEN hlv inner join HLV_CLB hclb on hlv.MAHLV = hclb.MAHLV
					   inner join CAULACBO clb on clb.MACLB = hclb.MACLB
where clb.MATINH like 'BD'

--11 Thống kê số lượng cầu thủ của mỗi câu lạc bộ 
select ct.MACLB as 'Mã câu lạc bộ',count(ct.MACT) as 'Số lượng cầu thủ' from CAUTHU ct group by ct.MACLB

--12 Thống kê số lượng cầu thủ nước ngoài của mỗi câu lạc bộ
select ct.MACLB as 'Mã câu lạc bộ',count(ct.MACT) as 'Số lượng cầu thủ' from CAUTHU ct 
where ct.MACT not like 'VN' group by ct.MACLB

--13 Cho biết mã câu lạc bộ, tên câu lạc bộ, tên sân vận động, địa chỉ và số lượng cầu thủ nước ngoài tương ứng của các câu lạc bộ có nhiều hơn
select clb.MACLB, clb.TENCLB, svd.TENSAN, svd.DIACHI, count (ct.MACT) as 'cầu thủ nước ngoài'
from CAULACBO clb JOIN SANVD svd on clb.MASAN = svd.MASAN 
join CAUTHU ct on clb.MACLB = ct.MACLB
join QUOCGIA qg on ct.MAQG = qg.MAQG 
where qg.MAQG <> 'VN' 
group by clb.MACLB,clb.TENCLB, svd.TENSAN, svd.DIACHI
having count(ct.MACT) > 1

--14 Cho biết tên tỉnh, số lượng cầu thủ đang thi đấu ở vị trí tiền đạo trong các câu lạc bộ thuộc địa bàn tỉnh đó quản lý
select t.TENTINH as 'Tỉnh', count(ct.MACT) as 'Số lượng cầu thủ'
from TINH t inner join CAULACBO clb on clb.MATINH = t.MATINH
inner join CAUTHU ct on ct.MACLB = clb.MACLB
where ct.VITRI like N'Tiền vệ'
group by t.TENTINH

--15 Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng nằm ở vị trí cao nhất của bảng xếp hạng của vòng 3 năm 2023
select CAULACBO.TENCLB, TINH.TENTINH, max(BANGXH.DIEM) as Diem 
from CAULACBO join TINH on CAULACBO.MATINH = TINH.MATINH
join BANGXH on CAULACBO.MACLB = BANGXH.MACLB
where BANGXH.NAM = 2023	and BANGXH.VONG = 3 and BANGXH.DIEM >= all
(
		select max(BANGXH.DIEM)
		from CAULACBO
		join BANGXH on CAULACBO.MACLB = BANGXH.MACLB
		where BANGXH.NAM = 2023
		and BANGXH.VONG = 3
)
group by CAULACBO.TENCLB, TINH.TENTINH

--16 Cho biết tên huấn luyện viên đang nắm giữ một vị trí trong câu lạc bộ mà chưa có số điện thoại
select  hlv.TENHLV as 'Huấn luyện viên' from HUANLUYENVIEN hlv inner join HLV_CLB hc on hlv.MAHLV = hc.MAHLV
where DIENTHOAI is null

--17 Liệt kê các huấn luyện viên thuộc quốc gia Việt Nam chưa làm công tác huấn luyện tại bất kỳ câu lạc bộ nào
select hlv.TENHLV as 'Huấn luyện viên'
from HUANLUYENVIEN hlv inner join HLV_CLB hc on hlv.MAHLV = hc.MAHLV 
inner join QUOCGIA qg on qg.MAQG = hlv.MAQG
where qg.TENQG = 'Việt Nam' and hc.MAHLV is null

--18 Liệt các cầu thủ đang thi đấu trong các câu lạc bộ có thứ hạng ở vòng 3 năm 2021 lớn hơn 6 hoặc nhỏ hơn 3
select * from CAUTHU ct inner join CAULACBO clb ON ct.MACLB = clb.MACLB
inner join BANGXH bxh on clb.MACLB = bxh.MACLB
where bxh.VONG = 3 and bxh.NAM = 2021 and (bxh.HANG > 6 or bxh.HANG < 3)

--19 Cho biết danh sách các trận đấu (NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) của câu lạc bộ đang xếp hạng cao nhất tính đến hết vòng 3 năm 2023
select td.NGAYTD as 'Ngày thi đấu', svd.TENSAN as 'Tên sân', clb1.TENCLB as 'Câu lạc bộ 1', clb2.TENCLB as 'Câu lạc bộ 2', td.KETQUA
from TRANDAU td inner join SANVD svd on td.MASAN = svd.MASAN
inner join CAULACBO clb1 on td.MACLB1 = clb1.MACLB
inner join CAULACBO clb2 on td.MACLB2 = clb2.MACLB 
where td.MACLB1 = (select top 1 MACLB from BANGXH where VONG <= 3 and NAM = 2023 order by DIEM desc)
or td.MACLB2 = (select top 1 MACLB from BANGXH where VONG <= 3 and NAM = 2023 order by DIEM desc)

--20 Cho biết NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA các trận đấu diễn ra vào tháng 3 trên sân nhà mà không bị thủng lưới
select td.NGAYTD as 'Ngày thi đấu', svd.TENSAN as 'Tên sân', clb1.TENCLB as 'Câu lạc bộ 1', clb2.TENCLB as 'Câu lạc bộ 2', td.KETQUA
from TRANDAU td
inner join SANVD svd on td.MASAN = svd.MASAN
inner join CAULACBO CLB1 ON td.MACLB1 = CLB1.MACLB
inner join CAULACBO CLB2 ON td.MACLB2 = CLB2.MACLB
where month(td.NGAYTD) = 3 and td.MASAN in (select MASAN from SANVD where TENSAN = CLB1.TENCLB) and td.KETQUA not like '%0-%'

--21 Cho biết mã số, họ tên, ngày sinh của những cầu thủ có họ lót là “Công”.
select ct.MACT as 'Mã cầu thủ', ct.HOTEN as 'Họ tên', ct.NGAYSINH as 'Ngày sinh'
from CAUTHU ct where ct.HOTEN like N'%Công%'

--22 Cho biết mã số, họ tên, ngày sinh của những cầu thủ có họ không phải là họ "Nguyễn".
select ct.MACT as 'Mã cầu thủ', ct.HOTEN as 'Họ tên', ct.NGAYSINH as 'Ngày sinh'
from CAUTHU ct where ct.HOTEN like N'%Nguyễn%'

--23 Cho biết mã huấn luyện viên, họ tên, ngày sinh, địa chỉ của những huấn luyện viên Việt Nam có tuổi nằm trong khoảng 35-40.
select hlv.MAHLV as 'Mã huấn luyện viên', hlv.TENHLV as 'Tên huấn luyện viên', hlv.NGAYSINGH 'Ngày sinh', hlv.DIACHI as 'Địa chỉ'
from HUANLUYENVIEN hlv where hlv.MAQG = 'VN' and datediff (year, hlv.NGAYSINGH, getdate()) between 35 and 40

--24 Cho biết tên câu lạc bộ có huấn luyện viên trưởng sinh vào ngày 20 tháng 5.
select clb.TENCLB as 'Tên câu lạc bộ'
from CAULACBO clb inner join HUANLUYENVIEN hlv on clb.MACLB = clb.MACLB
inner join HLV_CLB hc on hc.MACLB = clb.MACLB
WHERE hlv.NGAYSINGH = '2024-05-20' and hc.VAITRO = 'HLV Trưởng'

--25 Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng có số bàn thắng nhiều nhất tỉnh đến hết vòng 3 năm 2021.
select a.TENCLB as 'Tên câu lạc bộ', b.TENTINH as 'Tỉnh'
from CAULACBO a join TINH b on a.MATINH = b.MATINH 
inner join (select MACLB, sum(THANG) as TongBanThang from BANGXH where VONG <= 3 and NAM = 2021 group by MACLB) as BanThang 
on a.MACLB = BanThang.MACLB where BanThang.TongBanThang = 
(select max(TongBanThang) from (select sum(THANG) as TongBanThang from BANGXH where VONG <= 3 and NAM = 2021 group by MACLB) as TongBanThang)

--26 Cho biết mã câu lạc bộ, tên câu lạc bộ, tên sân vận động, địa chỉ và số lượng cầu thủ nước ngoài (có quốc tịch khác “Việt Nam”) 
-- tương ứng của các câu lạc bộ có nhiều hơn 2 cầu thủ nước ngoài.
select a.MACLB, a.TENCLB, b.TENSAN, b.DIACHI, TongSoCauThu.SOLUONG
from CAULACBO a join SANVD b on a.MASAN = b.MASAN join 
(select MACLB, count(*) as SOLUONG from CAUTHU where MAQG != 'VN' group by MACLB having count(*) > 2) as TongSoCauThu on a.MACLB = TongSoCauThu.MACLB;

--27 Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng có hiệu số bàng thắng bại cao nhất năm 2021.
select TENCLB, TENTINH, HIEUSO
from BANGXH BXH inner join CAULACBO CLB on BXH.MACLB = CLB.MACLB
inner join TINH TI on CLB.MATINH = TI.MATINH
where NAM = 2021 and VONG >= all (select VONG from BANGXH)
and convert(int, left(HIEUSO, PATINDEX('%-%', HIEUSO) - 1)) - convert(int, right(HIEUSO, LEN(HIEUSO) - PATINDEX('%-%', HIEUSO)))
>= ALL (select convert(int, left(HIEUSO, PATINDEX('%-%', HIEUSO) - 1)) - convert(int, right(HIEUSO, LEN(HIEUSO) - PATINDEX('%-%', HIEUSO)))
from BANGXH where NAM = 2021 and VONG >= all (select VONG from BANGXH))

--28 Cho biết danh sách các trận đấu (NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) 
-- của câu lạc bộ CLB có thứ hạng thấp nhất trong bảng xếp hạng vòng 3 năm 2021.
select TRANDAU.NGAYTD, SANVD.TENSAN, CLB1.TENCLB AS TENCLB1, CLB2.TENCLB AS TENCLB2, TRANDAU.KETQUA
from TRANDAU
inner join BANGXH BXH1 on TRANDAU.MACLB1 = BXH1.MACLB
inner join BANGXH BXH2 on TRANDAU.MACLB2 = BXH2.MACLB
inner join SANVD on TRANDAU.MASAN = SANVD.MASAN
inner join CAULACBO CLB1 on TRANDAU.MACLB1 = CLB1.MACLB
inner join CAULACBO CLB2 on TRANDAU.MACLB2 = CLB2.MACLB
where TRANDAU.VONG = 3 and TRANDAU.NAM = 2021
and (BXH1.HANG = (select min(HANG) from BANGXH where VONG = 3 and NAM = 2021) or
BXH2.HANG = (select min(HANG) from BANGXH where VONG = 3 and NAM = 2021));

--29 Cho biết mã câu lạc bộ, tên câu lạc bộ đã tham gia thi đấu với tất cả các câu lạc bộ còn lại (kể cả sân nhà và sân khách) trong mùa giải năm 2021.
select distinct CLB1.MACLB as 'Mã CLB1', CLB1.TENCLB as 'Câu Lạc Bộ 1'
from CAULACBO CLB1 where not exists( select * from CAULACBO CLB2 where CLB2.MACLB <> CLB1.MACLB and not exists 
( select * from TRANDAU where (TRANDAU.MACLB1 = CLB1.MACLB AND TRANDAU.MACLB2 = CLB2.MACLB) or (TRANDAU.MACLB1 = CLB2.MACLB AND TRANDAU.MACLB2 = CLB1.MACLB) and TRANDAU.NAM = 2021))

--30 Cho biết mã câu lạc bộ, tên câu lạc bộ đã tham gia thi đấu với tất cả các câu lạc bộ còn lại (chỉ tính sân nhà) trong mùa giải năm 2021.
select distinct TRANDAU.MACLB1 as 'Mã câu lạc bộ', CAULACBO.TENCLB as 'Tên câu lạc bộ'
from TRANDAU inner join CAULACBO on TRANDAU.MACLB1 = CAULACBO.MACLB
where not exists (select * from CAULACBO as CAULACBO2 where CAULACBO2.MACLB <> TRANDAU.MACLB1
and not exists (select * from TRANDAU as TRANDAU2 where (TRANDAU2.MACLB1 = TRANDAU.MACLB1 and TRANDAU2.MACLB2 = CAULACBO2.MACLB) and TRANDAU2.NAM = 2021))

--31 Khi thêm cầu thủ mới, kiểm tra vị trí trên sân của cần thủ chỉ thuộc một trong các vị trí sau: Thủ môn, Tiền đạo, Tiền vệ, Trung vệ, Hậu vệ.
-- Tạo rule kiểm tra vị trí của cầu thủ khi thêm mới
create trigger Kiemtra 
on CAUTHU 
instead of insert 
as 
begin 
declare @VITRI nvarchar(20) select @VITRI = VITRI from inserted if (@VITRI NOT IN ('Thủ môn', 'Tiền đạo', 'Tiền vệ', 'Trung vệ', 'Hậu vệ'))
begin raiserror ('Vị trí của cầu thủ không hợp lệ. Vui lòng chọn từ: Thủ môn, Tiền đạo, Tiền vệ, Trung vệ, Hậu vệ.', 16, 1) rollback transaction end
end

--32 Khi phân công huấn luyện viên, kiểm tra vai trò của huấn luyện viên chỉ thuộc một trong các vai trò sau: HLV chính, HLV phụ, HLV thể lực, HLV thủ môn.
alter table HLV_CLB add constraint  chk_vaitro check (VAITRO in (N'HLV chính', N'HLV phụ', N'HLV thể lực', N'HLV thủ môn'))

--33 Khi thêm cầu thủ mới, kiểm tra cầu thủ đó có tuổi phải đủ 18 trở lên (chỉ tính năm sinh).
alter table CAUTHU add constraint Kiem_tra_tuoi check (datediff(year,NGAYSINH,getdate()) >= 18);

--34 Kiểm tra kết quả trận đấu có dạng số bản_thắng-số_bàn_thua.
alter table TRANDAU add constraint Kiem_tra_KQ check (KETQUA like '%-%')
