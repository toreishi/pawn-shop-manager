--tiến hành chuộc đồ
CREATE PROC Xuly_ChuocDo(
			@hd_id int, @ngayChuoc date, 
			@tienLaiThoaThuan float, @tienLaiQuaHan float, 
			@tienTangGiam float, @tongTien float)
AS
BEGIN
	--cập nhật lại trạng thái của hợp đồng
	update tbl_Hop_Dong
	set hd_trangthai = 2 --2: đã chuộc
	where hd_id = @hd_id
	--thêm vào bảng chuộc đồ
	declare @ngayCam date
	set @ngayCam = (select hd.hd_ngaytao from tbl_Hop_Dong hd where hd.hd_id = @hd_id)
	declare @soNgay int
	set @soNgay = DATEDIFF(DAY, @ngayCam, @ngayChuoc) + 1
	
	insert into tbl_Chuoc_Hang(hd_id, chuoc_ngaytao, chuoc_songay, chuoc_tienlai_thoathuan, chuoc_tienlai_quahan, chuoc_tanggiam, chuoc_tongtien)
	values(@hd_id, @ngayChuoc, @soNgay, @tienLaiThoaThuan, @tienLaiQuaHan, @tienTangGiam, @tongTien)
END

