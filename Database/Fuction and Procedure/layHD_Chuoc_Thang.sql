--lấy các hợp đồng đã được chuộc theo tháng
CREATE PROC layHD_Chuoc_Thang(@Thang int, @Nam int)
AS
BEGIN
	select
		hd.hd_maBN as 'maHD',
		hd.hd_kh_Ten as 'tenKH',
		hd.hd_kh_DienThoai as 'dienThoai',
		hd.hd_tien_cam as 'tienCam',
		CONVERT(VARCHAR(10),hd.hd_ngaytao, 103) as 'ngayCam',
		CONVERT(VARCHAR(10),DATEADD(day,59,hd.hd_ngaytao), 103) as 'ngayHetHan',
		Datediff(day, hd.hd_ngaytao, chuoc.chuoc_ngaytao) as 'soNgayCam'
	from tbl_Hop_Dong hd,tbl_Chuoc_Hang chuoc
	where chuoc.hd_id = hd.hd_id
	  and hd.hd_trangthai = 2 --2: đã chuộc
	  --check delete
	  and hd.delete_flag = 0
	  and chuoc.delete_flag = 0
		 
	  and MONTH(hd.hd_ngaytao) = @Thang
	  and YEAR(hd.hd_ngaytao) = @Nam
	ORDER BY hd.hd_maBN	
END
exec layHD_Chuoc_Thang 2,2011