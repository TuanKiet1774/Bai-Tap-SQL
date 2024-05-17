create database QL_ThuVien;
use QL_ThuVien;

create table DocGia(
Ma_DocGia varchar(10) constraint pk_mdg primary key,
Ho nvarchar(10),
TenLot nvarchar(10),
Ten nvarchar(10),
NgaySinh date,
)

create table NguoiLon(
Ma_DocGia varchar(10) constraint pk_mdg_nguoilon primary key,
SoNha nvarchar(100),
Duong nvarchar(100),
Quan nvarchar(100),
DienThoai nvarchar(20),
HanSuDung date,
)
alter table NguoiLon add constraint fk_DocGia_NguoiLon foreign key (Ma_DocGia) references DocGia(Ma_DocGia);

create table TreEm(
Ma_DocGia varchar(10) constraint pk_mdg_treem primary key,
Ma_DocGia_NguoiLon varchar(10) foreign key references NguoiLon(Ma_DocGia),
)
alter table TreEm add constraint fk_DocGia_TreEm foreign key (Ma_DocGia) references DocGia(Ma_DocGia);

create table TuaSach(
Ma_TuaSach varchar(10) constraint pk_mts primary key,
Tua_Sach nvarchar(100),
TacGia nvarchar(100),
TomTat nvarchar(1000),
)

create table DauSach(
ISBN varchar(20) constraint pk_isbn primary key,
Ma_TuaSach varchar(10) constraint fk_mts_ds foreign key references TuaSach(Ma_TuaSach),
NgonNgu nvarchar(10),
Bia nvarchar(10),
TrangThai nvarchar(10),
)

create table DangKy(
ISBN varchar(20),
Ma_DocGia varchar(10),
NgayDK date,
GhiChu nvarchar(100) null,
constraint pk_dangky primary key(ISBN,Ma_DocGia),
constraint fk_dk_ds foreign key (ISBN) references DauSach(ISBN),
constraint fk_dk_dg foreign key (Ma_DocGia) references DocGia(Ma_DocGia),
)

create table CuonSach(
ISBN varchar(20) constraint fk_cs_ds foreign key references DauSach(ISBN),
Ma_CuonSach varchar(10),
TinhTrang nvarchar(10),
constraint pk_MUON primary key(ISBN,Ma_CuonSach),
)

create table MUON(
ISBN varchar(20),
Ma_CuonSach varchar(10),
Ma_DocGia varchar(10) foreign key references DocGia(Ma_DocGia),
NgayMuon date,
NgayHetHan date,
constraint pk_m primary key (ISBN,Ma_CuonSach),
)
alter table MUON add constraint  fk_Muon_CuonSach foreign key (ISBN, Ma_CuonSach) references CuonSach (ISBN, Ma_CuonSach);

create table QuaTrinhMuon(
ISBN varchar(20),
Ma_CuonSach varchar(10),
NgayMuon date,
Ma_DocGia varchar(10),
NgayHetHan date,
NgayTra date,
TienMuon money,
TienDaTra money,
TienDatCoc money,
GhiChu nvarchar(100) null,
constraint pk_qtm primary key (ISBN, Ma_CuonSach, NgayMuon),
constraint fk_qtm_cs foreign key (ISBN, Ma_CuonSach) references CuonSach(ISBN, Ma_CuonSach),
constraint fk_qtm_dg foreign key (Ma_DocGia) references DocGia(Ma_DocGia)
)

-- Bảng DocGia
INSERT INTO DocGia (Ma_DocGia, Ho, TenLot, Ten, NgaySinh)
VALUES 
('DG001', 'Nguyen', 'Van', 'A', '1990-05-15'),
('DG002', 'Tran', 'Thi', 'B', '1985-08-20'),
('DG003', 'Le', 'Minh', 'C', '2000-01-10'),
('DG004', 'Pham', 'Anh', 'D', '1998-03-25'),
('DG005', 'Hoang', 'Quoc', 'E', '1995-11-30');

-- Bảng NguoiLon
INSERT INTO NguoiLon (Ma_DocGia, SoNha, Duong, Quan, DienThoai, HanSuDung)
VALUES 
('DG001', '123', 'Nguyen Van Cu', 'Quan 1', '1234567890', '2024-12-31'),
('DG002', '456', 'Le Loi', 'Quan 3', '0987654321', '2024-12-31'),
('DG004', '789', 'Vo Van Tan', 'Quan 10', '0123456789', '2024-12-31');

-- Bảng TreEm
INSERT INTO TreEm (Ma_DocGia, Ma_DocGia_NguoiLon)
VALUES 
('DG003', 'DG001'),
('DG005', 'DG002');

-- Bảng TuaSach
INSERT INTO TuaSach (Ma_TuaSach, Tua_Sach, TacGia, TomTat)
VALUES 
('TS001', 'Harry Potter', 'J.K. Rowling', 'Câu chuyện về một cậu bé phù thủy...'),
('TS002', 'Game of Thrones', 'George R.R. Martin', 'Một thế giới của các quốc gia chiến đấu...'),
('TS003', 'To Kill a Mockingbird', 'Harper Lee', 'Một cuốn tiểu thuyết về sự bất công và lòng tự trọng...');

-- Bảng DauSach
INSERT INTO DauSach (ISBN, Ma_TuaSach, NgonNgu, Bia, TrangThai)
VALUES 
('9780545582889', 'TS001', 'Tiếng Anh', 'Mềm', 'Còn'),
('9780553593716', 'TS002', 'Tiếng Anh', 'Cứng', 'Còn'),
('9780061120084', 'TS003', 'Tiếng Anh', 'Cứng', 'Đã Mất');

-- Bảng DangKy
INSERT INTO DangKy (ISBN, Ma_DocGia, NgayDK, GhiChu)
VALUES 
('9780545582889', 'DG001', '2024-03-10', NULL),
('9780553593716', 'DG002', '2024-03-11', NULL),
('9780553593716', 'DG004', '2024-03-12', NULL),
('9780061120084', 'DG003', '2024-03-13', NULL),
('9780061120084', 'DG005', '2024-03-14', NULL);

-- Bảng CuonSach
INSERT INTO CuonSach (ISBN, Ma_CuonSach, TinhTrang)
VALUES 
('9780545582889', 'CS001', 'Sẵn có'),
('9780553593716', 'CS002', 'Sẵn có'),
('9780553593716', 'CS003', 'Sẵn có'),
('9780061120084', 'CS004', 'Đang mượn'),
('9780061120084', 'CS005', 'Sẵn có');

-- Bảng MUON
INSERT INTO MUON (ISBN, Ma_CuonSach, Ma_DocGia, NgayMuon, NgayHetHan)
VALUES 
('9780061120084', 'CS004', 'DG003', '2024-03-15', '2024-03-22'),
('9780061120084', 'CS005', 'DG005', '2024-03-16', '2024-03-23');

-- Bảng QuaTrinhMuon
INSERT INTO QuaTrinhMuon (ISBN, Ma_CuonSach, NgayMuon, Ma_DocGia, NgayHetHan, NgayTra, TienMuon, TienDaTra, TienDatCoc, GhiChu)
VALUES 
('9780061120084', 'CS004', '2024-03-15', 'DG003', '2024-03-22', NULL, 0, 0, 0, NULL),
('9780061120084', 'CS005', '2024-03-16', 'DG005', '2024-03-23', NULL, 0, 0, 0, NULL);

--1 Có bao nhiêu phiếu mượn sách thư viện trong năm qua
select count(Ma_DocGia) as 'Số phiếu mượn' from MUON 

--2 Cho biết danh sách số ngày mượn sách của các lần đã mượn sách
select NgayMuon as 'Danh sách số ngày mượn' from QuaTrinhMuon 

--3 Cho biết danh sách số ngày mượn sách trung bình của các lần đã mượn sách


--4 Cho biết danh sách những phiếu mượn trả sách quá hạn
select qtm.Ma_DocGia as 'Danh sách phiếu mượn trả sách quá hạn' from QuaTrinhMuon qtm where qtm.NgayTra > qtm.NgayHetHan 

--5 Cho biết danh sách (độc giả, sách được mượn) những độc giả đã được mượn quá hạn
select dg.Ho+' '+dg.TenLot+' '+dg.Ten as 'Tên độc giả', ts.Tua_Sach as 'Tên cuốn sách' 
from DocGia dg inner join QuaTrinhMuon qtm on qtm.Ma_DocGia = dg.Ma_DocGia
inner join CuonSach cs on cs.Ma_CuonSach = qtm.Ma_CuonSach 
inner join DauSach ds on ds.ISBN = cs.ISBN
inner join TuaSach ts on ts.Ma_TuaSach = ds.Ma_TuaSach
where qtm.NgayTra > qtm.NgayHetHan

--6 Cho biết danh sách (độc giả, sách được mượn) những độc giả đã và đang được mượn quá hạn
select dg.Ho+' '+dg.TenLot+' '+dg.Ten as 'Tên độc giả', ts.Tua_Sach as 'Tên cuốn sách' 
from DocGia dg inner join QuaTrinhMuon qtm on qtm.Ma_DocGia = dg.Ma_DocGia
inner join CuonSach cs on cs.Ma_CuonSach = qtm.Ma_CuonSach 
inner join DauSach ds on ds.ISBN = cs.ISBN
inner join TuaSach ts on ts.Ma_TuaSach = ds.Ma_TuaSach
where qtm.NgayTra is null and qtm.NgayTra > qtm.NgayHetHan

--7 Số lượng sách nhiều nhất mà một người đã mượn
select Ma_DocGia as 'Mã độc giả' ,count(Ma_CuonSach) as 'Số lương sách mượn' from MUON group by Ma_DocGia;

--8 Bạn đọc sách nhiều nhất là ngày nào

--Bài tập chương 6 
--4.1 Xem thông tin đọc giả 
create proc sp_ThongtinDocGia
@MaDocGia varchar(10)
as
begin
    if exists (select 1 from NguoiLon where Ma_DocGia = @MaDocGia) select * from NguoiLon where Ma_DocGia = @MaDocGia;
    else select * from TreEm where Ma_DocGia = @MaDocGia
end

--4.2 Thông tin đầu sách
create proc sp_ThongtinDausach
@ISBN varchar(20)
as
begin
    select ts.Tua_Sach as 'Tên sách', ts.TacGia as 'Tác giả', count(CS.Ma_CuonSach) as 'Số lượng', ds.ISBN, ds.NgonNgu as 'Ngôn ngữ', ds.Bia, ds.TrangThai
    from DauSach ds
    inner join TuaSach ts on ds.Ma_TuaSach = ts.Ma_TuaSach
    inner join CuonSach cs on ds.ISBN = cs.ISBN
    where DS.ISBN = @ISBN
    group by ts.Tua_Sach, ts.TacGia, ds.ISBN, ds.NgonNgu, ds.Bia, ds.TrangThai
end

--4.3 Liệt kê những độc giả người lơn đang mượn sách
create proc sp_ThongtinNguoilonDangmuon
as
begin
	select dg.Ma_DocGia as 'Mã',dg.TenLot+' '+dg.Ten as 'Họ tên', dg.NgaySinh as 'Ngày sinh', count(*) as 'Số lượng sách mượn'
	from DocGia dg inner join NguoiLon nl on dg.Ma_DocGia = nl.Ma_DocGia
	inner join MUON m on m.Ma_DocGia = nl.Ma_DocGia 
	inner join QuaTrinhMuon qt on qt.Ma_DocGia = dg.Ma_DocGia
	where qt.NgayTra is null
	group by dg.Ma_DocGia, dg.TenLot, dg.Ten, dg.NgaySinh
end

--4.4 Liệt kê những độc giả người lơn đang mượn sách
create proc sp_ThongtinNguoilonQuahan
as
begin
	select dg.Ma_DocGia as 'Mã',dg.TenLot+' '+dg.Ten as 'Họ tên', dg.NgaySinh as 'Ngày sinh', count(*) as 'Số lượng sách mượn'
	from DocGia dg inner join NguoiLon nl on dg.Ma_DocGia = nl.Ma_DocGia
	inner join MUON m on m.Ma_DocGia = nl.Ma_DocGia 
	inner join QuaTrinhMuon qt on qt.Ma_DocGia = dg.Ma_DocGia
	where qt.NgayTra is null and getdate() > qt.NgayHetHan
	group by dg.Ma_DocGia, dg.TenLot, dg.Ten, dg.NgaySinh	
end

--4.5 Liệt kê những người lớn đang mượn sách có trẻ em cũng đang mượn sách
create proc DocGiaCoTreEmMuon
as 
begin
	select dg.Ma_DocGia as 'Mã',dg.TenLot+' '+dg.Ten as 'Họ tên'
	from DocGia dg inner join NguoiLon nl on nl.Ma_DocGia = dg.Ma_DocGia
	inner join TreEm te on te.Ma_DocGia_NguoiLon = nl.Ma_DocGia
end

--4.6 Cập nhật trạng thái của đầu sách
create proc CapnhatTrangthaiDausach
@ISBN varchar(20)
as
begin
	update DauSach 
	set TrangThai = case when exists (select 1 from CuonSach where ISBN = @ISBN) then 'Yes' else 'No' end
    where ISBN = @ISBN;
end

--4.7 Thêm tựa sách mới
create proc sp_ThemTuaSachMoi
@Ma_TuaSach varchar(10),
@Tua_Sach nvarchar(100),
@TacGia nvarchar(100),
@TomTat nvarchar(1000)
as
begin
	if not exists (select 1 from TuaSach where Tua_Sach = @Tua_Sach and TacGia = @TacGia and TomTat = @TomTat)
	begin
		insert into TuaSach (Ma_TuaSach, Tua_Sach, TacGia, TomTat) values (@Ma_TuaSach, @Tua_Sach, @TacGia, @TomTat) 
		print N'Thêm tựa sách mới thành công'
	end
	else
	begin
		print N'Tựa sách đã tồn tại, không thể thêm'
	end
end

--4.8 Thêm cuốn sách mới
create proc sp_ThemCuonSach
@ISBN varchar(20),
@Ma_CuonSach varchar(10)
as
begin
    if not exists (select 1 from  DauSach where ISBN = @ISBN)
    begin
        print N'Mã ISBN không tồn tại'
        return
    end
    insert into CuonSach (ISBN, Ma_CuonSach, TinhTrang) values (@ISBN, @Ma_CuonSach, 'Yes')
    update DauSach set TrangThai = 'Yes' where ISBN = @ISBN;
end

--4.9 Thêm độc giả người lớn
create proc sp_ThemNguoiLon
@Ma_DocGia varchar(10),
@Ho nvarchar(10),
@TenLot nvarchar(10),
@Ten nvarchar(10),
@NgaySinh date
as
begin
    if not exists (select 1 from DocGia where Ma_DocGia = @Ma_DocGia)
    begin 
        if datediff (year, @NgaySinh, getdate()) > 18
        begin
            insert into DocGia (Ma_DocGia, Ho, TenLot, Ten, NgaySinh)
			values (@Ma_DocGia, @Ho, @TenLot, @Ten, @NgaySinh)
            print N'Thêm độc giả thành công';
        end
        else
        begin
            print N'Độc giả phải lớn hơn 18 tuổi để được thêm vào';
        end
    end
    else
    begin
        print N'Đã tồn tại độc giả này';
    end
end

--4.10 Thêm độc giả trẻ em
create proc sp_ThemTreEm
@Ma_DocGia_NguoiLon varchar(10),
@Ma_DocGia_TreEm varchar(10)
as
begin
    declare @MaTreEm varchar(10);
    set @MaTreEm = 'dg' + convert(varchar(5), (select count(*) from DocGia) + 1);
    insert into DocGia (Ma_DocGia, Ho, TenLot, Ten, NgaySinh)
    values(@MaTreEm, '', '', '', GETDATE());
    declare @SoTreEm int;
    select @SoTreEm = count(*) from TreEm where Ma_DocGia_NguoiLon = @Ma_DocGia_NguoiLon;
    if @SoTreEm >= 5
    begin
        print N'Độc giả người lớn đã bảo lãnh quá số lượng trẻ em cho phép.';
        Return
    end
    else
    begin
        insert into TreEm (Ma_DocGia, Ma_DocGia_NguoiLon)
        values (@Ma_DocGia_TreEm, @Ma_DocGia_NguoiLon);
        print N'Thêm thông tin trẻ em thành công.';
    end
end

--4.11 Xóa độc giả
CREATE PROCEDURE sp_XoaDocGia
    @Ma_DocGia varchar(10)
AS
BEGIN 
    -- [1] Kiểm tra xem độc giả có tồn tại hay không
    IF NOT EXISTS (SELECT 1 FROM DocGia WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        PRINT N'Không tồn tại độc giả có mã ' + @Ma_DocGia;
        RETURN;
    END

    -- [2] Kiểm tra độc giả có đang mượn sách hay không
    IF EXISTS (SELECT 1 FROM MUON WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        PRINT N'Độc giả đang mượn sách, không thể xóa được.';
        RETURN;
    END

    -- [3] Kiểm tra độc giả là người lớn hay trẻ em
    IF EXISTS (SELECT 1 FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        -- [3.1] Nếu độc giả là người lớn
        DECLARE @CoTreEm int;
        SELECT @CoTreEm = COUNT(*) FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia;

        IF @CoTreEm = 0
        BEGIN
            -- [3.1.1] Xóa trong bảng DangKy
            DELETE FROM DangKy WHERE Ma_DocGia = @Ma_DocGia;
            -- [3.1.2] Xóa trong bảng QuaTrinhMuon
            DELETE FROM QuaTrinhMuon WHERE Ma_DocGia = @Ma_DocGia;
            -- [3.1.3] Xóa trong bảng NguoiLon
            DELETE FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia;
        END
        ELSE
        BEGIN
            -- [3.1.3.1] Tìm và xóa trẻ em mà độc giả này bảo lãnh
            DECLARE @TreEmMaDocGia varchar(10);
            SELECT @TreEmMaDocGia = Ma_DocGia FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia;

            -- [3.1.3.2] Xóa trẻ em nếu có
            DECLARE @XoaTreEm int;
            EXEC @XoaTreEm = sp_XoaDocGia @TreEmMaDocGia;

            IF @XoaTreEm = 0
            BEGIN
                PRINT N'Không thể xóa được độc giả vì trẻ em đang mượn sách.';
                RETURN;
            END
            ELSE
            BEGIN
                -- [3.1.3.3] Xóa trong bảng DangKy
                DELETE FROM DangKy WHERE Ma_DocGia = @Ma_DocGia;
                -- [3.1.3.4] Xóa trong bảng QuaTrinhMuon
                DELETE FROM QuaTrinhMuon WHERE Ma_DocGia = @Ma_DocGia;
                -- [3.1.3.5] Xóa trong bảng NguoiLon
                DELETE FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia;
            END
        END
    END
    ELSE
    BEGIN
        -- [3.2] Nếu độc giả là trẻ em
        -- [3.2.1] Xóa trong bảng DangKy
        DELETE FROM DangKy WHERE Ma_DocGia = @Ma_DocGia;
        -- [3.2.2] Xóa trong bảng QuaTrinhMuon
        DELETE FROM QuaTrinhMuon WHERE Ma_DocGia = @Ma_DocGia;
        -- [3.2.3] Xóa trong bảng TreEm
        DELETE FROM TreEm WHERE Ma_DocGia = @Ma_DocGia;
    END

    -- [4] Xóa trong bảng DocGia
    DELETE FROM DocGia WHERE Ma_DocGia = @Ma_DocGia;

    PRINT N'Xóa thông tin độc giả thành công.';
    RETURN;
END

--4.13 Mượn sách
CREATE PROCEDURE sp_MuonSach
    @ISBN varchar(20),
    @Ma_DocGia varchar(10),
    @NgayMuon date
AS
BEGIN
    IF EXISTS (SELECT 1 FROM MUON WHERE ISBN = @ISBN AND Ma_DocGia = @Ma_DocGia)
    BEGIN
        PRINT N'Đã mượn quyển sách này rồi.';
        RETURN;
    END

    DECLARE @SoLuongSachMuon int = (SELECT COUNT(*) FROM MUON WHERE Ma_DocGia = @Ma_DocGia);

    IF EXISTS (SELECT 1 FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        IF @SoLuongSachMuon >= 5
        BEGIN
            PRINT N'Người lớn đã mượn tối đa số lượng sách cho phép.';
            RETURN;
        END
    END
    ELSE
    BEGIN
        IF @SoLuongSachMuon >= 1
        BEGIN
            PRINT N'Trẻ em đã mượn tối đa số lượng sách cho phép.';
            RETURN;
        END
    END

    DECLARE @SoLuongSachCon int = (SELECT COUNT(*) FROM CuonSach WHERE ISBN = @ISBN AND TinhTrang = 'Sẵn có');

    IF @SoLuongSachCon > 0
    BEGIN
        INSERT INTO MUON (ISBN, Ma_DocGia, NgayMuon) VALUES (@ISBN, @Ma_DocGia, @NgayMuon);
        UPDATE CuonSach SET TinhTrang = 'Đang mượn' WHERE ISBN = @ISBN AND TinhTrang = 'Sẵn có';
        EXEC sp_CapNhatTrangThaiDauSach @ISBN;
        PRINT N'Đã mượn sách thành công.';
    END
    ELSE
    BEGIN
        PRINT N'Hiện không còn sách này trong thư viện.';
        EXEC sp_DangKySach @ISBN, @Ma_DocGia, @NgayMuon;
    END
END

--4.14 Trả sách
CREATE PROCEDURE sp_TraSach
    @ISBN varchar(20),
    @Ma_CuonSach varchar(10),
    @Ma_DocGia varchar(10),
    @NgayTra date
AS
BEGIN
    DECLARE @NgayMuon date = (SELECT NgayMuon FROM MUON WHERE ISBN = @ISBN AND Ma_CuonSach = @Ma_CuonSach AND Ma_DocGia = @Ma_DocGia);
    DECLARE @SoNgayTreHan int = DATEDIFF(day, @NgayMuon, @NgayTra) - 14;
    DECLARE @TienPhat money = CASE WHEN @SoNgayTreHan > 0 THEN @SoNgayTreHan * 1000 ELSE 0 END;

    INSERT INTO QuaTrinhMuon (ISBN, Ma_CuonSach, Ma_DocGia, NgayMuon, NgayHetHan, NgayTra, TienMuon, TienDaTra, TienDatCoc)
    VALUES (@ISBN, @Ma_CuonSach, @Ma_DocGia, @NgayMuon, DATEADD(day, 14, @NgayMuon), @NgayTra, @TienPhat, NULL, NULL);

    DELETE FROM MUON WHERE ISBN = @ISBN AND Ma_CuonSach = @Ma_CuonSach AND Ma_DocGia = @Ma_DocGia;
END

--4.15 Tạo các trigger
CREATE TRIGGER tg_delMuon
ON MUON
AFTER DELETE
AS
BEGIN
    UPDATE CuonSach
    SET TinhTrang = 'Yes'
    FROM CuonSach
    INNER JOIN deleted ON CuonSach.ISBN = deleted.ISBN AND CuonSach.Ma_CuonSach = deleted.Ma_CuonSach;
END
CREATE TRIGGER tg_insMuon
ON MUON
AFTER INSERT
AS
BEGIN
    UPDATE CuonSach
    SET TinhTrang = 'No'
    FROM CuonSach
    INNER JOIN inserted ON CuonSach.ISBN = inserted.ISBN AND CuonSach.Ma_CuonSach = inserted.Ma_CuonSach;
END
CREATE TRIGGER tg_updCuonSach
ON CuonSach
AFTER UPDATE
AS
BEGIN
    UPDATE DauSach
    SET TrangThai = CASE 
                        WHEN EXISTS (SELECT 1 FROM inserted WHERE TinhTrang = 'No') THEN 'Còn'
                        ELSE 'Hết'
                    END
    FROM DauSach
    INNER JOIN inserted ON DauSach.ISBN = inserted.ISBN;
END
CREATE TRIGGER Tg_themmoi
ON TuaSach
AFTER INSERT, UPDATE
AS
BEGIN
    PRINT 'Đã thêm mới';
END
CREATE TRIGGER Tg_suathongtin
ON TuaSach
AFTER UPDATE
AS
BEGIN
    DECLARE @Ma_TuaSach varchar(10);
    DECLARE @TacGiaCu nvarchar(100);
    DECLARE @TacGiaMoi nvarchar(100);

    DECLARE cursor_update CURSOR FOR
    SELECT inserted.Ma_TuaSach, deleted.TacGia, inserted.TacGia
    FROM inserted
    INNER JOIN deleted ON inserted.Ma_TuaSach = deleted.Ma_TuaSach;

    OPEN cursor_update;
    FETCH NEXT FROM cursor_update INTO @Ma_TuaSach, @TacGiaCu, @TacGiaMoi;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Vừa sửa thông tin của tựa sách có mã số ' + @Ma_TuaSach;
        PRINT 'Mã tựa sách: ' + @Ma_TuaSach + ', Tác giả cũ: ' + @TacGiaCu + ', Tác giả mới: ' + @TacGiaMoi;
        FETCH NEXT FROM cursor_update INTO @Ma_TuaSach, @TacGiaCu, @TacGiaMoi;
    END
    CLOSE cursor_update;
    DEALLOCATE cursor_update;
END

--4.16 tg_themtuasach
CREATE TRIGGER Tg_themtuasach
ON TuaSach
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM TuaSach ts1 INNER JOIN inserted i ON ts1.Tua_Sach = i.Tua_Sach)
    BEGIN
        PRINT 'Tên tựa sách đã tồn tại, không thể thêm mới.';
    END
    ELSE
    BEGIN
        INSERT INTO TuaSach (Tua_Sach, TacGia)
        SELECT Tua_Sach, TacGia FROM inserted;
        PRINT 'Đã thêm mới';
    END
END

