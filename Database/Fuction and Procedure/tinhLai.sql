--tính lãi
ALTER PROC tinhLai(
	@hd_id int, @ngayCam date, @ngayChuoc date, @tienCam float, 
	@laiSuatThoaThuan float, @laiSuatQuaHan float, @thoiHan int, 
	@coThemTien int, @tienLaiThoaThuan float output, @tienLaiQuaHan float output)
AS
BEGIN
	set @tienLaiThoaThuan = 0
	set @tienLaiQuaHan = 0
	if(@coThemTien = 0)--không thêm tiền
	begin
		declare @soNgayCam int
		set @soNgayCam = DATEDIFF(DAY, @ngayCam, @ngayChuoc) + 1
		declare @soNgayHetHan int
		set @soNgayHetHan = @thoiHan * 30
		if(@soNgayCam <= @soNgayHetHan) --chưa hết hạn
		begin
			declare @laisuat float
			set @laisuat = (@laiSuatThoaThuan / 30) * @soNgayCam
            set @tienLaiThoaThuan = @tienCam * @laisuat / 100
		end

		--quá hạn
		if(@soNgayCam > @soNgayHetHan)
		begin
			declare @laisuatTT float
			set @laisuatTT = (@laiSuatThoaThuan / 30) * @soNgayHetHan;
			declare @laisuatQH float
			set @laisuatQH = (@laiSuatQuaHan / 30) * (@soNgayCam - @soNgayHetHan)
			set @tienLaiThoaThuan = @tienCam * @laisuatTT / 100
			set @tienLaiQuaHan = @tienCam * @laisuatQH / 100
		end		
	end
	else --có thêm tiền
	begin
		declare @tienLaiTaiThoiDiemThemTien float
		declare @ngayThemTien date
		set @tienLaiTaiThoiDiemThemTien = (select tt.them_tienlai from tbl_Them_Tien tt where tt.hd_id = @hd_id)
		set @ngayThemTien = (select tt.them_ngaytao from tbl_Them_Tien tt where tt.hd_id = @hd_id)
		
		declare @soNgayCamMoi int
		set @soNgayCamMoi  = DATEDIFF(DAY, @ngayThemTien, @ngayChuoc) + 1
		set @laisuat = (@laiSuatThoaThuan / 30) * @soNgayCamMoi
        set @tienLaiThoaThuan = (@tienCam * @laisuat / 100) + @tienLaiTaiThoiDiemThemTien
	end
END
