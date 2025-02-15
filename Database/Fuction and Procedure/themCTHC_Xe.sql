--thêm chi tiết hàng cầm, loại xe
CREATE PROC themCTHC_Xe(@hd_id int, @bienSo varchar(15), @giaTri float, 
			@chatLuong nvarchar(50), @loaiXe nvarchar(50), @nhanSoXe nvarchar(50))
AS
BEGIN
	declare @tenMH nvarchar(50)
	set @tenMH = @loaiXe + ' ' + @bienSo
	insert into tbl_Chi_Tiet_Hang_Cam
		(hd_id, cthc_soluong, cthc_giatri, cthc_ten_hang_cam,loai_id, cthc_BienSoXe, cthc_ChatLuong, cthc_LoaiXe, tchc_NhanSoXe)
	values
		(@hd_id, 
		 1, --số lượng, cầm xe thì 1 thôi chứ mấy
		@giaTri,
		@tenMH, --tên hàng cầm, lấy loại xe + biển số
		1, --loai_id: 1 là xe
		@bienSo, 
		@chatLuong,
		@loaiXe,
		@nhanSoXe)
END

exec themCTHC_Xe 2506, '54P7-1801', 25000000, N'Xe cũ', 'Air Blade', N'nhãn số xe là cái lồng gì?'
select * from tbl_Hop_Dong hd where hd.hd_maBN = 1 and YEAR(hd.hd_ngaytao) = 2015
select * from tbl_Chi_Tiet_Hang_Cam cthc where cthc.hd_id = 2506