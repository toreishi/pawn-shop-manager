--thêm mới thu chi
CREATE PROC themTHUCHI2(@tc_loai int, @tc_tien float, 
					@tc_note nvarchar(300),
					@keyAuto int output)
AS
BEGIN
	
	insert into tbl_Thu_Chi
		(tc_loai, tc_tien, tc_note)
		values (
					@tc_loai, -- 1: thu 2: chi
					@tc_tien, 
					@tc_note
				)
	SET @keyAuto = SCOPE_IDENTITY();
	--print @keyAuto
	Select SCOPE_IDENTITY() as 'keyAuto'
END

DECLARE @result int;
exec themTHUCHI2 1,20000000, 'Trả lương cho chó 2', @result output
select @result as 'result'
select * from tbl_Thu_Chi where tbl_Thu_Chi.tc_id = 6002

exec layMaBN_Max