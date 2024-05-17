create database QL_SinhVien;
use QL_SinhVien;

create table KHOA(
MaKhoa varchar(10) primary key not null,
TenKhoa nvarchar(50) not null,
SL_CBGD smallint not null,
)

create table SINHVIEN(
MSSV varchar(5) primary key not null,
Ten nvarchar(50) not null,
GioiTinh varchar(5) not null,
DiaChi nvarchar(100) not null,
DienThoai varchar(20) null,
MaKhoa varchar(10) foreign key references KHOA null,
)

create table GIAOVIEN(
MaGV varchar(5) primary key not null,
TenGV nvarchar(50) not null,
MaKhoa varchar(10) foreign key references KHOA(MaKhoa) null,
)

create table MONHOC(
MaMH varchar(5) primary key not null,
TenMH nvarchar(50) not null,
SoTC smallint not null,
)

create table GIANGDAY(
MaKhoaHoc varchar(5) primary key not null,
MaGV varchar(5) foreign key references GIAOVIEN (MaGV) null,
MaMH varchar(5) foreign key references MONHOC (MaMH) null,
HocKy smallint not null,
Nam int not null,
)

create table KETQUA(
MSSV varchar(5) not null,
MaKhoaHoc varchar(5) not null,
Diem decimal(3,1) not null, 
primary key (MSSV,MaKhoaHoc),
foreign key (MaKhoaHoc) references GIANGDAY(MaKhoaHoc),
foreign key (MSSV) references SINHVIEN(MSSV),
)
--Khoa--
insert into KHOA (MaKhoa,TenKhoa,SL_CBGD) values ('CNTT',N'Công nghệ thông tin',15)
insert into KHOA (MaKhoa,TenKhoa,SL_CBGD) values ('TOAN',N'Toán',20)
insert into KHOA (MaKhoa,TenKhoa,SL_CBGD) values ('SINH',N'Sinh học',7)
--Sinh viên--
insert into SINHVIEN (MSSV,Ten,GioiTinh,DiaChi,DienThoai,MaKhoa) values ('SV001',N'BUI THUY AN','Nữ',N'223 TRAN HUNG DAO .HCM','0843432202','CNTT')
insert into SINHVIEN (MSSV,Ten,GioiTinh,DiaChi,DienThoai,MaKhoa) values ('SV002',N'NGUYEN THANH TUNG',N'Nam',N'140 CONG QUYNH .HCM','0581525678','CNTT')
insert into SINHVIEN (MSSV,Ten,GioiTinh,DiaChi,DienThoai,MaKhoa) values ('SV003',N'NGUYEN THANH LONG',N'Nam',N'112/4 CONG QUYNH .HCM','0918345623','TOAN')
insert into SINHVIEN (MSSV,Ten,GioiTinh,DiaChi,DienThoai,MaKhoa) values ('SV004',N'HOANG THI HOA',N'Nữ',N'90 NG VAN CU .HCM','0988320123','CNTT')
insert into SINHVIEN (MSSV,Ten,GioiTinh,DiaChi,DienThoai,MaKhoa) values ('SV005',N'TRAN HONG SON',N'Nam',N'54 CAO THANG .HANOI','0928345987','TOAN')
--Sửa thông tin bảng SINHVIEN--
update SINHVIEN set Ten = N'BUI THUY AN' where MSSV = 'SV001';
update SINHVIEN set GioiTinh = N'Nữ' where MSSV = 'SV001';
alter table SINHVIEN alter column GioiTinh nvarchar(5)
--Giao viên--
insert into GIAOVIEN (MaGV,TenGV,MaKhoa) values ('GV01',N'PHAM THI THAO','CNTT')
insert into GIAOVIEN (MaGV,TenGV,MaKhoa) values ('GV02',N'LAM HOANG VU','TOAN')
insert into GIAOVIEN (MaGV,TenGV,MaKhoa) values ('GV03',N'TRAN VAN TIEN','CNTT')
insert into GIAOVIEN (MaGV,TenGV,MaKhoa) values ('GV04',N'HOANG VUONG','CNTT')
--Môn học--
insert into MONHOC (MaMH,TenMH,SoTC) values ('CSDL',N'CO SO DU LIEU',3)
insert into MONHOC (MaMH,TenMH,SoTC) values ('CTDL',N'CAU TRUC DU LIEU',4)
insert into MONHOC (MaMH,TenMH,SoTC) values ('KTLT',N'KY THUAT LAP TRINH',5)
insert into MONHOC (MaMH,TenMH,SoTC) values ('CWIN',N'LAP TRINH C TREN WINDOW',4)
--Giang dạy--
insert into GIANGDAY (MaKhoaHoc,MaGV,MaMH,HocKy,Nam) values ('K1','GV01','CSDL',1,2021)
insert into GIANGDAY (MaKhoaHoc,MaGV,MaMH,HocKy,Nam) values ('K2','GV04','KTLT',2,2020)
insert into GIANGDAY (MaKhoaHoc,MaGV,MaMH,HocKy,Nam) values ('K3','GV03','CTDL',1,2020)
insert into GIANGDAY (MaKhoaHoc,MaGV,MaMH,HocKy,Nam) values ('K4','GV04','CWIN',1,2020)
insert into GIANGDAY (MaKhoaHoc,MaGV,MaMH,HocKy,Nam) values ('K5','GV01','CSDL',1,2021)
--Kết quả--
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV001','K1',8.5)
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV002','K3',7.0)
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV003','K4',7.5)
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV001','K2',9.0)
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV004','K3',6.0)
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV005','K3',7.0)
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV002','K1',7.0)
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV003','K2',8.5)
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV005','K5',7.0)
insert into KETQUA (MSSV,MaKhoaHoc,Diem) values ('SV004','K4',2.0)
--Xem dữ liệu--
select * from KHOA
select * from SINHVIEN
select * from GIAOVIEN
select * from MONHOC
select * from GIANGDAY
select * from KETQUA

--1 Cho biết tên, địa chỉ, số điện thoại của tất cả sinh viên
select Ten, DiaChi, DienThoai from SINHVIEN

--2 Cho biết tên các môn học và số tín chỉ của từng môn học
select TenMH, SoTC from MONHOC

--3 Cho biết kết quả học tập của sinh viên có mã số SV03
select a.MSSV, a.MaKhoaHoc, a.Diem from KETQUA a where a.MSSV = 'SV003' 

--4 Cho biết tên các môn học và số tín chỉ của những môn học có cấu trúc của 
--mã môn học như: ký tự thứ 1 là "C", Ký tự thứ 3 là"D"
select TenMH, SoTC from MONHOC where MaMH like 'C_D%'

--5 Cho biết tên giáo viên có ký tự thứ 3 là "A"
select TenGV from GIAOVIEN where TenGV like '__A%'

--6 Cho biết tên những môn học có chứa chứ "DU"
select TenMH from MONHOC where TenMH like '%DU%'

--7 Cho biết tên giáo viên có ký tự đầu tiên của họ và tên là các ký tự "P" và "L"
select TenGV from GIAOVIEN where left(TenGV, 1) in ('P', 'L');

--8 Cho biết tên, địa chỉ sinh viên có địa chỉ trên đương "CONG QUYNH" 
select Ten, DiaChi from SINHVIEN where DiaChi like '%CONG QUYNH%'

--9 Cho biết danh sách các môn học được dạy trong năm 2020
select a.TenMH as 'Danh Sach Mon Hoc' from MONHOC a, GIANGDAY b where a.MaMH = b.MaMH and b.Nam = 2020

--10 Cho biết mã, tên, địa chỉ của các sinh viên theo từng Khoa sắp sếp theo thứ tự từ A -A theo tên sinh viên
select a.MSSV as 'Mã',a.Ten as 'Tên', a.DiaChi as 'Địa Chỉ'  
from SINHVIEN a, KHOA b 
where a.MaKhoa = b.MaKhoa order by a.Ten asc

--11 Cho biết điểm của các sinh viên theo từng môn học
select d.Ten as 'sinh viên',a.Diem 'Điểm của sinh viên', b.TenMH as'Môn' 
from KETQUA a, MONHOC b , GIANGDAY c , SINHVIEN d
where a.MaKhoaHoc = c.MaKhoaHoc and c.MaMH = b.MaMH  and d.MSSV = a.MSSV 
order by b.TenMH

--12 Cho biết các sinh viên học môn CTDL có điểm từ 8 đến 10
select  sv.Ten from SINHVIEN sv, KETQUA kq, GIANGDAY gd, MONHOC mh 
where sv.MSSV = kq.MSSV and kq.MaKhoaHoc = gd.MaKhoaHoc and gd.MaMH = mh.MaMH and gd.MaMH = 'CSDL' and Diem between 8 and 10

--13 Cho biết bảng điểm sinh viên có tên là TUNG
select sv.Ten, kq.Diem, gd.MaMH  
from KETQUA kq inner join GIANGDAY gd on kq.MaKhoaHoc = gd.MaKhoaHoc inner join SINHVIEN sv on sv.MSSV = kq.MSSV  
where sv.Ten like '%TUNG%' 

--14 Cho biết tên khoa, tên môn học mà những sinh viên trong khoa đã học
select distinct k.TenKhoa as 'Khoa', mh.TenMH as 'Môn học' 
from KHOA k inner join SINHVIEN sv on k.MaKhoa = sv.MaKhoa 
inner join KETQUA kq on sv.MSSV = kq.MSSV 
inner join GIANGDAY gd on gd.MaKhoaHoc = kq.MaKhoaHoc 
inner join MONHOC mh on mh.MaMH = gd.MaMH

--15 cho biết tên khoa, mã khoá học mà giáo viên của khoa có tham gia giảng dạy
select k.TenKhoa, gd.MaKhoaHoc 
from KHOA k inner join GIAOVIEN gv on k.MaKhoa = gv.MaKhoa inner join GIANGDAY gd on gd.MaGV = gv.MaGV

--16 Cho biết các sinh viên đã học môn CSDL hoặc CTDL
select sv.MSSV, sv.Ten, gd.MaMH 
from SINHVIEN sv 
inner join KETQUA kq on sv.MSSV = kq.MSSV 
inner join GIANGDAY gd on kq.MaKhoaHoc = gd.MaKhoaHoc
where gd.MaMH = 'CSDL' or gd.MaMH = 'CTDL'

--17 Cho biết tên những giáo viên tham gia giảng dạ môn Kỹ thuật lập trình
select gv.TenGV from GIAOVIEN gv inner join GIANGDAY gd on gv.MaGV = gd.MaGV where gd.MaMH = 'KTLT'

--18 Cho biết tên môn học mà giáo viên Tran Van Tien tham gia giảng dạy trong học kỳ 1 năm 2020
select  mh.TenMH from GIAOVIEN gv 
inner join GIANGDAY gd on gv.MaGV = gd.MaGV 
inner join MONHOC mh on mh.MaMH = gd.MaMH 
where gd.HocKy = 1 and gd.Nam = 2020  and gv.TenGV ='TRAN VAN TIEN'

--19 Cho biết mã, tên các sinh viên có kết quả 1 môn học nào đó trên 8 điểm (kết quả các môn khác có thể <= 8)
select distinct sv.MSSV as 'Mã số', sv.Ten as 'Tên' from SINHVIEN sv 
inner join KETQUA kq on sv.MSSV = kq.MSSV 
inner join GIANGDAY gd on gd.MaKhoaHoc = kq.MaKhoaHoc
inner join MONHOC mh on mh.MaMH = gd.MaMH
where kq.Diem > 8

--20 Cho biết mã, tên các sinh viên có kết quả các môn học đều trên 8
select distinct sv.MSSV as 'Mã số', sv.Ten as 'Tên' from SINHVIEN sv 
inner join KETQUA kq on sv.MSSV = kq.MSSV 
inner join GIANGDAY gd on gd.MaKhoaHoc = kq.MaKhoaHoc
inner join MONHOC mh on mh.MaMH = gd.MaMH
where kq.Diem >= all(select kq.Diem from KETQUA where Diem>8)

--21 Có bao nhiêu sinh viên
select count(*) as 'Số lượng sinh viên' from SINHVIEN 

--22 Có bao nhiêu giáo viên 
select count(*) as 'Số lượng giáo viên' from GIAOVIEN

--23 Có bao nhiêu sinh viến thuộc giới tính nữ và thuộc khoa CNTT
select count(*) as 'Sinh viên nữ học CNTT' from SINHVIEN where GioiTinh = N'Nữ' and MaKhoa = 'CNTT'

--24 Có bao nhiêu giáo viên khoa CNTT
select count(*) as 'Giáo viên khoa CNTT' from GIAOVIEN gv, KHOA k where k.MaKhoa = gv.MaKhoa and k.MaKhoa = 'CNTT'

--25 Có bao nhiêu sinh viên học môn CSDL
select count(kq.MSSV) as 'Sinh viên học CSDL'
from KETQUA kq, GIANGDAY gd
where kq.MaKhoaHoc = gd.MaKhoaHoc
and gd.MaMH = 'CSDL'

--26 Có bao nhiêu môn học môn học được giảng dạy trong học kỳ 1 năm 2021
select distinct mh.TenMH as 'Tên Môn' from MONHOC mh inner join GIANGDAY gd on mh.MaMH = gd.MaMH where gd.HocKy = 1 and gd.Nam = 2021

--27 Cho biết điểm trung bình của sinh viên có mã số SV004.
select avg(kq.Diem) as 'Điểm trung bình'  from KETQUA kq where kq.MSSV ='SV004' 

--28 Cho biết mã, tên, địa chỉ và điểm trung bình của từng sinh viên
select sv.MSSV as 'Mã số', sv.Ten as 'Tên', sv.DiaChi as 'Địa chỉ', sum (mh.SoTC*kq.Diem)/sum(mh.SoTC) as 'Điểm TB'
from SINHVIEN sv, KETQUA kq, MONHOC mh,GIANGDAY gd 
where sv.MSSV = kq.MSSV and gd.MaKhoaHoc  = kq.MAKHOAHOC and gd.MaMH = mh.MAMH
GROUP BY sv.MSSV, sv.Ten, sv.DiaChi

--29 Cho biết số lượng điểm >=8 của từng sinh viên
select sv.MSSV as 'Mã số', sv.Ten as 'Sinh viên', count(kq.Diem) as 'Số lượng >= 8' 
from SINHVIEN sv, KETQUA kq where sv.MSSV = kq.MSSV and kq.Diem >= 8
group by sv.MSSV, sv.Ten

--30 Cho biết tên khoa, số lượng sinh viên có truong từng khoa
select k.TenKhoa as 'Tên Khoa', count(sv.MSSV) as 'Số lượng SV' from SINHVIEN sv, KHOA k where sv.MaKhoa = k.MaKhoa
group by k.TenKhoa

--31 Cho biết tên khoa, số lượng khóa học mà giáo viên của khoa có tham gia giảng dạy
select k.TenKhoa as 'Khoa', k.SL_CBGD as 'Số lượng GV' from KHOA k  

--32 Cho biết tên tất cả các sinh viên, điểm trung bình, số lượng khóa học đã tham gia
select sv.Ten as 'Tên SV', sum (mh.SoTC*kq.Diem)/sum(mh.SoTC) as 'Điểm TB', count(gd.MaKhoaHoc) as 'Tổng khóa học' 
from SINHVIEN sv inner join KETQUA kq on sv.MSSV = kq.MSSV
inner join GIANGDAY gd on gd.MaKhoaHoc = kq.MaKhoaHoc
inner join MONHOC mh on gd.MaMH = mh.MaMH
group by sv.Ten

--33 Cho biết số lượng tín chỉ mà từng sinh viên đã tham gia (gồm tên SV, mã SV, số lượng tín chỉ)
select sv.Ten as 'Tên SV', sv.MSSV as 'Mã số', count(mh.SoTC) as 'Số lượng tín chỉ'
from SINHVIEN sv inner join KETQUA kq on sv.MSSV = kq.MSSV
inner join GIANGDAY gd on gd.MaKhoaHoc = kq.MaKhoaHoc
inner join MONHOC mh on gd.MaMH = mh.MaMH
group by sv.MSSV, sv.Ten

--34 Cho biết tên sinh viên chỉ mới thi đúng 1 môn
select sv.Ten as 'Tên SV' from SINHVIEN sv inner join KETQUA kq on sv.MSSV = kq.MSSV group by sv.Ten having count(kq.MaKhoaHoc) = 1

--35 Cho biết mã, tên, địa chỉ và điểm của các sinh viên có điểm trung bình trên 8.5
select distinct sv.MSSV as 'Mã sv', sv.Ten as 'Tên SV', sum(mh.SoTC * kq.Diem) / sum(mh.SoTC) as 'Điểm' 
from SINHVIEN sv inner join KETQUA kq on sv.MSSV=kq.MSSV
inner join GIANGDAY gd on kq.MaKhoaHoc=gd.MaKhoaHoc
inner join MONHOC mh on mh.MaMH=gd.MaMH
group by sv.MSSV, sv.Ten, sv.DiaChi
having sum(mh.SoTC * kq.Diem) / sum(mh.SoTC) >= 8.5

--36 Cho biết Mã khoa học, học kỳ, năm, số lượng sinh viên tham gia của những khóa học
--có số lượng sinh viên tham gia (đã có điểm) từ 2 đến 4 sinh viên
select gd.MaMH as 'Mã môn học', gd.HocKy as 'Học Kỳ', gd.Nam as 'Năm', count(kq.MSSV) as 'Sô lượng sinh viên'
from KETQUA kq inner join GIANGDAY gd on kq.MaKhoaHoc = gd.MaKhoaHoc
where kq.Diem is not null
group by gd.MaMH, gd.HocKy, gd.nam
having count(kq.MSSV) between 2 and 4

--37 Cho biết các sinh viên học cả 2 môn 'CSDL' và 'CTDL' học có điểm của 1 trong 2 môn >=8
select distinct sv.MSSV as 'Mã', sv.Ten 'Tên SV' 
from SINHVIEN sv inner join KETQUA kq on kq.MSSV = sv.MSSV 
inner join GIANGDAY gd on gd.MaKhoaHoc = gd.MaKhoaHoc 
inner join MONHOC mh on mh.MaMH=gd.MaMH
where mh.MaMH in ('CSDL', 'CTDL') and kq.Diem >= 8

--38 Điểm cao nhất mà sinh viên đạt được trong các khóa học
select max(kq.Diem) as 'Diem cao nhat ma sinh vien dat duoc' from KETQUA kq

--39 Trong các môn học, số tín chỉ nhỏ nhất là bao nhiêu?
select TenMH as 'Tên môn học', SoTC as 'Số tín' 
from MONHOC 
where SoTC = (select min(SoTC) from MONHOC)

--40 Cho biết tên của môn học có số tín chỉ cao nhất
select TenMH as 'Tên môn học', SoTC as 'Số tín' 
from MONHOC 
where SoTC = (select max(SoTC) from MONHOC)

--41 Cho biết tên khoa có số lượng CBGD it nhất
select TenKhoa from KHOA where SL_CBGD = (select min(SL_CBGD) from KHOA)

--42 Tên các sinh viên có điểm cao nhất trong môn Kỹ thuật lập trình
select sv.Ten as 'Tên SV có điểm cao nhất trong môn KTLT' 
from SINHVIEN sv inner join KETQUA kq on sv.MSSV = kq.MSSV 
inner join GIANGDAY gd on gd.MaKhoaHoc = kq.MaKhoaHoc
inner join MONHOC mh on mh.MaMH = gd.MaMH
where mh.TenMH = 'KY THUAT LAP TRINH' and kq.Diem = (select max(Diem) from KETQUA)

--43 Cho biết thông tin sinh viên có điểm thi môn CSDL lớn nhất
select sv.MSSV, sv.Ten, sv.DiaChi, kq.Diem
from SINHVIEN sv 
inner join KETQUA kq on sv.MSSV = kq.MSSV
inner join GIANGDAY gd on kq.MaKhoaHoc = gd.MaKhoaHoc
where gd.MaMH = 'CSDL'
and kq.Diem = (select MAX(Diem) from KETQUA kq2 inner join GIANGDAY gd2 on kq2.MaKhoaHoc = gd2.MaKhoaHoc 
				where gd2.MaMH = 'CSDL')

--44 Cho biết tên các môn học có nhiều sinh viên tham gia nhất(Tên môn, số lượng SV)
select mh.TenMH, count(kq.MSSV) as 'Số lượng SV'
from MONHOC mh, KETQUA kq, GIANGDAY gd
where mh.MaMH= gd.MaMH and kq.MaKhoaHoc=gd.MaKhoaHoc
group by mh.TenMH, kq.MSSV
Having count(kq.MSSV) >= all(select count (kq.MSSV) 
from GIANGDAY gd inner join KETQUA kq on gd.MaKhoaHoc=kq.MaKhoaHoc
							group by kq.MSSV)

--45 Đối với mỗi môn học, cho biết tên và điểm của các sinh viên có điểm cao nhất
select sv.Ten, mh.MaMH, mh.TenMH, kq.Diem
from SINHVIEN sv inner join KETQUA kq on sv.MSSV=kq.MSSV
				 inner  join GIANGDAY gd on gd.MaKhoaHoc= kq.MaKhoaHoc
				 inner join MONHOC  mh on mh.MaMH=gd.MaMH
where kq.Diem = (select max(kq.Diem) 
from KETQUA kq inner join GIANGDAY gd on kq.MaKhoaHoc= gd.MaKhoaHoc )

--46 Học kỳ nào có nhiều môn học được giảng dạy nhất(không quan tâm đến năm học)
SELECT max(gd.HocKy) as 'Học kỳ có nhiều môn giảng dạy nhất'
FROM GIANGDAY gd 
group by gd.HocKy 
having count(gd.MaKhoaHoc) = 
(
	select max(sl_kh) 
	from (
			select count(MaKhoaHoc) as sl_kh 
			from GIANGDAY 
			group by HocKy
		 ) as Max_kh
)


--47 Cho biết tên sinh viên có nhiều điểm 7 nhất (Tên sinh viên, số lượng điểm 7)
select sv.Ten as 'Sinh viên có nhiều điểm 7 nhất', 
       count(kq.Diem) as 'Số lượng điểm 7'
from SINHVIEN sv 
inner join KETQUA kq on kq.MSSV = sv.MSSV
where kq.Diem = 7
group by sv.Ten
order by count(kq.Diem) desc

--48 Cho biết tên sinh viên có số lượng tín chỉ nhiều nhất (tên sinh viên, số lượng tín chỉ đã tham gia)
select top 1 sv.Ten as 'Sinh viên', sum(mh.SoTC) as 'Tổng số tin chỉ' from SINHVIEN sv inner join KETQUA kq on kq.MSSV = sv.MSSV
inner join GIANGDAY gd on gd.MaKhoaHoc = kq.MaKhoaHoc
inner join MONHOC mh on mh.MaMH = gd.MaMH
group by sv.Ten
order by sum(mh.SoTC) desc

--49 Cho biết tên môn học, tên sinh viên, điểm của các sinh viên học những môn học có số tín chỉ là thấp nhất
select mh.MaMH as 'Môn học', sv.Ten as 'Tên sinh viên', kq.Diem as 'Điểm' 
from MONHOC mh inner join GIANGDAY gd on gd.MaMH = mh.MaMH 
inner join KETQUA kq on kq.MaKhoaHoc = gd.MaKhoaHoc 
inner join SINHVIEN sv on sv.MSSV = kq.MSSV
where mh.SoTC = (select min(SoTC) from MONHOC)

--50 Cho biết tên những giáo viên tham gia giảng dạy nhiều nhất
select gv.TenGV from GIAOVIEN gv inner join GIANGDAY gd on gd.MaGV = gv.MaGV 
group by gv.TenGV 
having count(gd.MaGV) = 
(
    select max(SL_gv) 
    from(
		    select count(MaGV) SL_gv
			from GIANGDAY 
			group by MaGV
	    ) 
		as Max_SL_gv
)

--51 Tên các giảng viên không tham gia giảng dạy trong năm 2021
select distinct gv.TenGV as 'Tên các giảng viên không tham gia giảng dạy trong năm 2021' 
from GIAOVIEN gv inner join GIANGDAY gd on gd.MaGV = gv.MaGV
where gd.Nam not in (select nam from GIANGDAY where nam = 2021 )

--52 Cho biết tên các môn học không được tổ chức trong năm 2021
select mh.TenMH as 'Tên môn học không được tổ chức trong năm 2021' 
from MONHOC mh inner join GIANGDAY gd on gd.MaMH = mh.MaMH
where gd.Nam not in (select nam from GIANGDAY where nam = 2021)

--53 Tên nhưng khoa chưa có sinh viên theo học
SELECT TenKhoa as'Tên khoa chưa có sinh viên học'
FROM KHOA
WHERE MaKhoa NOT IN (SELECT MaKhoa FROM SINHVIEN)

--54 Cho biết những môn học chưa được tổ chức cho các khóa học
select mh.TenMH as 'Môn học' from MONHOC mh
where mh.MaMH not in (select MaMH from MONHOC)

--55 Cho biết tên những sinh viên chưa có điểm kiểm tra
select sv.Ten as 'Sinh viên chưa có điểm' 
from SINHVIEN sv inner join KETQUA kq on kq.MSSV = sv.MSSV
where sv.MSSV not in (select distinct kq.MSSV 
					  from KETQUA kq join SINHVIEN sv 
					  on kq.MSSV = sv.MSSV ) 
					  and kq.Diem is null

--56 Cho biêt tên những khoa không có sinh viên theo học
select k.TenKhoa as 'Tên khoa chưa có SV' from KHOA k left join SINHVIEN sv on k.MaKhoa = sv.MaKhoa
where k.MaKhoa not in (select MaKhoa from SINHVIEN)

--57 Tương tự cho biết tên sinh viên, số lượng môn mà sinh viên chưa học
SELECT sv.Ten, COUNT(mh.TenMH) AS 'so mon chua hoc'
FROM dbo.SinhVien sv CROSS JOIN dbo.MonHoc mh
LEFT OUTER JOIN dbo.KetQua kq INNER JOIN dbo.GiangDay gd ON kq.MaKhoaHoc = gd.MaKhoaHoc
ON sv.MSSV = kq.MSSV AND mh.MaMH = gd.MaMH
WHERE kq.Diem IS NULL
GROUP BY(sv.Ten)

--58 Cho biết các sinh viên chưa học môn LTC trên window
select distinct sv.Ten as 'Sinh viên' from SINHVIEN sv inner join KETQUA kq on kq.MSSV = sv.MSSV
inner join GIANGDAY gd on gd.MaKhoaHoc = kq.MaKhoaHoc
inner join MONHOC mh on mh.MaMH = gd.MaMH
where mh.TenMH != 'LAP TRINH C TREN WINDOW' --Chưa đúng

--59 Cho biết tên tất cả các giáo viên cùng với số lượng khóa học mà từng giáo viên đã tham gia giảng dạy
select gv.TenGV as 'Tên GV', count(gd.MaKhoaHoc) as 'Số lượng khóa học' 
from GIAOVIEN gv left join GIANGDAY gd on gd.MaGV = gv.MaGV
group by gv.TenGV

--60 Giả sử quy định mỗi sinh viên phải học đủ tất cả các môn học. Cho biết tên sinh viên, tên môn học mà sinh viên chưa học
select sv.Ten, mh.TenMH
from SINHVIEN sv, MONHOC mh
except 
	select sv.Ten, mh.TenMH
	from SINHVIEN sv, MONHOC mh, KETQUA kq, GIANGDAY gd
	where sv.MSSV=kq.MSSV and kq.MaKhoaHoc=gd.MaKhoaHoc and gd.MaMH=mh.MaMH

--61 Cho biết tên giáo viên tham gia dạy đầy đủ tất cả các môn
select  gv.MaGV, gv.TenGV
from  GIAOVIEN gv	
where not exists (select mh.MaMH from MONHOC mh except (select distinct gd.MaMH from GIANGDAY gd where gd.MaGV= gv.MaGV))

--62 Cho biết tên môn học mà tất cả các giáo viên đều có tham gia giảng dạy
select distinct mh.TenMH
from GIANGDAY gd,MONHOC mh
where gd.MaMH = mh.MaMH and 
not exists (select gd.MaGV from GIANGDAY gd except select gd.MaGV from GIANGDAY gd where gd.MaMH=mh.MaMH)

--63 Cho biêt khóa học mà tất cả các sinh viên đều tham gia


--64 Cho biết sinh viên tham gia đầy đủ tất cả các khóa học
select distinct sv.Ten 
from KETQUA kq1,SINHVIEN sv
where kq1.MSSV = sv.MSSV and 
not exists (select * from GIANGDAY gd where not exists (select * from KETQUA kq2 where kq2.MSSV = sv.MSSV and gd.MaKhoaHoc = kq2.MaKhoaHoc))

--65 Cho biêt tên môn học mà tất cả các sinh viên đều đã học
select mh.TenMH as 'môn học mà tất cả các sinh viên đều đã học'
from MONHOC mh
where not exists (select sv.MSSV from SINHVIEN sv where not exists(select * from KETQUA kq where kq.MSSV = sv.MSSV and kq.MaKhoaHoc = mh.MaMH))

--66 Cho biết tên sinh viên đã học đủ tất cả các môn
select sv.Ten as 'Tên sinh viên'
from SINHVIEN sv
where not exists (
    select mh.MaMH
    from MONHOC mh
    where not exists (select * from KETQUA kq where kq.MSSV = sv.MSSV and kq.MaKhoaHoc = mh.MaMH))

--67 Cho biết tên những sinh viên đã học tất cả các môn mà sinh viên SV001 đã học
select distinct sv.Ten as 'Tên sinh viên'
from SINHVIEN sv
where not exists (
    select mh.MaMH
    from MONHOC mh
    where not exists (select * from KETQUA kq where kq.MSSV = sv.MSSV and kq.MaKhoaHoc = mh.MaMH)) 
and exists (select * from KETQUA kq where kq.MSSV = 'SV001' and kq.MSSV = sv.MSSV)

--68 Cho biết tên các giáo viên dạy tất cả các môn mà giáo viên GV03 đã dạy
select distinct gv.TenGV as 'Tên giáo viên'
from GIAOVIEN gv
where not exists (select mh.MaMH from MONHOC mh where not exists (select * from GIANGDAY gd where gd.MaGV = gv.MaGV and gd.MaMH = mh.MaMH)) 
and exists (select * from GIANGDAY gd where gd.MaGV = 'GV03' and gd.MaGV = gv.MaGV)

--69 thêm các field SLMon, ĐTB, XL vào bảng SINHVIEN
alter table SinhVien
add SLMon int,
    DTB float,
    XL varchar(20)

-- 70 cập nhật thông tin cho các field:
--SLMon: tổng số lượng môn học mà sinh viên đã kiểm tra( có điểm)
--DTB: bằng tổng điểm sinh viên đã đạt được chia cho tổng số môn đã kiểm tra
--XepLoai: nếu điểm<5.0: Yếu
--5.0 <= điểm < 6.5: Trung bình
--6.5 <= điểm < 8.0: Khá
--8.0 <= điểm < 9.0: Giỏi
--9.0 <= điểm <= 10.0: Xuất sắc
UPDATE SINHVIEN
SET
    SLMon = (
        select count(*)
        from KETQUA kq1
        where SINHVIEN.MSSV = kq1.MSSV
        and kq1.Diem is not null
    ),
    DTB = (
        select sum(Diem * SoTC) / sum(SoTC)
        from KETQUA kq2
		inner join GIANGDAY gd on gd.MaKhoaHoc = kq2.MaKhoaHoc
        inner join MONHOC mh on gd.MaMH = mh.MaMH
        where SINHVIEN.MSSV = kq2.MSSV
        and kq2.Diem is not null
    ),
    XL = case
        when DTB < 5.0 then 'Yếu'
        when DTB >= 5.0 and DTB < 6.5 then 'Trung bình'
        when DTB >= 6.5 and DTB < 8.0 then 'Khá'
        when DTB >= 8.0 and DTB < 9.0 then 'Giỏi'
        else 'Xuất sắc'
    end;
--71 Xóa tất cả kết quả học tập của sinh viên SV002
delete from KETQUA where MSSV = 'SV002'

--72 Xóa tên những sinh viên có điểm trung bình dưới 5
delete from SINHVIEN where DTB < 5 

--73 Xóa tên những khoa không có sinh viên theo học
delete from KHOA where KHOA.MaKhoa in (select kh.MaKhoa from SINHVIEN sv right join Khoa kh on sv.MaKhoa = kh.MaKhoa where MSSV is null )

--Bài tập chương 6
--1 Hiển thi thông tin dựa vào mã truyền vào
-- Bảng Khoa
create proc sp_select_Khoa
@MaKhoa varchar(10) as 
begin
	select * from KHOA WHERE MaKhoa = @MaKhoa 
end

--Bảng Sinh Viên
create proc sp_select_sinhvien
@MSSV varchar(5) as
begin 
	select * from SINHVIEN where MSSV = @MSSV
end

--Bảng Giáo Viên
create proc sp_select_GiaoVien
@MaGV varchar(5) as
begin 
	select * from GIAOVIEN where MaGV = @MaGV
end

--Bảng Môn Học
create proc sp_select_MonHoc
@MaMH varchar(5) as
begin
	select * from MONHOC where MaMH = @MaMH
end

--Bảng Giảng Dạy
create proc sp_select_GiangDay
@MaKhoaHoc varchar(5) as
begin
	select * from GIANGDAY where MaKhoaHoc = @MaKhoaHoc
end

--Bảng Kết quả
create proc sp_select_KetQua
@MaSV varchar(5) as
begin
	select * from KETQUA where MSSV = @MaSV
end

--2 Thêm mới thông tin vào một bảng, Yêu cầu masv bắt buộc phải có, nếu không hiển thị thông báo lỗi.
--Bảng Khoa
create proc sp_insert_Khoa
@MaKhoa varchar(10),
@TenKhoa nvarchar(50),
@SL_CBGD smallint
as 
begin
	insert into KHOA(MaKhoa, TenKhoa, SL_CBGD) 
	values (@MaKhoa, @TenKhoa, @SL_CBGD) 
end

--Bảng Giáo Viên
create proc sp_insert_GiaoVien
@MaGV varchar(5),
@TenGV nvarchar(50),
@MaKhoa varchar(10)
as
begin
	insert into GIAOVIEN(MaGV, TenGV, MaKhoa)
	values(@MaGV, @TenGV, @MaKhoa)
end

--Bảng Sinh Viên
create proc sp_insert_SinhVien
@MSSV varchar(5),
@Ten nvarchar(50),
@GioiTinh varchar(5),
@DiaChi nvarchar(100),
@DienThoai varchar(20),
@MaKhoa varchar(10)
as
begin
	insert into SINHVIEN(MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa)
	values (@MSSV, @Ten, @GioiTinh, @DiaChi, @DienThoai, @MaKhoa)
end

--Bảng Môn Học
create proc sp_insert_MonHoc 
@MaMH varchar(5),
@TenMH nvarchar(50),
@SoTC smallint 
as
begin
	insert into MONHOC (MaMH, TenMH, SoTC)
	values (@MaMH, @TenMH, @SoTC)
end

--Bảng Giảng Dạy
create proc sp_insert_GiangDay
@MaKhoaHoc varchar(5),
@MaGV varchar(5),
@MaMH varchar(5),
@HocKy smallint,
@Nam int
as
begin 
	insert into GIANGDAY(MaKhoaHoc,MaGV,MaMH,Nam)
	values (@MaKhoaHoc,@MaGV,@MaMH,@Nam)
end

--Bảng Kết Quả
create proc sp_insert_KetQua
@MSSV varchar(5),
@MaKhoaHoc varchar(5),
@Diem decimal(3,1)
as
begin
	insert into KETQUA(MSSV,MaKhoaHoc,Diem)
	values (@MSSV,@MaKhoaHoc,@Diem)
end

--3 Sửa thông tin dựa vào masv. Kiểm tra nếu biến nào khác NULL thì mới cập nhật.
--Bảng Khoa
create proc sp_update_Khoa
@MaKhoa varchar(10),
@TenKhoa nvarchar(50),
@SL_CBGD smallint
as 
begin
	update KHOA set
	MaKhoa = case when @MaKhoa is not null then @MaKhoa else MaKhoa end,
	TenKhoa = case when @TenKhoa is not null then @TenKhoa else TenKhoa end,
	SL_CBGD = case when @SL_CBGD is not null then @SL_CBGD else SL_CBGD end
end
--Bảng SinhVien
create proc sp_update_SinhVien
@MSSV varchar(5),
@Ten nvarchar(50),
@GioiTinh varchar(5),
@DiaChi nvarchar(100),
@DienThoai varchar(20),
@MaKhoa varchar(10)
as
begin
	update SINHVIEN set
	MSSV = case when @MSSV is not null then @MSSV else MSSV end,
	Ten = case when @Ten is not null then @Ten else Ten end,
	GioiTinh = case when @GioiTinh is not null then @GioiTinh else GioiTinh end,
	DiaChi = case when @DiaChi is not null then @DiaChi else DiaChi end,
	DienThoai = case when @DienThoai is not null then @DienThoai else DienThoai end,
	MaKhoa = case when @MaKhoa is not null then @MaKhoa else MaKhoa end
end

--Bảng GiaoVien
create proc sp_update_GiaoVien
@MaGV varchar(5),
@TenGV nvarchar(50),
@MaKhoa varchar(10)
as
begin
	update GIAOVIEN set
	MaGV = case when @MaGV is not null then @MaGV else MaGV end,
	TenGV = case when @TenGV is not null then @TenGV else TenGV end,
	MaKhoa = case when @MaKhoa is not null then @MaKhoa else MaKhoa end
end

--Bảng MonHoc
create proc sp_update_MonHoc
@MaMH varchar(5),
@TenMH nvarchar(50),
@SoTC smallint 
as
begin
	update MONHOC set
	MaMH = case when @MaMH is not null then @MaMH else MaMH end,
	TenMH = case when @TenMH is not null then @TenMH else TenMH end,
	SoTC = case when @SoTC is not null then @SoTC else SoTC end
end

--Bảng GiangDay
create proc sp_update_GIANGDAY
@MaKhoaHoc varchar(5),
@MaGV varchar(5),
@MaMH varchar(5),
@HocKy smallint,
@Nam int
as
begin
    update GIANGDAY set
    MaGV = case when @MaGV is not null then @MaGV else MaGV end,
    MaMH = case when @MaMH is not null then @MaMH else MaMH end,
	HocKy = case when @HocKy is not null then @HocKy else HocKy end,
    Nam = case when @Nam is not null then @Nam else Nam end
    where MaKhoaHoc = @MaKhoaHoc;
end
--Bảng KetQua
--4 Xóa thông tin dựa vào mã truyền
--Bảng Khoa
create proc sp_Delete_Khoa
@MaKhoa varchar(10)
as
begin
    if exists (select 1 from Khoa where MaKhoa = @MaKhoa)
    begin delete from Khoa where MaKhoa = @MaKhoa end
    else
    begin PRINT N'dữ liệu không tồn tại' end
end

--Bảng SinhVien
create proc sp_Delete_SinhVien 
@MSSV varchar(5)
as 
begin
    if exists (select 1 from SINHVIEN where MSSV = @MSSV)
    begin delete from SINHVIEN where MSSV = @MSSV end
    else
    begin PRINT N'dữ liệu không tồn tại' end
end


--Bảng GiaoVien
create proc sp_Delete_GiaoVien
@MaGV varchar(5)
as
begin
	if exists (select 1 from GIAOVIEN where MaGV = @MaGV)
	begin delete from GIAOVIEN where MaGV = @MaGV end
	else 
	begin PRINT N'dữ liệu không tồn tại' end
end

--Bảng MonHoc
create proc sp_Delete_MonHoc
@MaMH varchar(5)
as
begin
	if exists (select 1 from MONHOC where MaMH = @MaMH)
	begin delete from MONHOC where MaMH = @MaMH end
	else 
	begin PRINT N'dữ liệu không tồn tại' end
end

--Bảng GiangDay
create proc sp_Delete_GiangDay
@MaKhoaHoc varchar(5)
as
begin
	if exists (select 1 from GIANGDAY where MaKhoaHoc = @MaKhoaHoc)
	begin delete from GIANGDAY where MaKhoaHoc = @MaKhoaHoc end
	else 
	begin PRINT N'dữ liệu không tồn tại' end
end

--Bảng KetQua
create proc sp_Delete_KetQua
@MSSV varchar(5)
as
begin
	if exists (select 1 from KETQUA where mssv = @MSSV)
	begin delete from KETQUA where mssv = @MSSV end
	else 
	begin PRINT N'dữ liệu không tồn tại' end
end