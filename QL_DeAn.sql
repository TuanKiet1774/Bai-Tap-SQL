create database QL_DeAn;
use QL_DeAn;

create table PHONGBAN (
MAPB varchar(5) primary key,
TENPB nvarchar(50),
TRUONGPHONG varchar(5),
NG_NHANCHUC date,
)

create table NHANVIEN(
MANV varchar(5)primary key,
HONV nvarchar(20),
TENLOT nvarchar(20),
TENNV nvarchar(10),
NGAYSINH date,
DIACHI nvarchar(100),
PHAI varchar(5),
LUONG decimal(10,2),
MAPB varchar(5) foreign key references PHONGBAN(MAPB),
)


create table DEAN (
MADA varchar(5) primary key,
TENDA nvarchar(50),
DDIEM_DA nvarchar(100),
MAPB varchar(5) foreign key references PHONGBAN(MAPB),
)

create table THANNHAN (
MANV varchar(5) foreign key references NHANVIEN(MANV),
TENTN nvarchar(30),
PHAI varchar(5),
NGAYSINH date,
QUANHE nvarchar(20),
primary key (MANV,TENTN),
)

create table PHANCONG (
MANV varchar(5),
MADA varchar(5),
THOIGIAN decimal(5,1),
primary key (MANV,MADA),
foreign key (MANV) references NHANVIEN(MANV),
foreign key (MADA) references DEAN(MADA),
)

create table DDIEMPB (
MAPB varchar(5),
DIADIEM nvarchar(20),
primary key (MAPB,DIADIEM),
foreign key (MAPB) references PHONGBAN(MAPB),
)

alter table PHONGBAN add constraint fk_NHANVIEN_PHONGBAN foreign key (MANV) references NHANVIEN(MANV)
--Phong Ban--
insert into PHONGBAN (MAPB,TENPB,TRUONGPHONG,NG_NHANCHUC) values ('P1',N'QUANLY','NV5','6/19/2016')
insert into PHONGBAN (MAPB,TENPB,TRUONGPHONG,NG_NHANCHUC) values ('P2',N'DIEUHANH','NV8','1/1/2018')
insert into PHONGBAN (MAPB,TENPB,TRUONGPHONG,NG_NHANCHUC) values ('P3',N'NGHIENCUU','NV2','5/22/2017')

--Nhan Vien--
insert into NHANVIEN (MANV,HONV,TENLOT,TENNV,NGAYSINH,DIACHI,PHAI,LUONG,MAPB) values ('NV1',N'DINH',N'BA',N'TIEN','1/9/1985',N'731 Tran Hung Dao, ql, TPHCM','NAM',30000,'P3')
insert into NHANVIEN (MANV,HONV,TENLOT,TENNV,NGAYSINH,DIACHI,PHAI,LUONG,MAPB) values ('NV2',N'VO',N'THANH',N'TUNG','12/8/1975',N'638 Tran Hung Dao','NAM',40000,'P3')
insert into NHANVIEN (MANV,HONV,TENLOT,TENNV,NGAYSINH,DIACHI,PHAI,LUONG,MAPB) values ('NV3',N'TRAN',N'THANH',N'TAM','7/31/1982',N'853 Mai Thi Luu, Q1, TPHCM','NAM',25000,'P2')
insert into NHANVIEN (MANV,HONV,TENLOT,TENNV,NGAYSINH,DIACHI,PHAI,LUONG,MAPB) values ('NV4',N'VO',N'MANH',N'HUNG','9/15/1972',N'975 Ba Ria, Vung Tau','NAM',38000,'P2')
insert into NHANVIEN (MANV,HONV,TENLOT,TENNV,NGAYSINH,DIACHI,PHAI,LUONG,MAPB) values ('NV5',N'LE',N'NGOC',N'QUYEN','10/10/1987',N'450 Trung Vuong, Ha Noi','NU',55000,'P1')
insert into NHANVIEN (MANV,HONV,TENLOT,TENNV,NGAYSINH,DIACHI,PHAI,LUONG,MAPB) values ('NV6',N'TRAN',N'MINH',N'KHANG','6/24/1982',N'Tran Binh Trong, TPHCM','NAM',58000,'P1')
insert into NHANVIEN (MANV,HONV,TENLOT,TENNV,NGAYSINH,DIACHI,PHAI,LUONG,MAPB) values ('NV7',N'LE',N'THI',N'NHAN','6/20/1981',N'291 Ho Van Hue, QPN, TPHCM','NU',43000,'P3')
insert into NHANVIEN (MANV,HONV,TENLOT,TENNV,NGAYSINH,DIACHI,PHAI,LUONG,MAPB) values ('NV8',N'TRAN',N'HONG',N'QUANG','3/29/1979',N'980 Le Hong Phong, Q10, TPHCM','NAM',25000,'P2')
insert into NHANVIEN (MANV,HONV,TENLOT,TENNV,NGAYSINH,DIACHI,PHAI,LUONG,MAPB) values ('NV9',N'BUI',N'THUY',N'VU','7/19/1978',N'332 Nguyen Thai Hoc, Q1, TPHCM','NU',25000,'P1')

--De An--
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPB) values ('DA1',N'San pham X',N'VUNG TAU','P3')
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPB) values ('DA2',N'San pham Y',N'NHA TRANG','P3')
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPB) values ('DA3',N'San pham Z',N'TPHCM','P3')
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPB) values ('DA4',N'Tin hoc hoa',N'HA NOI','P2')
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPB) values ('DA5',N'Cap quang',N'TPHCM','P1')
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPB) values ('DA6',N'Dao tao',N'HA NOI','P2')

--Than Nhan--
insert into THANNHAN(MANV,TENTN,PHAI,NGAYSINH,QUANHE) values ('NV1',N'DINH BA KIEN','NAM','1995-07-15',N'CON TRAI')
insert into THANNHAN(MANV,TENTN,PHAI,NGAYSINH,QUANHE) values ('NV1',N'NGUYEN THANH THAO','NU','1988-04-08',N'VỢ')
insert into THANNHAN(MANV,TENTN,PHAI,NGAYSINH,QUANHE) values ('NV2',N'VO THANH SON','NAM','1950-09-23',N'CHA')
insert into THANNHAN(MANV,TENTN,PHAI,NGAYSINH,QUANHE) values ('NV3',N'LE THI HUONG','NU','1984-01-09',N'VỢ')
insert into THANNHAN(MANV,TENTN,PHAI,NGAYSINH,QUANHE) values ('NV3',N'TRAN LE NGOC HOA','NU','2017-09-12',N'CON GÁI')
insert into THANNHAN(MANV,TENTN,PHAI,NGAYSINH,QUANHE) values ('NV6',N'TRAN MINH AN','NAM','1980-08-05',N'ANH TRAI')
insert into THANNHAN(MANV,TENTN,PHAI,NGAYSINH,QUANHE) values ('NV7',N'LE THI NGAN','NU','1980-06-07',N'EM GÁI')
insert into THANNHAN(MANV,TENTN,PHAI,NGAYSINH,QUANHE) values ('NV9',N'TRAN QUOC VUONG','NAM','1975-05-05',N'CHỒNG')

--Phan Cong--
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV1','DA1',32.5)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV1','DA2',7.5)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV1','DA3',10)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV2','DA3',40)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV2','DA4',20)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV2','DA5',20)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV3','DA1',20)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV3','DA2',20)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV4','DA3',10)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV5','DA4',10)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV5','DA5',10)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV7','DA6',30)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV8','DA4',10)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV8','DA6',20)
insert into PHANCONG (MANV,MADA,THOIGIAN) values ('NV9','DA4',15)

--DDiemPB--
insert into DDIEMPB (MAPB,DIADIEM) values ('P1',N'TPHCM')
insert into DDIEMPB (MAPB,DIADIEM) values ('P2',N'HA NOI')
insert into DDIEMPB (MAPB,DIADIEM) values ('P3',N'NHA TRANG')
insert into DDIEMPB (MAPB,DIADIEM) values ('P3',N'TPHCM')
insert into DDIEMPB (MAPB,DIADIEM) values ('P3',N'VUNG TAU')

select * from PHONGBAN
select * from NHANVIEN
select * from DEAN
select * from THANNHAN
select * from PHANCONG
select * from DDIEMPB

--1 Cho biết tên tuổi từng nhân viên 
select concat (HONV, ' ', TENLOT, ' ', TENNV) as 'Tên nhân viên',
       datediff(year, NGAYSINH, getdate()) as 'Tuổi'
from NHANVIEN

--2 Cho biết thông tin những người có phái là nam và địa chỉ trên đường "Tran Hung Dao"
select concat (HONV, ' ', TENLOT, ' ', TENNV) as 'Tên nhân viên' from NHANVIEN
where PHAI = 'NAM' and DIACHI like '%Tran Hung Dao%'
--3 Cho biết những người có họ là "Le" và tên bắt đầu bằng ký tự "N"
select concat (HONV, ' ', TENLOT, ' ', TENNV) as 'Tên nhân viên' from NHANVIEN 
where HONV = N'Le' and TENNV like 'N%'

--4 Cho biết những người có ngày sinh trong tháng 7 năm 1978
select concat (HONV, ' ', TENLOT, ' ', TENNV) as 'Tên nhân viên' from NHANVIEN 
where month(NGAYSINH) = 7 and year(NGAYSINH) = 1978

--5 Cho biết những người có ngày sinh trong quý 3
select concat (HONV, ' ', TENLOT, ' ', TENNV) as 'Tên nhân viên' from NHANVIEN
where month(NGAYSINH) between 7 and 9

--6 Cho biết số đề án được phân của từng nhân viên (Mã số, tên, sô lượng đề án)
select nv.MANV as 'Mã số' ,concat(nv.HONV,' ',nv.TENLOT,' ',nv.TENNV) as 'Tên nhân viên', count(da.MADA) as 'Số lượng đề án' from NHANVIEN nv
inner join PHONGBAN pb on pb.MAPB = nv.MAPB inner join DEAN da on da.MAPB = pb.MAPB
group by nv.MANV,nv.HONV,nv.TENLOT,nv.TENNV 

--7 Cho biết tên nhân viên có từ 2 thân nhân trở lên
select distinct concat(nv.HONV,' ',nv.TENLOT,' ',nv.TENNV) as 'Tên nhân viên' 
from NHANVIEN nv inner join THANNHAN tn on tn.MANV = nv.MANV
group by nv.MANV,nv.HONV,nv.TENLOT,nv.TENNV 
having count(tn.MANV) >= 2

--8 Cho biết tên nhân viên >=30 được phân công làm việc cho đề án ở TPHCM
select distinct nv.TENNV as 'Tên nhân viên' 
from NHANVIEN nv inner join PHANCONG pc on nv.MANV = pc.MANV 
inner join DEAN da on pc.MADA = da.MADA 
inner join PHONGBAN pb on da.MAPB = pb.MAPB 
where datediff(year, nv.NGAYSINH, getdate()) >= 30 
and da.DDIEM_DA = 'TPHCM';

--9 Cho biết có bao nhiêu đề án ở TPHCM
select count(MADA) as 'Số lương đề án ờ TPHCM' from DEAN where DDIEM_DA = 'TPHCM'

--10 Đối với mỗi thành phố, cho biết tên và số lượng đề án được thực hiện ở đó
select DDIEM_DA as 'Tên thành phố', count(MADA) as 'Số lượng đề án'
from DEAN da group by DDIEM_DA

--11 Cho biết số năm làm việc của từng trưởng phòng 
select pb.TRUONGPHONG as'Mã trưởng phòng' ,datediff(year,pb.NG_NHANCHUC,getdate()) as'Thâm niên' from PHONGBAN pb 
group by pb.TRUONGPHONG,pb.NG_NHANCHUC

--12 Cho biết số lượng địa điểm của từng phòng ban
select dpb.MAPB as'Mã phong' ,count(dpb.DIADIEM) as 'Sô lượng địa điểm' from DDIEMPB dpb
group by dpb.MAPB

--13 Cho biết có bao nhiêu tên đề án tên là "sản phẩm"
select count(da.TENDA) as 'Số lượng đề án sản phẩm' from DEAN da where da.TENDA like 'San pham%'

--14 Cho biết tên phòng, địa điểm phòng, tên đề án, địa điểm đề án của những đề án có địa điểm đề án trùng với địa điểm của phòng
select distinct pb.TENPB as 'Tên phòng ban', dpb.DIADIEM as 'Địa điểm phòng', da.TENDA as'Tên đồ án', da.DDIEM_DA as 'Địa điểm đề án' 
from DEAN da inner join PHONGBAN pb on da.MAPB = pb.MAPB
inner join DDIEMPB dpb on dpb.MAPB = pb.MAPB
where da.DDIEM_DA = dpb.DIADIEM

--15 Tên các nhân viên quản lý có mức lương thấp hơn lương trung bình nhân viên họ quản lý trực tiếp
select nv_tp.TENNV as 'Tên quản ly' from NHANVIEN nv_tp inner join PHONGBAN pb on nv_tp.MANV = pb.TRUONGPHONG
where nv_tp.LUONG < (select avg(nv.LUONG) from NHANVIEN nv where nv.MAPB = pb.MAPB)
 
--16 Xóa tên nhân viên có số thân nhân >=3
delete from NHANVIEN where MANV in (select MANV from THANNHAN group by MANV having count(MANV) >=3)


--17 Mã nhân viên "NV5" có mức lương cao nhất hay không ? (trả lời "có" hay "không")
select case 
		when nv.LUONG = (select max(LUONG) from NHANVIEN) 
		then 'Có' else 'Không' end as 'NV5 có mức lương cao nhất ?' from NHANVIEN nv
where nv.MANV = 'NV5'

--18 Tên nhân viên đã có gia đỉnh những chưa có con
select nv.TENNV as 'Tên nhân viên có gia đình chưa có con' 
from NHANVIEN nv inner join THANNHAN tn on tn.MANV = nv.MANV
where (tn.QUANHE like N'VỢ' or tn.QUANHE like N'CHỒNG') 
and tn.MANV not in (select MANV from THANNHAN where QUANHE like 'CON%')

--19 Đối với từng đề án, cho biết số lượng nhân viên, tên đề án, số giờ làm việc nhiều nhất
select count(nv.MANV) as'Số lượng nhân viên', da.TENDA as'Tên đề án', max(pc.THOIGIAN) as'Thời gian làm nhiều nhất' 
from DEAN da inner join PHANCONG pc on pc.MADA = da.MADA
inner join NHANVIEN nv on nv.MANV = pc.MANV
group by da.MADA, da.TENDA

--20 Tên nhân viên được làm việc cho tất cả các đề án ở Hà Nội
select distinct nv.TENNV as 'Tên nhân viên làm tất cả các đề án ở HN'
from NHANVIEN nv inner join PHANCONG pc on nv.MANV = pc.MANV
inner join DEAN da on pc.MADA = da.MADA
where da.DDIEM_DA = 'HA NOI'
group by nv.MANV, nv.TENNV
having count(da.MADA) = (select count(MADA) from DEAN where DDIEM_DA ='HA NOI')

--21 Tên phòng ban có trưởng phòng là nhân viên nữ
select pb.TENPB as 'Phòng ban' from PHONGBAN pb inner join NHANVIEN nv on pb.TRUONGPHONG = nv.MANV where nv.PHAI = 'NU' 

--22 Đối với từng đề án, cho biết số lượng nhân viên tham gia đề án, tổng số giờ làm việc của đề án
select da.TENDA as 'Đề án', count(pc.MANV) as 'Số lượng', sum(pc.THOIGIAN) as 'Tổng thời gian' 
from NHANVIEN nv inner join PHONGBAN pb on pb.TRUONGPHONG = nv.MANV
inner join DEAN da on da.MAPB = nv.MAPB
inner join PHANCONG pc on pc.MADA = da.MADA
group by da.MADA, da.TENDA

--23 Đối với từng phòng ban, cho biết tên phòng ban, tổng số nam, tổng số nữ
select pb.TENPB as 'Tên phòng ban', 
sum(case when nv.PHAI = 'NAM' then 1 else 0 end) as 'Tổng số nam', 
sum(case when nv.PHAI = 'NU' then 1 else 0 end) as 'Tổng số nữ' 
from PHONGBAN pb inner join NHANVIEN nv on nv.MAPB = pb.MAPB
group by pb.TENPB

--24 Tên phòng ban có nhân viên nữ nhiều nhất
select top 1 pb.TENPB as 'Tên phong ban có nhiều nữ nhất' from PHONGBAN pb inner join NHANVIEN nv on nv.MAPB = pb.MAPB
where nv.PHAI = 'NU'
group by pb.MAPB, pb.TENPB
order by count(*) desc 


--25 Nhân viên có mã số "NV4" lớn tuổi nhất hay không?(có hay không)
select 
	case
	when datediff(year,nv.NGAYSINH,getdate()) = (select max(datediff(year,NGAYSINH,getdate())) from NHANVIEN )
	then 'Có' else 'Không' end as 'Nhân viên có mã số "NV4" lớn tuổi nhất hay không' from NHANVIEN nv 
where nv.MANV = 'NV4'

--26 Đối với từng phòng ban, cho biết tên phong ban, lương trung bình của nữ nhân viên, nam nhân viên
select pb.TENPB as 'Tên phòng ban',  
avg(case when nv.PHAI = 'NAM' then nv.LUONG end) as 'Lương trung bình Nam',
avg(case when nv.PHAI = 'NU' then nv.LUONG end) as 'Lương trung bình Nữ'
from PHONGBAN pb inner join NHANVIEN nv on nv.MANV = pb.TRUONGPHONG
group by pb.TENPB

--27 Tăng 10% lương đối với các nhân viên là nữ và được phân công làm việc cho đề án ở Vũng Tàu hay Nha Trang
update NHANVIEN set LUONG = LUONG + LUONG*0.1 
from NHANVIEN nv inner join PHANCONG pc on pc.MANV = nv.MANV 
inner join DEAN da on da.MADA = pc.MADA 
where nv.PHAI = 'NU' and (da.DDIEM_DA = 'NHA TRANG' or da.DDIEM_DA ='VUNG TAU')

--28 Tên và địa chỉ các nhân viên làm việc cho một đề án ở thành phố nhưng địa điểm phòng ban họ trực thuộc đều không ở trong thành phố đó
select distinct nv.HONV+' '+nv.TENLOT+' '+nv.TENNV as 'Tên nhân viên' 
from NHANVIEN nv inner join PHANCONG pc on pc.MANV = nv.MANV
inner join DEAN da on da.MADA = pc.MADA 
inner join PHONGBAN pb on pb.MAPB = da.MAPB 
inner join DDIEMPB dpb on dpb.MAPB = pb.MAPB
where dpb.DIADIEM not like '%TPHCM%'
--SAI CHƯA CÓ ĐÁP ÁN

--29 Tên các đề án thuộc phòng ban có địa chỉ Hà Nội
select da.TENDA as 'Tên đề án' 
from DEAN da inner join PHONGBAN pb on pb.MAPB = da.MAPB
inner join DDIEMPB dpb on dpb.MAPB = pb.MAPB
where dpb.DIADIEM = 'HA NOI'

--30 Tên những nhân viên là trưởng phòng và cư ngụ tại TPHCM
select nv.TENNV as 'Tên nhân viên' from NHANVIEN nv inner join PHONGBAN pb on pb.TRUONGPHONG = nv.MANV
where nv.DIACHI like'%TPHCM'

--31 Tên nhân viên là trưởng phòng có ngày nhân chức sau cùng
select top 1 nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV as 'Tên trưởng phòng', pb.NG_NHANCHUC as 'Ngày nhân chức'
from NHANVIEN nv inner join PHONGBAN pb on nv.MANV = pb.TRUONGPHONG
order by pb.NG_NHANCHUC desc

--32 Phòng ban nào chỉ phụ trách các đề án ở Hà Nội
select distinct pb.TENPB as 'Phòng Ban' from PHONGBAN pb inner join DEAN da on da.MAPB = pb.MAPB
where da.DDIEM_DA = 'HA NOI'

--33 Thêm vào quan hệ PHANCONG các bộ là các đề án mà nhân viên NV3 chưa được phân công
insert into PHANCONG select 'NV3', da.MADA, 0 from DEAN da 
where da.MADA not in (select MADA from PHANCONG where MANV = 'NV3')

--34 Liệt kê phòng ban, tên trưởng phòng của các phòng ban có nhiều nhân viên nữ nhất
select top 1 pb.MAPB as 'Mã phòng ban', pb.TENPB as 'Tên phòng ban', 
    nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV as 'Tên trưởng phòng'
from PHONGBAN pb 
inner join NHANVIEN nv on nv.MAPB = pb.MAPB
where nv.PHAI = 'NU' and nv.MANV = pb.TRUONGPHONG
group by pb.MAPB, pb.TENPB, nv.HONV, nv.TENLOT, nv.TENNV
order by count(*) desc;

--35 Tên nhân viên được phân công làm việc cho tất cả các đề án của phòng P2
select distinct NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as 'Tên nhân viên'
from NHANVIEN NV
join PHANCONG PC on NV.MANV = PC.MANV
join DEAN DA on PC.MADA = DA.MADA
join PHONGBAN PB on DA.MAPB = PB.MAPB
where PB.MAPB = 'P2' and DA.MADA = 'DA4';

--36 Cho biết tên đề án, tên nhân viên, số giờ của từng đề án được phân công và số giờ làm việc nhiều nhất
select TENDA as 'Tên đồ án', HONV + ' ' + TENLOT + ' ' + TENNV as 'Họ và tên', THOIGIAN as 'Thời gian làm việc'
from NHANVIEN NV join PHANCONG PC on NV.MANV = PC.MANV
join DEAN DA on PC.MADA = DA.MADA
where THOIGIAN >= all (select max(THOIGIAN) from PHANCONG where MADA = PC.MADA)

--37 Đối với từng nhân viên: cho biết tên nhân viên, mã phòng ban và tên của những trưởng phòng
select nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV as 'Tên nhân viên', nv.MAPB as 'Mã phòng ban', 
    tp.HONV + ' ' + tp.TENLOT + ' ' + tp.TENNV as 'Tên trưởng phòng'
from NHANVIEN nv
inner join PHONGBAN pb on nv.MAPB = pb.MAPB
left join NHANVIEN tp on pb.TRUONGPHONG = tp.MANV;


