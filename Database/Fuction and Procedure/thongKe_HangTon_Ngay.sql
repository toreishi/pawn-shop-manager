--thống kê hàng tồn theo ngày
ALTER PROC thongKe_HangTon_Ngay(@Ngay int, @Thang int, @Nam int)
AS
BEGIN
	select
		hd.hd_maBN as 'maHD',
		loai.loaihang_ten as 'loaiHang',
		cthc.cthc_ten_hang_cam as 'tenMatHang',
		cthc.cthc_soluong as 'soLuong',
		CASE  
		  WHEN cthc.loai_id IN (2,3,4) THEN 'chỉ' 
		  ELSE 'chiếc' 
		END as 'donViTinh',
		cthc.cthc_chatluong as 'chatLuong',
		cthc.cthc_BienSoXe as 'bienSo',
		cthc.cthc_loaixe as 'loaiXe',
		cthc.loai_id as 'loaiHangId'
	from tbl_Hop_Dong hd, tbl_Chi_Tiet_Hang_Cam cthc, tbl_Loai_Hang loai
	where hd.hd_id = cthc.hd_id	  
	  and loai.loaihang_id = cthc.loai_id
	  and hd.hd_trangthai = 1 --1: chưa chuộc
	  --check delete
	  and hd.delete_flag = 0
	  and cthc.delete_flag = 0
	
	  and DAY(hd.hd_ngaytao) = @Ngay
	  and MONTH(hd.hd_ngaytao) = @Thang
	  and YEAR(hd.hd_ngaytao) = @Nam
	ORDER BY hd.hd_maBN	
END
exec thongKe_HangTon_Ngay 3,12,2015