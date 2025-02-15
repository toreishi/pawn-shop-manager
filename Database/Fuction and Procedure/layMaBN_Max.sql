--lấy mã biên nhận cao nhất trong 1 năm nào đó, khi thêm vào bảng hợp đồng thì +1 vào.
ALTER PROC layMaBN_Max (@maBN_max int output)
AS
BEGIN
	set @maBN_max = (
	select top 1 hd_maBN
	from tbl_Hop_Dong
	where year(hd_ngaytao) = YEAR(GETDATE())
	  and delete_flag = 0
	order by hd_maBN desc)
	if @maBN_max is null  set @maBN_max = 1
	else set @maBN_max = @maBN_max + 1
END

declare @a int
exec layMaBN_Max @a output
select @a