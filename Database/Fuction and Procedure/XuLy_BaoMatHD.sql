--xử lý báo mất hợp đồng
CREATE PROC XuLy_BaoMatHD(@hd_id int, @ngayBaoMat date)
AS
BEGIN
	update tbl_Hop_Dong
	set hd_baomat = 1, hd_ngayBaoMat = @ngayBaoMat
	where hd_id = @hd_id
END