--lấy toàn bộ mã biên nhận trong năm để làm source cho dropdown textbox
CREATE PROC layTatCaMaBN
AS
BEGIN
	select distinct hd.hd_maBN
	from tbl_Hop_Dong hd
	where hd.delete_flag = 0
	  and YEAR(hd.hd_ngaytao) = YEAR(GETDATE())
END