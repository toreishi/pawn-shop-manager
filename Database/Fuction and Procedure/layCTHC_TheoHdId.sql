--lấy chi tiết hàng cầm dựa vào hợp đồng id
ALTER PROC layCTHC_TheoHdId(@hd_id int)
AS
BEGIN
	select
		cthc.cthc_ten_hang_cam as 'tenMH',
		cthc.cthc_soluong as 'soLuong',
		cthc.cthc_giatri as 'giaTri',
		cthc.cthc_BienSoXe as 'bienSo',
		cthc.cthc_ChatLuong as 'chatLuong',
		cthc.cthc_LoaiXe as 'loaiXe',
		cthc.tchc_NhanSoXe as 'nhanSoXe',
		cthc.loai_id as 'loai'
	from tbl_Chi_Tiet_Hang_Cam cthc
	where cthc.delete_flag = 0
	  and cthc.hd_id = @hd_id
END

exec layCTHC_TheoHdId 2512