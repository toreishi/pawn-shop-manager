--lấy các hợp đồng chưa chuộc theo thangs
CREATE PROC layHD_ChuaChuoc_Thang(@Thang int, @Nam int)
AS
BEGIN
	select 
		hd.hd_maBN as 'maHD',
		hd.hd_kh_Ten as 'tenKH',
		hd.hd_kh_DienThoai as 'dienThoai',
		hd.hd_tien_cam as 'tienCam',
		CONVERT(VARCHAR(10),hd.hd_ngaytao, 103) as 'ngayCam',
		CONVERT(VARCHAR(10),DATEADD(day,59,hd.hd_ngaytao), 103) as 'ngayHetHan',
		Datediff(day, hd.hd_ngaytao, GETDATE()) as 'soNgayCam'
	from tbl_Hop_Dong hd
	where hd.hd_trangthai = 1
	  and delete_flag = 0
	  
	  and MONTH(hd.hd_ngaytao) = @Thang
	  and YEAR(hd.hd_ngaytao) = @Nam
	ORDER BY hd.hd_maBN	
END

exec layHD_ChuaChuoc_Thang 2,2011


