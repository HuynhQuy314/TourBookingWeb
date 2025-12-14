-- Sử dụng cơ sở dữ liệu
USE TourBookingDB;
GO

--Chọn nhiều dòng → Nhấn Ctrl + K rồi Ctrl + C để comment nhiều dòng (-- mỗi dòng)
--Nhấn Ctrl + K rồi Ctrl + U để bỏ commen

-- 1. Xóa dữ liệu (phải xóa theo đúng thứ tự tránh lỗi FK)
-- 2. Reset IDENTITY (cho tất cả bảng về 0 → dòng tiếp theo sẽ là 1)
--DELETE FROM Images;
--DELETE FROM Bookings;
--DELETE FROM Tours;
--DELETE FROM Users;
--DELETE FROM Categories;
--DELETE FROM TourSchedules;
--GO

--DELETE FROM AspNetUserTokens;
--DELETE FROM AspNetUserLogins;
--DELETE FROM AspNetUserRoles;
--DELETE FROM AspNetUserClaims;
--DELETE FROM AspNetUsers;
--GO

--DBCC CHECKIDENT ('Images', RESEED, 0);
--DBCC CHECKIDENT ('Bookings', RESEED, 0);
--DBCC CHECKIDENT ('Tours', RESEED, 0);
--DBCC CHECKIDENT ('Users', RESEED, 0);
--DBCC CHECKIDENT ('Categories', RESEED, 0);
--DBCC CHECKIDENT ('TourSchedules', RESEED, 0);
--GO

-- Categories
INSERT INTO Categories (CategoryName)
VALUES (N'Du lịch Miền Bắc'),
	   (N'Du lịch Miền Nam'),
	   (N'Du lịch Miền Trung'),
	   (N'Du lịch Nước ngoài');
GO


-- Tours
INSERT INTO Tours (Title, Capacity, Description, AdultPrice, ChildPrice, Transport, Destination, Duration, Itinerary, CategoryId)
VALUES

--Miền Bắc
--1
(N'Tour Hà Giang mùa hoa tam giác mạch 3N2Đ', 30, 
N'Hà Giang mùa hoa tam giác mạch là bức tranh tuyệt đẹp của núi rừng Tây Bắc. Tham gia tour, bạn sẽ được chiêm ngưỡng thảm hoa tím trải dài khắp các sườn đồi, len lỏi qua những bản làng mộc mạc. Ngoài ra, bạn còn có cơ hội ghé thăm cao nguyên đá Đồng Văn, cột cờ Lũng Cú – điểm cực Bắc của Tổ quốc. Cung đường đèo Mã Pí Lèng hiểm trở nhưng tuyệt đẹp sẽ để lại cho bạn những ký ức khó quên.', 
2800000, 2000000, N'Xe du lịch giường nằm', 
N'Hà Giang - Đồng Văn', N'3 ngày 2 đêm', 
N'Ngày 1: Hà Nội – Quản Bạ – Yên Minh
Ngày 2: Cao nguyên đá Đồng Văn – Lũng Cú – Mã Pí Lèng
Ngày 3: Phố cổ Đồng Văn – quay về Hà Nội', 
1),
--2
(N'Tour Tràng An – Bái Đính 1N', 45, 
N'Tràng An – Bái Đính là điểm đến tâm linh nổi tiếng tại Ninh Bình. Chùa Bái Đính với quy mô lớn nhất Việt Nam sẽ khiến du khách choáng ngợp. Sau đó, bạn sẽ được trải nghiệm ngồi thuyền dọc theo dòng suối trong xanh, len lỏi qua các hang động kỳ vĩ tại Tràng An – Di sản văn hóa thế giới được UNESCO công nhận.', 
1100000, 800000, N'Xe du lịch', 
N'Ninh Bình', N'1 ngày', 
N'Ngày 1: Hà Nội – Bái Đính – Tràng An – Hà Nội', 
1),

--3
(N'Tour Mộc Châu mùa hoa mận 2N1Đ', 35, 
N'Mộc Châu vào mùa hoa mận như khoác lên mình chiếc áo trắng tinh khôi. Du khách sẽ được đắm chìm trong những thung lũng trắng xóa hoa mận, hòa mình vào khí hậu mát lành của cao nguyên. Hành trình còn đưa bạn tham quan đồi chè trái tim, thác Dải Yếm, và thưởng thức những đặc sản nổi tiếng như sữa chua, bê chao.', 
1900000, 1400000, N'Xe du lịch', 
N'Mộc Châu', N'2 ngày 1 đêm', 
N'Ngày 1: Hà Nội – đồi chè – bản Áng
Ngày 2: Thác Dải Yếm – Hang Dơi – quay về Hà Nội', 
1),


--4
(N'Tour Tam Đảo mùa sương 2N1Đ', 25,
N'Tam Đảo – nơi nghỉ dưỡng gần Hà Nội, được mệnh danh là "Đà Lạt phía Bắc". Tour đưa bạn khám phá thác Bạc, nhà thờ đá cổ, quảng trường trung tâm và thưởng thức ẩm thực phố núi.',
1800000, 1300000, N'Xe du lịch',
N'Tam Đảo – Vĩnh Phúc', N'2 ngày 1 đêm',
N'Ngày 1: Hà Nội – Tam Đảo – tham quan thác Bạc, nhà thờ đá
Ngày 2: Cầu mây, quảng trường Tam Đảo – quay về',
1),

--5
(N'Tour Sapa Fansipan mùa đông 3N2Đ', 28, 
N'Thử thách bản thân trên nóc nhà Đông Dương – đỉnh Fansipan huyền thoại. Trải nghiệm bầu không khí se lạnh, ngắm nhìn băng tuyết phủ trắng núi rừng Sa Pa vào mùa đông. Hành trình kết hợp thăm bản Cát Cát, chinh phục đỉnh Fansipan bằng cáp treo và thưởng thức ẩm thực nướng nóng hổi.', 
3400000, 2500000, N'Tàu hỏa + xe', 
N'Sa Pa - Lào Cai', N'3 ngày 2 đêm', 
N'Ngày 1: Hà Nội – Sa Pa – bản Cát Cát
Ngày 2: Cáp treo Fansipan – đỉnh núi
Ngày 3: Chợ Sa Pa – quay về Hà Nội', 
1),

--6
(N'Tour Ba Vì – Làng Văn hóa 1N', 40,
N'Tour phù hợp cho du lịch trong ngày, kết hợp giữa thiên nhiên và khám phá văn hóa dân tộc Việt Nam. Tham quan Vườn Quốc gia Ba Vì, làng dân tộc Tày, Mường, Khmer,...',
900000, 700000, N'Xe du lịch',
N'Ba Vì – Hà Nội', N'1 ngày',
N'Ngày 1: Xuất phát từ Hà Nội – VQG Ba Vì – Làng Văn hóa các dân tộc Việt Nam – về Hà Nội',
1),

--7
(N'Tour Mai Châu bản Lác 2N1Đ', 30,
N'Tour khám phá bản sắc dân tộc Thái tại Mai Châu. Du khách sẽ được ngủ nhà sàn, giao lưu văn nghệ, đạp xe quanh bản, và ngắm nhìn ruộng lúa xanh mướt giữa núi rừng.',
1900000, 1400000, N'Xe du lịch',
N'Mai Châu – Hòa Bình', N'2 ngày 1 đêm',
N'Ngày 1: Hà Nội – Mai Châu – bản Lác
Ngày 2: Đạp xe quanh bản – về Hà Nội',
1),

--8
(N'Tour Yên Tử – Hạ Long lễ hội xuân 2N1Đ', 30, 
N'Tham gia hành trình du xuân đầu năm với điểm đến Yên Tử linh thiêng và vịnh Hạ Long – kỳ quan thế giới. Lễ Phật cầu an tại chùa Đồng, khám phá thiên nhiên vịnh biển với những hang động kỳ vĩ như hang Sửng Sốt, động Thiên Cung.', 
2700000, 1900000, N'Xe du lịch + du thuyền', 
N'Quảng Ninh', N'2 ngày 1 đêm', 
N'Ngày 1: Hà Nội – Yên Tử – chùa Đồng
Ngày 2: Hạ Long – du ngoạn vịnh – quay về Hà Nội', 
1),


--9
(N'Tour Hà Nội – Hà Giang – Đồng Văn 3N2Đ', 30,
N'Khám phá cao nguyên đá Đồng Văn, Mã Pí Lèng, Lũng Cú và văn hóa vùng cao.',
3500000, 2500000, N'Xe du lịch',
N'Hà Giang', N'3 ngày 2 đêm',
N'Ngày 1: Hà Nội – Yên Minh
Ngày 2: Đồng Văn – Lũng Cú – Mã Pí Lèng
Ngày 3: Tham quan và chiều trở về Hà Nội',
1),

--10
(N'Tour Hà Nội – Mộc Châu – Mai Châu 3N2Đ', 30,
N'Thưởng ngoạn đồi chè, thác Dải Yếm, bản Lác và giao lưu văn hóa dân tộc Thái.',
2900000, 2100000, N'Xe du lịch',
N'Mộc Châu – Mai Châu', N'3 ngày 2 đêm',
N'Ngày 1: Hà Nội – Mộc Châu – đồi chè
Ngày 2: Thác Dải Yếm – Mai Châu
Ngày 3: Tham quan và trở về Hà Nội',
1),


--Miền Nam
--11
(N'Tour Phú Quốc 4N3Đ - Thiên đường nghỉ dưỡng', 25,
N'Phú Quốc - thiên đường biển đảo Việt Nam, nổi tiếng với bãi cát trắng mịn, nước biển trong xanh. Tour đưa bạn khám phá Vinpearl Safari, VinWonders, lặn biển ngắm san hô tại Hòn Thơm và trải nghiệm cáp treo vượt biển dài nhất thế giới. Ngoài ra, du khách sẽ được thưởng thức hải sản tươi ngon và tham quan Dinh Cậu, chợ đêm Phú Quốc.', 
4700000, 3200000, N'Máy bay + Xe du lịch',
N'Phú Quốc', N'4 ngày 3 đêm',
N'Ngày 1: Bay đến Phú Quốc – Check-in Dinh Cậu
Ngày 2: VinWonder – Safari Phú Quốc
Ngày 3: Hòn Thơm – Cáp treo vượt biển
Ngày 4: Nghỉ dưỡng tự do – chợ đêm',
2),

--12
(N'Tour Đà Lạt 3N2Đ - Thành phố ngàn hoa', 30,
N'Đà Lạt – thành phố ngàn hoa, luôn mê hoặc du khách bởi tiết trời se lạnh quanh năm, những đồi thông xanh mướt và khung cảnh nên thơ. Tour sẽ đưa bạn tham quan những điểm nổi tiếng như Đồi chè Cầu Đất, hồ Tuyền Lâm, Thung lũng tình yêu và khu du lịch Langbiang, chợ đêm Đà Lạt.', 
2600000, 1800000, N'Xe du lịch',
N'Đà Lạt', N'3 ngày 2 đêm',
N'Ngày 1: Khởi hành đến Đà Lạt – Check-in hồ Tuyền Lâm
Ngày 2: Thung lũng tình yêu – Langbiang
Ngày 3: Chợ Đà Lạt – mua sắm – về lại',
2),


--13
(N'Tour Cần Thơ - Sóc Trăng 2N1Đ - Miền Tây sông nước', 40,
N'Thưởng thức vẻ đẹp sông nước đặc trưng miền Tây. Tour đưa bạn tham quan chợ nổi Cái Răng nhộn nhịp buổi sáng, thưởng thức đặc sản miệt vườn và tìm hiểu văn hóa Khmer qua các ngôi chùa cổ kính tại Sóc Trăng.', 
1900000, 1300000, N'Xe + tàu',
N'Cần Thơ - Sóc Trăng', N'2 ngày 1 đêm',
N'Ngày 1: Cần Thơ – chợ nổi Cái Răng – bến Ninh Kiều
Ngày 2: Sóc Trăng – chùa Dơi – chùa Đất Sét',
2),


--14
(N'Tour Nha Trang biển xanh 3N2Đ', 35,
N'Nha Trang được mệnh danh là “Hòn ngọc của biển Đông” với bãi biển dài tuyệt đẹp, làn nước trong vắt. Tour khám phá Tháp Bà Ponagar, tắm bùn khoáng nóng, tham gia các trò chơi tại VinWonders và thưởng thức hải sản tươi ngon trên phố biển.', 
2900000, 2100000, N'Máy bay + xe du lịch',
N'Nha Trang', N'3 ngày 2 đêm',
N'Ngày 1: Bay đến Nha Trang – check-in Tháp Bà
Ngày 2: VinWonders – tắm biển Trần Phú
Ngày 3: Mua sắm chợ Đầm – bay về',
2),


--15
(N'Tour Vũng Tàu 2N1Đ', 50,
N'Vũng Tàu – thiên đường du lịch gần Sài Gòn. Chỉ với 2 ngày, bạn sẽ được thỏa sức tắm biển tại Bãi Sau, tham quan Tượng Chúa Ki-tô Vua nổi tiếng và thưởng thức hải sản tươi sống tại các chợ hải sản.', 
1400000, 1000000, N'Xe du lịch',
N'Vũng Tàu', N'2 ngày 1 đêm',
N'Ngày 1: Sài Gòn – Vũng Tàu – Bãi Sau
Ngày 2: Tượng Chúa Kitô – Chợ hải sản – quay về',
2),


--16
(N'Tour Bến Tre – Cồn Phụng 1N', 45,
N'Tour trong ngày khám phá vùng đất dừa, trải nghiệm xuồng ba lá trên sông Tiền, thưởng thức trái cây và đờn ca tài tử miệt vườn tại Cồn Phụng.',
950000, 700000, N'Xe + tàu',
N'Bến Tre – Tiền Giang', N'1 ngày',
N'Ngày 1: Sài Gòn – Mỹ Tho – Cồn Phụng – về lại Sài Gòn',
2),

--17
(N'Tour Tây Ninh – Núi Bà Đen 1N', 40,
N'Tour hành hương kết hợp tham quan, trải nghiệm cáp treo lên đỉnh núi Bà Đen – nóc nhà Nam Bộ. Khám phá khu du lịch Sun World, viếng chùa Bà và thưởng thức đặc sản Tây Ninh.',
890000, 690000, N'Xe du lịch + cáp treo',
N'Tây Ninh', N'1 ngày',
N'Ngày 1: Sài Gòn – Núi Bà Đen – chùa Bà – quay về',
2),

--18
(N'Tour Côn Đảo 3N2Đ - Huyền thoại linh thiêng', 30,
N'Khám phá Côn Đảo với vẻ đẹp hoang sơ và lịch sử linh thiêng, tham quan nhà tù Côn Đảo, viếng mộ chị Võ Thị Sáu và tắm biển Đầm Trầu.',
3790000, 2790000, N'Máy bay + Xe du lịch',
N'Côn Đảo', N'3 ngày 2 đêm',
N'Ngày 1: Bay đến Côn Đảo – Nhà tù Côn Đảo
Ngày 2: Viếng mộ Võ Thị Sáu – Đầm Trầu
Ngày 3: Mua sắm – Bay về',
2),


--19
(N'Tour Đồng Tháp – Làng hoa Sa Đéc 1N', 35,
N'Tham quan làng hoa Sa Đéc rực rỡ sắc màu và thưởng thức ẩm thực miền Tây dân dã.',
1400000, 1000000, N'Xe du lịch',
N'Đồng Tháp', N'1 ngày',
N'Ngày 1: Sài Gòn – Sa Đéc – Làng hoa – Trở về',
2),

--20
(N'Tour Châu Đốc – Rừng Trà Sư 2N1Đ', 38,
N'Tham quan miếu Bà Chúa Xứ và trải nghiệm rừng tràm Trà Sư bằng xuồng máy.',
1490000, 1150000, N'Xe + Thuyền',
N'Châu Đốc – An Giang', N'2 ngày 1 đêm',
N'Ngày 1: Sài Gòn – Châu Đốc – miếu Bà
Ngày 2: Rừng tràm Trà Sư – về lại',
2),



--21
(N'Tour Cần Giờ 1N – Rừng ngập mặn', 40,
N'Tham quan đảo khỉ, rừng ngập mặn và bãi biển 30/4 Cần Giờ.',
900000, 700000, N'Xe du lịch',
N'Cần Giờ', N'1 ngày',
N'Ngày 1: Sài Gòn – đảo Khỉ – rừng ngập mặn – về lại',
2),





--Miền trung
--22
(N'Tour Huế - Đà Nẵng - Hội An 4N3Đ', 40,
N'Tour du lịch di sản miền Trung, kết hợp tham quan cố đô Huế, phố cổ Hội An và thành phố hiện đại Đà Nẵng. Tham quan Đại Nội, chùa Thiên Mụ, bãi biển Mỹ Khê, Ngũ Hành Sơn và thưởng thức ẩm thực miền Trung.',
4300000, 3100000, N'Máy bay + Xe du lịch',
N'Huế - Đà Nẵng - Hội An', N'4 ngày 3 đêm',
N'Ngày 1: Đến Huế – Đại Nội – chùa Thiên Mụ
Ngày 2: Đà Nẵng – Bãi biển Mỹ Khê – cầu Rồng
Ngày 3: Hội An – phố cổ – chùa Cầu
Ngày 4: Ngũ Hành Sơn – bay về',
3),


--23
(N'Tour Quy Nhơn – Kỳ Co – Eo Gió 3N2Đ', 35,
N'Khám phá thiên đường biển Quy Nhơn, nổi tiếng với bãi biển hoang sơ, làn nước trong vắt và các địa điểm check-in tuyệt đẹp như Kỳ Co, Eo Gió, Ghềnh Ráng Tiên Sa.',
3200000, 2300000, N'Máy bay + Xe',
N'Quy Nhơn – Bình Định', N'3 ngày 2 đêm',
N'Ngày 1: Bay đến Quy Nhơn – Ghềnh Ráng – mộ Hàn Mặc Tử
Ngày 2: Kỳ Co – Eo Gió – tắm biển
Ngày 3: Chợ Quy Nhơn – bay về',
3),


--24
(N'Tour Quảng Bình – Phong Nha – Động Thiên Đường 3N2Đ', 30,
N'Hành trình khám phá thiên nhiên kỳ vĩ tại Quảng Bình với di sản Phong Nha – Kẻ Bàng, động Thiên Đường – được ví như hoàng cung dưới lòng đất. Tour kết hợp du thuyền trên sông Son, khám phá di tích lịch sử và thưởng thức ẩm thực địa phương.',
3100000, 2200000, N'Xe + Thuyền',
N'Quảng Bình', N'3 ngày 2 đêm',
N'Ngày 1: Đến Đồng Hới – biển Nhật Lệ
Ngày 2: Phong Nha – Động Thiên Đường
Ngày 3: Thăm di tích – về lại',
3),




--25
(N'Tour Quảng Ngãi – Đảo Lý Sơn 2N1Đ', 28,
N'Tham quan đảo Lý Sơn, khám phá miệng núi lửa, cột cờ Tổ Quốc và thưởng thức hải sản tươi sống.', 
2500000, 1800000, N'Xe + tàu cao tốc',
N'Lý Sơn – Quảng Ngãi', N'2 ngày 1 đêm',
N'Ngày 1: Quảng Ngãi – đảo Lý Sơn – cột cờ
Ngày 2: Hang Câu – chùa Hang – quay về',
3),




--26
(N'Tour Phú Yên – Ghềnh Đá Đĩa – Bãi Xép 2N1Đ', 35,
N'Tham quan xứ hoa vàng cỏ xanh với Ghềnh Đá Đĩa, Bãi Xép, đầm Ô Loan.', 
2200000, 1600000, N'Xe du lịch',
N'Phú Yên', N'2 ngày 1 đêm',
N'Ngày 1: Tuy Hòa – Ghềnh Đá Đĩa – đầm Ô Loan
Ngày 2: Bãi Xép – Tháp Nhạn – quay về',
3),


--27
(N'Tour Quảng Trị – Thành cổ – cầu Hiền Lương 2N1Đ', 30,
N'Tour về nguồn, tìm hiểu lịch sử với thành cổ Quảng Trị, sông Bến Hải và cầu Hiền Lương.', 
2000000, 1500000, N'Xe du lịch',
N'Quảng Trị', N'2 ngày 1 đêm',
N'Ngày 1: Huế – thành cổ – cầu Hiền Lương
Ngày 2: Nghĩa trang Trường Sơn – quay về',
3),



-- TOUR NƯỚC NGOÀI 
--28
(N'Tour Nhật Bản Tokyo – Núi Phú Sĩ 6N5Đ', 25,
N'Tour du lịch Nhật Bản khám phá thủ đô Tokyo hiện đại, cổ kính Kyoto và biểu tượng núi Phú Sĩ. Trải nghiệm văn hóa trà đạo, mặc kimono, tham quan lâu đài Osaka.',
18500000, 13500000, N'Máy bay + Tàu cao tốc',
N'Nhật Bản – Tokyo – Kyoto – Osaka', N'6 ngày 5 đêm',
N'Ngày 1: Bay đến Tokyo – thăm đền Asakusa
Ngày 2: Tháp Tokyo – cung điện Hoàng gia
Ngày 3: Núi Phú Sĩ – hồ Kawaguchi
Ngày 4: Kyoto – phố cổ Gion
Ngày 5: Osaka – lâu đài Osaka
Ngày 6: Mua sắm – bay về',
4),



--29
(N'Tour Trung Quốc 5N4Đ – Bắc Kinh – Vạn Lý Trường Thành', 30, 
N'Tham quan thủ đô Bắc Kinh, quảng trường Thiên An Môn, Cố Cung, và Vạn Lý Trường Thành.', 
15500000, 12000000, N'Máy bay + xe', 
N'Trung Quốc', N'5 ngày 4 đêm', 
N'Ngày 1: Bay đến Bắc Kinh – Thiên An Môn
Ngày 2: Cố Cung – Di Hòa Viên
Ngày 3: Vạn Lý Trường Thành – Olympic Park
Ngày 4: Mua sắm Vương Phủ Tỉnh
Ngày 5: Phượng Hoàng Cổ Trấn - Bay về', 
4),


--30
(N'Tour Indonesia 4N3Đ – Bali – Ubud', 28, 
N'Khám phá Bali huyền bí, thăm đền Uluwatu, làng nghệ sĩ Ubud và thưởng thức ẩm thực Indonesia.', 
13500000, 9900000, N'Máy bay + xe', 
N'Indonesia', N'4 ngày 3 đêm', 
N'Ngày 1: Bay đến Bali – đền Uluwatu
Ngày 2: Làng Ubud – ruộng bậc thang Tegalalang
Ngày 3: Đền Tanah Lot – biển Kuta
Ngày 4: Mua sắm – bay về', 
4),


--31
(N'Tour Malaysia 4N3Đ – Kuala Lumpur – Genting', 35, 
N'Tham quan tháp đôi Petronas, cao nguyên Genting, động Batu.', 
8900000, 6900000, N'Máy bay + xe', 
N'Malaysia', N'4 ngày 3 đêm', 
N'Ngày 1: Bay đến Kuala Lumpur – city tour
Ngày 2: Batu Cave – Genting Highland
Ngày 3: Mua sắm – Petronas
Ngày 4: Bay về', 
4),


--32
(N'Tour Úc 7N6Đ – Sydney – Melbourne', 20, 
N'Tour khám phá nước Úc hiện đại, thăm nhà hát con sò, vườn thú Taronga và thung lũng Yarra.', 
42900000, 35900000, N'Máy bay + xe', 
N'Úc', N'7 ngày 6 đêm', 
N'Ngày 1: Bay đến Sydney – Opera House
Ngày 2: Cầu cảng – vườn thú
Ngày 3: Bay đến Melbourne – quảng trường Federation
Ngày 4: Thung lũng Yarra – nếm rượu vang
Ngày 5: Sở thú – vườn thực vật
Ngày 6: Tự do – mua sắm
Ngày 7: Tham quan mua sắm và bay về', 
4),


--33
(N'Tour Pháp 7N6Đ – Paris – Versailles', 15, 
N'Tham quan tháp Eiffel, bảo tàng Louvre, cung điện Versailles và dòng sông Seine.', 
52000000, 42000000, N'Máy bay + xe', 
N'Pháp', N'7 ngày 6 đêm', 
N'Ngày 1: Bay đến Paris – nghỉ ngơi
Ngày 2: Tháp Eiffel – đại lộ Champs-Élysées
Ngày 3: Bảo tàng Louvre – nhà thờ Đức Bà
Ngày 4: Cung điện Versailles – vườn hoa
Ngày 5: Du thuyền sông Seine – mua sắm
Ngày 6: Đảo Mont Saint-Michel
Ngày 7: Tham quan đấu trường La Mã và bay về', 
4),


-- 34
(N'Tour Đức – Hà Lan 7N6Đ – Frankfurt – Amsterdam', 20, 
N'Tham quan lâu đài cổ kính tại Đức, du ngoạn trên kênh đào Amsterdam.', 
48000000, 40000000, N'Máy bay + xe', 
N'Đức – Hà Lan', N'7 ngày 6 đêm', 
N'Ngày 1: Frankfurt – nhà thờ lớn
Ngày 2: Heidelberg – lâu đài
Ngày 3: Cologne – nhà thờ Đức Bà
Ngày 4: Amsterdam – chợ hoa
Ngày 5: Kênh đào – bảo tàng Van Gogh
Ngày 6: Làng cối xay gió Kinderdijk
Ngày 7: Tự do mua sắm và bay về', 
4),



--35
(N'Tour Thổ Nhĩ Kỳ 6N5Đ – Istanbul – Cappadocia', 22, 
N'Tham quan Blue Mosque, Hagia Sophia, khinh khí cầu Cappadocia.', 
36000000, 29500000, N'Máy bay + xe', 
N'Thổ Nhĩ Kỳ', N'6 ngày 5 đêm', 
N'Ngày 1: Istanbul – Blue Mosque
Ngày 2: Hagia Sophia – chợ Grand Bazaar
Ngày 3: Bay đến Cappadocia – làng đá
Ngày 4: Bay khinh khí cầu – thành phố ngầm
Ngày 5: Bay về Istanbul – nghỉ ngơi
Ngày 6: Bay về nước', 
4),


--36
(N'Tour Ai Cập 7N6Đ – Cairo – Luxor', 18, 
N'Tham quan kim tự tháp Giza, tượng nhân sư, du ngoạn sông Nile và thung lũng các vị vua.', 
45000000, 37000000, N'Máy bay + xe', 
N'Ai Cập', N'7 ngày 6 đêm', 
N'Ngày 1: Bay đến Cairo – nghỉ đêm
Ngày 2: Kim tự tháp – tượng nhân sư
Ngày 3: Bảo tàng Ai Cập – chợ Khan El Khalili
Ngày 4: Bay đến Luxor – đền Karnak
Ngày 5: Thung lũng các vị vua
Ngày 6: Bay về Cairo – nghỉ ngơi
Ngày 7: Bay về', 
4);
GO

-- Images 
INSERT INTO Images (TourId, Url, Description, DayNumber)
VALUES
-- TourId = 1
(1, N'img/tours/1/1.jpg', N'Ảnh đại diện - Hà Nội - Hải Phòng', 0),
(1, N'img/tours/1/2.jpg', N'Hà Nội – Văn Miếu, Hồ Hoàn Kiếm', 1),
(1, N'img/tours/1/3.jpg', N'Hạ Long – Du thuyền', 2),
(1, N'img/tours/1/4.jpg', N'Hải Phòng – Đồ Sơn, chợ Đổ', 3),
(1, N'img/tours/1/5.jpg', N'Hải Phòng – Đồ Sơn, chợ Đổ', 4),

-- TourId = 2
(2, N'img/tours/2/1.jpg', N'Ảnh đại diện - Đà Nẵng - Hội An', 0),
(2, N'img/tours/2/2.jpg', N'Mỹ Khê', 1),

-- TourId = 3
(3, N'img/tours/3/1.jpg', N'Tour Nha Trang',0),
(3, N'img/tours/3/2.jpg', N'Tour Nha Trang',1),
(3, N'img/tours/3/3.jpg', N'Tour Nha Trang',2),

-- TourId = 4 
(4, N'img/tours/4/1.jpg', N'Ảnh đại diện - Tour Đà Lạt', 0),
(4, N'img/tours/4/2.jpg', N'Tour Đà Lạt - Điểm 1', 1),
(4, N'img/tours/4/3.jpg', N'Tour Đà Lạt - Điểm 2', 2),


-- TourId = 5 
(5, N'img/tours/5/1.jpg', N'Ảnh đại diện - Tour Sapa', 0),
(5, N'img/tours/5/2.jpg', N'Tour Sapa - Điểm 1', 1),
(5, N'img/tours/5/3.jpg', N'Tour Sapa - Điểm 2', 2),
(5, N'img/tours/5/4.jpg', N'Tour Sapa - Điểm 3', 3),

-- TourId = 6 
(6, N'img/tours/6/1.jpg', N'Ảnh đại diện - Tour Huế', 0),
(6, N'img/tours/6/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),


-- TourId = 7 
(7, N'img/tours/7/1.jpg', N'Ảnh đại diện - Tour Phú Quốc', 0),
(7, N'img/tours/7/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(7, N'img/tours/7/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),


-- TourId = 8 
(8, N'img/tours/8/1.jpeg', N'Ảnh đại diện - Tour miền Tây', 0),
(8, N'img/tours/8/2.jpg', N'Tour miền Tây - Điểm 1', 1),
(8, N'img/tours/8/3.png', N'Tour miền Tây - Điểm 2', 2),

-- TourId = 9 
(9, N'img/tours/9/1.jpg', N'Ảnh đại diện - Tour Hạ Long', 0),
(9, N'img/tours/9/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(9, N'img/tours/9/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(9, N'img/tours/9/4.jpg', N'Tour Tây Bắc - Cần Thơ', 3),

-- TourId = 10 
(10, N'img/tours/10/1.jpg', N'Ảnh đại diện - Tour Tây Bắc', 0),
(10, N'img/tours/10/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(10, N'img/tours/10/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(10, N'img/tours/10/4.jpg', N'Tour Tây Bắc - Cần Thơ', 3),

-- TourId = 11 
(11, N'img/tours/11/1.jpg', N'Ảnh đại diện - Tour Tây Bắc', 0),
(11, N'img/tours/11/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(11, N'img/tours/11/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(11, N'img/tours/11/4.jpg', N'Tour Tây Bắc - Cần Thơ', 3),
(11, N'img/tours/11/5.jpg', N'Tour Tây Bắc - Nha Trang', 4),

-- TourId = 12 
(12, N'img/tours/12/1.jpg', N'Ảnh đại diện - Hà Nội - Hải Phòng', 0),
(12, N'img/tours/12/2.jpg', N'Tour Hà Nội - Hải Phòng - Điểm 1', 1),
(12, N'img/tours/12/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(12, N'img/tours/12/4.jpg', N'Tour Tây Bắc - Cần Thơ', 3),

-- TourId = 13 
(13, N'img/tours/13/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(13, N'img/tours/13/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(13, N'img/tours/13/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),

-- TourId = 14 
(14, N'img/tours/14/1.jpg', N'Ảnh đại diện - Hà Nội - Hải Phòng', 0),
(14, N'img/tours/14/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(14, N'img/tours/14/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(14, N'img/tours/14/4.jpg', N'Tour Tây Bắc - Cần Thơ', 3),

-- TourId = 15 
(15, N'img/tours/15/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(15, N'img/tours/15/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(15, N'img/tours/15/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),


-- TourId = 16
(16, N'img/tours/16/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(16, N'img/tours/16/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(16, N'img/tours/16/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),


-- TourId = 17 
(17, N'img/tours/17/1.jpeg', N'Ảnh đại diện - Tour miền Tây', 0),
(17, N'img/tours/17/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),


-- TourId = 18 
(18, N'img/tours/18/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(18, N'img/tours/18/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(18, N'img/tours/18/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(18, N'img/tours/18/4.jpg', N'Tour Tây Bắc - Đà Lạt', 3),


-- TourId = 19 
(19, N'img/tours/19/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(19, N'img/tours/19/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),


-- TourId = 20 
(20, N'img/tours/20/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(20, N'img/tours/20/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(20, N'img/tours/20/3.jpg', N'Tour Tây Bắc - Phú Quốc', 2),

-- TourId = 21
(21, N'img/tours/21/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(21, N'img/tours/21/2.png', N'Tour Tây Bắc - Phú Quốc', 1),

-- TourId = 22 
(22, N'img/tours/22/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(22, N'img/tours/22/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(22, N'img/tours/22/3.png', N'Tour Tây Bắc - Đà Lạt', 2),
(22, N'img/tours/22/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(22, N'img/tours/22/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),


-- TourId = 23
(23, N'img/tours/23/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(23, N'img/tours/23/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(23, N'img/tours/23/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(23, N'img/tours/23/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),


-- TourId = 24
(24, N'img/tours/24/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(24, N'img/tours/24/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(24, N'img/tours/24/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(24, N'img/tours/24/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),


-- TourId = 25
(25, N'img/tours/25/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(25, N'img/tours/25/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(25, N'img/tours/25/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),




-- TourId = 26
(26, N'img/tours/26/1.png', N'Ảnh đại diện - Tour miền Tây', 0),
(26, N'img/tours/26/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(26, N'img/tours/26/3.jpeg', N'Tour Tây Bắc - Đà Lạt', 2),


-- TourId = 27
(27, N'img/tours/27/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(27, N'img/tours/27/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(27, N'img/tours/27/3.png', N'Tour Tây Bắc - Đà Lạt', 2),
(27, N'img/tours/27/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(27, N'img/tours/27/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),



-- TourId = 28
(28, N'img/tours/28/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(28, N'img/tours/28/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(28, N'img/tours/28/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(28, N'img/tours/28/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(28, N'img/tours/28/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),
(28, N'img/tours/28/6.jpg', N'Ảnh đại diện - Tour miền Tây', 5),
(28, N'img/tours/28/7.jpg', N'Ảnh đại diện - Tour miền Tây', 6),


-- TourId = 29
(29, N'img/tours/29/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(29, N'img/tours/29/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(29, N'img/tours/29/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(29, N'img/tours/29/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(29, N'img/tours/29/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),
(29, N'img/tours/29/6.jpg', N'Ảnh đại diện - Tour miền Tây', 5),



-- TourId = 30
(30, N'img/tours/30/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(30, N'img/tours/30/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(30, N'img/tours/30/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(30, N'img/tours/30/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(30, N'img/tours/30/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),



-- TourId = 31
(31, N'img/tours/31/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(31, N'img/tours/31/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(31, N'img/tours/31/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(31, N'img/tours/31/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(31, N'img/tours/31/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),



-- TourId = 32
(32, N'img/tours/32/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(32, N'img/tours/32/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(32, N'img/tours/32/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(32, N'img/tours/32/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(32, N'img/tours/32/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),
(32, N'img/tours/32/6.png', N'Ảnh đại diện - Tour miền Tây', 5),
(32, N'img/tours/32/7.png', N'Ảnh đại diện - Tour miền Tây', 6),
(32, N'img/tours/32/8.jpg', N'Ảnh đại diện - Tour miền Tây', 7),



-- TourId = 33
(33, N'img/tours/33/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(33, N'img/tours/33/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(33, N'img/tours/33/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(33, N'img/tours/33/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(33, N'img/tours/33/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),
(33, N'img/tours/33/6.png', N'Ảnh đại diện - Tour miền Tây', 5),
(33, N'img/tours/33/7.jpg', N'Ảnh đại diện - Tour miền Tây', 6),
(33, N'img/tours/33/8.jpg', N'Ảnh đại diện - Tour miền Tây', 7),


-- TourId = 34
(34, N'img/tours/34/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(34, N'img/tours/34/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(34, N'img/tours/34/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(34, N'img/tours/34/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(34, N'img/tours/34/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),
(34, N'img/tours/34/6.jpg', N'Ảnh đại diện - Tour miền Tây', 5),
(34, N'img/tours/34/7.jpg', N'Ảnh đại diện - Tour miền Tây', 6),
(34, N'img/tours/34/8.jpg', N'Ảnh đại diện - Tour miền Tây', 7),

-- TourId = 35
(35, N'img/tours/35/1.png', N'Ảnh đại diện - Tour miền Tây', 0),
(35, N'img/tours/35/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(35, N'img/tours/35/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(35, N'img/tours/35/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(35, N'img/tours/35/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),
(35, N'img/tours/35/6.jpg', N'Ảnh đại diện - Tour miền Tây', 5),
(35, N'img/tours/35/7.jpg', N'Ảnh đại diện - Tour miền Tây', 6),

-- TourId = 36
(36, N'img/tours/36/1.jpg', N'Ảnh đại diện - Tour miền Tây', 0),
(36, N'img/tours/36/2.jpg', N'Tour Tây Bắc - Phú Quốc', 1),
(36, N'img/tours/36/3.jpg', N'Tour Tây Bắc - Đà Lạt', 2),
(36, N'img/tours/36/4.jpg', N'Ảnh đại diện - Tour miền Tây', 3),
(36, N'img/tours/36/5.jpg', N'Ảnh đại diện - Tour miền Tây', 4),
(36, N'img/tours/36/6.jpg', N'Ảnh đại diện - Tour miền Tây', 5),
(36, N'img/tours/36/7.jpg', N'Ảnh đại diện - Tour miền Tây', 6),
(36, N'img/tours/36/8.jpg', N'Ảnh đại diện - Tour miền Tây', 7);

GO

INSERT INTO Users (Email, FullName, Phone, Address, Role, Password)
VALUES
('admin@tourbooking.com', N'Bùi Văn Như', '0965478866', N'Quận 10, TP.HCM', 'admin', ''),
('hoangminh_01@gmail.com', N'Hoàng Minh', '0965123456', N'Quận 1, TP.HCM', 'Guest', ''),
('lanpham87@yahoo.com', N'Phạm Thị Lan', '0909332112', N'Long Biên, Hà Nội', 'Guest', ''),
('trungdao.it@gmail.com', N'Đào Trung', '0987654321', N'Hải Châu, Đà Nẵng', 'Guest', ''),
('ngocanh2024@gmail.com', N'Lê Ngọc Ánh', '0911223344', N'Cần Thơ', 'Guest', ''),
('kienvo_tour@outlook.com', N'Võ Văn Kiên', '0933445566', N'Nha Trang, Khánh Hòa', 'Guest', ''),
('thuha_95@zmail.com', N'Nguyễn Thu Hà', '0977008800', N'Thanh Xuân, Hà Nội', 'Guest', ''),
('buiquang_88@gmail.com', N'Bùi Quang Huy', '0944332211', N'Bình Thạnh, TP.HCM', 'Guest', ''),
('myduyen_1996@hotmail.com', N'Huỳnh Mỹ Duyên', '0988123123', N'Tân Bình, TP.HCM', 'Guest', ''),
('letrongphuc@gmail.com', N'Lê Trọng Phúc', '0922003300', N'Đống Đa, Hà Nội', 'Guest', ''),
('ngoctrinh.dl@gmail.com', N'Trịnh Ngọc', '0937888999', N'Hội An, Quảng Nam', 'Guest', ''),
('ngoclinh.dl@gmail.com', N'Ngọc Linh', '0937888977', N'Trà Vinh', 'Guest', ''),
('minhhuong.dl@gmail.com', N'Minh Hường', '0937894529', N'Đồng Tháp', 'Guest', ''),
('tuongvan.dl@gmail.com', N'Tường Vân', '0937881239', N'An Giang', 'Guest', ''),
('ngoclan.dl@gmail.com', N'Ngọc Lan', '09378889456', N'Cà Mau', 'Guest', ''),
('minhthu.dl@gmail.com', N'Minh Thu', '0937888124', N'Bến Tre', 'Guest', '');
GO



-- Lịch khởi hành cho các TourId từ 1 đến 15
INSERT INTO TourSchedules (TourId, DepartureDate, ReturnDate, RemainingSlot, IsDeleted) VALUES
(1, '2025-12-24', '2025-12-28', 25, 0),
(1, '2026-01-12', '2026-01-17', 24, 0),
(1, '2025-11-23', '2025-11-27', 23, 0),
(1, '2025-10-30', '2025-11-02', 25, 0),
(1, '2025-10-30', '2025-11-02', 23, 0),
(2, '2025-11-11', '2025-11-16', 24, 0),
(2, '2025-12-29', '2026-01-02', 21, 0),
(2, '2025-11-08', '2025-11-12', 23, 0),
(2, '2025-11-30', '2025-12-03', 24, 0),
(2, '2025-10-16', '2025-10-19', 24, 0),
(3, '2025-10-20', '2025-10-22', 28, 0),
(3, '2025-11-21', '2025-11-24', 30, 0),
(3, '2025-12-16', '2025-12-18', 20, 0),
(3, '2025-12-27', '2025-12-31', 27, 0),
(3, '2025-12-15', '2025-12-20', 25, 0),
(4, '2025-11-07', '2025-11-09', 24, 0),
(4, '2025-12-15', '2025-12-17', 21, 0),
(4, '2025-12-05', '2025-12-10', 21, 0),
(4, '2025-12-27', '2025-12-29', 22, 0),
(4, '2025-11-03', '2025-11-07', 21, 0),
(5, '2025-11-15', '2025-11-17', 28, 0),
(5, '2025-12-07', '2025-12-10', 28, 0),
(5, '2025-12-02', '2025-12-06', 26, 0),
(5, '2025-12-23', '2025-12-27', 27, 0),
(5, '2025-10-27', '2025-10-30', 29, 0),
(6, '2025-11-22', '2025-11-25', 23, 0),
(6, '2025-10-07', '2025-10-10', 24, 0),
(6, '2025-10-13', '2025-10-16', 29, 0),
(6, '2025-10-10', '2025-10-12', 22, 0),
(6, '2025-11-30', '2025-12-05', 27, 0),
(7, '2025-11-18', '2025-11-24', 29, 0),
(7, '2025-10-29', '2025-11-04', 30, 0),
(7, '2025-11-10', '2025-11-16', 25, 0),
(7, '2025-11-25', '2025-11-29', 22, 0),
(7, '2025-10-29', '2025-10-31', 27, 0),
(8, '2025-10-29', '2025-11-02', 24, 0),
(8, '2025-11-07', '2025-11-09', 25, 0),
(8, '2025-11-02', '2025-11-04', 24, 0),
(8, '2025-10-30', '2025-11-04', 20, 0),
(8, '2025-10-04', '2025-10-08', 24, 0),
(9, '2025-10-05', '2025-10-07', 29, 0),
(9, '2025-11-08', '2025-11-14', 26, 0),
(9, '2025-10-30', '2025-11-05', 28, 0),
(9, '2025-11-20', '2025-11-22', 27, 0),
(9, '2025-11-28', '2025-12-04', 30, 0),
(10, '2025-10-13', '2025-10-17', 29, 0),
(10, '2025-10-31', '2025-11-06', 22, 0),
(10, '2025-10-04', '2025-10-09', 21, 0),
(10, '2025-11-21', '2025-11-25', 21, 0),
(10, '2025-11-02', '2025-11-05', 20, 0),
(11, '2025-10-16', '2025-10-21', 27, 0),
(11, '2025-11-03', '2025-11-09', 29, 0),
(11, '2025-10-11', '2025-10-15', 25, 0),
(11, '2025-11-28', '2025-12-02', 26, 0),
(11, '2025-10-27', '2025-10-31', 30, 0),
(12, '2025-11-08', '2025-11-10', 30, 0),
(12, '2025-11-11', '2025-11-15', 21, 0),
(12, '2025-10-22', '2025-10-24', 28, 0),
(12, '2025-11-13', '2025-11-18', 24, 0),
(12, '2025-10-17', '2025-10-23', 22, 0),
(13, '2025-10-22', '2025-10-24', 29, 0),
(13, '2025-11-12', '2025-11-15', 25, 0),
(13, '2025-10-20', '2025-10-25', 22, 0),
(13, '2025-11-08', '2025-11-10', 24, 0),
(13, '2025-11-05', '2025-11-10', 30, 0),
(14, '2025-11-20', '2025-11-24', 22, 0),
(14, '2025-11-12', '2025-11-18', 21, 0),
(14, '2025-11-11', '2025-11-16', 28, 0),
(14, '2025-10-24', '2025-10-26', 25, 0),
(14, '2025-10-20', '2025-10-23', 23, 0),
(15, '2025-10-22', '2025-10-27', 23, 0),
(15, '2025-10-15', '2025-10-18', 22, 0),
(15, '2025-10-05', '2025-10-09', 21, 0),
(15, '2025-11-02', '2025-11-08', 28, 0),
(15, '2025-10-03', '2025-10-07', 29, 0),
(16, '2025-12-04', '2025-12-04', 30, 0),
(16, '2025-12-06', '2025-12-06', 30, 0),
(16, '2025-11-12', '2025-11-12', 20, 0),
(16, '2025-12-15', '2025-12-15', 21, 0),
(16, '2025-11-09', '2025-11-09', 30, 0),
(17, '2025-11-08', '2025-11-08', 25, 0),
(17, '2025-12-27', '2025-12-27', 26, 0),
(17, '2025-12-19', '2025-12-19', 26, 0),
(17, '2025-11-30', '2025-11-30', 23, 0),
(17, '2025-11-26', '2025-11-26', 28, 0),
(18, '2026-01-15', '2026-01-17', 23, 0),
(18, '2025-11-29', '2025-12-01', 28, 0),
(18, '2025-12-12', '2025-12-14', 24, 0),
(18, '2026-01-07', '2026-01-09', 25, 0),
(18, '2025-12-09', '2025-12-11', 23, 0),
(19, '2025-11-23', '2025-11-23', 27, 0),
(19, '2026-01-04', '2026-01-04', 20, 0),
(19, '2025-11-25', '2025-11-25', 30, 0),
(19, '2025-12-28', '2025-12-28', 25, 0),
(19, '2025-12-13', '2025-12-13', 28, 0),
(20, '2025-11-15', '2025-11-16', 28, 0),
(20, '2025-12-03', '2025-12-04', 24, 0),
(20, '2025-11-25', '2025-11-26', 24, 0),
(20, '2025-12-07', '2025-12-08', 27, 0),
(20, '2025-11-08', '2025-11-09', 25, 0),
(21, '2025-12-05', '2025-12-05', 27, 0),
(21, '2025-11-21', '2025-11-21', 27, 0),
(21, '2025-11-06', '2025-11-06', 29, 0),
(21, '2025-11-19', '2025-11-19', 28, 0),
(21, '2025-12-10', '2025-12-10', 29, 0),
(22, '2025-12-19', '2025-12-22', 21, 0),
(22, '2025-12-04', '2025-12-07', 23, 0),
(22, '2025-12-22', '2025-12-25', 27, 0),
(22, '2026-01-03', '2026-01-06', 27, 0),
(22, '2026-01-08', '2026-01-11', 26, 0),
(23, '2026-01-03', '2026-01-05', 28, 0),
(23, '2025-12-28', '2025-12-30', 20, 0),
(23, '2025-12-31', '2026-01-02', 20, 0),
(23, '2025-11-22', '2025-11-24', 21, 0),
(23, '2025-11-23', '2025-11-25', 30, 0),
(24, '2025-11-17', '2025-11-19', 21, 0),
(24, '2025-10-30', '2025-11-01', 21, 0),
(24, '2025-12-01', '2025-12-03', 26, 0),
(24, '2025-11-06', '2025-11-08', 26, 0),
(24, '2025-11-29', '2025-12-01', 22, 0),
(25, '2025-12-23', '2025-12-24', 26, 0),
(25, '2025-12-30', '2025-12-31', 25, 0),
(25, '2025-12-13', '2025-12-14', 24, 0),
(25, '2025-12-28', '2025-12-29', 21, 0),
(25, '2026-01-27', '2026-01-28', 20, 0),
(26, '2025-12-14', '2025-12-15', 28, 0),
(26, '2025-10-20', '2025-10-21', 23, 0),
(26, '2025-10-21', '2025-10-22', 28, 0),
(26, '2025-10-24', '2025-10-25', 29, 0),
(26, '2025-11-11', '2025-11-12', 30, 0),
(27, '2025-11-15', '2025-11-16', 25, 0),
(27, '2025-11-12', '2025-11-13', 25, 0),
(27, '2025-10-15', '2025-10-16', 22, 0),
(27, '2025-11-14', '2025-11-15', 27, 0),
(27, '2025-10-12', '2025-10-13', 21, 0),
(28, '2025-12-27', '2026-01-01', 27, 0),
(28, '2025-12-10', '2025-12-15', 24, 0),
(28, '2025-12-24', '2025-12-29', 26, 0),
(28, '2026-01-05', '2026-01-10', 25, 0),
(28, '2025-11-25', '2025-11-30', 28, 0),
(29, '2025-12-15', '2025-12-19', 26, 0),
(29, '2026-01-11', '2026-01-15', 23, 0),
(29, '2026-01-14', '2026-01-18', 28, 0),
(29, '2025-12-10', '2025-12-14', 25, 0),
(29, '2026-01-18', '2026-01-22', 25, 0),
(30, '2025-10-12', '2025-10-15', 28, 0),
(30, '2025-11-18', '2025-11-21', 25, 0),
(30, '2025-10-25', '2025-10-28', 30, 0),
(30, '2025-12-08', '2025-12-11', 20, 0),
(30, '2025-11-21', '2025-11-24', 28, 0),
(31, '2025-11-09', '2025-11-12', 25, 0),
(31, '2025-11-27', '2025-11-30', 20, 0),
(31, '2025-11-23', '2025-11-26', 23, 0),
(31, '2025-11-09', '2025-11-12', 28, 0),
(31, '2025-11-17', '2025-11-20', 22, 0),
(32, '2026-01-08', '2026-01-14', 30, 0),
(32, '2025-12-24', '2025-12-30', 30, 0),
(32, '2025-11-29', '2025-12-05', 21, 0),
(32, '2025-12-07', '2025-12-13', 21, 0),
(32, '2025-11-29', '2025-12-05', 21, 0),
(33, '2025-10-05', '2025-10-11', 28, 0),
(33, '2025-10-28', '2025-11-03', 30, 0),
(33, '2025-10-10', '2025-10-16', 20, 0),
(33, '2025-11-05', '2025-11-11', 22, 0),
(33, '2025-11-08', '2025-11-14', 28, 0),
(34, '2025-12-09', '2025-12-15', 25, 0),
(34, '2025-11-17', '2025-11-23', 26, 0),
(34, '2025-11-26', '2025-12-02', 20, 0),
(34, '2025-12-05', '2025-12-11', 26, 0),
(34, '2025-12-08', '2025-12-14', 30, 0),
(35, '2025-11-27', '2025-12-02', 25, 0),
(35, '2025-11-06', '2025-11-11', 24, 0),
(35, '2025-11-28', '2025-12-03', 20, 0),
(35, '2025-12-08', '2025-12-13', 23, 0),
(35, '2025-11-25', '2025-11-30', 21, 0),
(36, '2025-11-22', '2025-11-28', 27, 0),
(36, '2025-11-02', '2025-11-08', 21, 0),
(36, '2025-11-06', '2025-11-12', 23, 0),
(36, '2025-10-11', '2025-10-17', 28, 0),
(36, '2025-10-25', '2025-10-31', 22, 0);
GO



-- INSERT INTO Bookings
INSERT INTO Bookings (BookingDate, AdultQuantity, ChildQuantity, TotalPrice, SpecialRequest, TourId, UserId, DepartureDate, TourScheduleId, PaymentMethod) VALUES
('2025-09-12', 2, 2, 4200000, N'Không hút thuốc', 1, 2, '2025-10-30', 4, N'Quầy'),
('2025-09-24', 2, 2, 4200000, N'Có trẻ nhỏ', 2, 3, '2025-12-29', 7, N'Quầy'),
('2025-09-15', 2, 1, 3300000, N'Có trẻ nhỏ', 3, 4, '2025-12-27', 14, N'VNPAY'),
('2025-10-14', 2, 1, 3300000, N'Yêu cầu ăn chay', 4, 5, '2025-12-05', 18, N'Quầy'),
('2025-10-04', 4, 1, 5700000, N'Cần xe riêng', 5, 6, '2025-12-23', 24, N'Ví MoMo'),
('2025-10-26', 4, 0, 4800000, N'Không hút thuốc', 6, 7, '2025-10-07', 27, N'VNPAY'),
('2025-10-30', 3, 0, 3600000, N'Cần xe riêng', 7, 8, '2025-11-18', 29, N'Ví MoMo'),
('2025-09-06', 1, 2, 3000000, N'Yêu cầu ăn chay', 8, 9, '2025-11-02', 38, N'Quầy'),
('2025-10-24', 2, 1, 3300000, N'Không hút thuốc', 9, 10, '2025-10-30', 43, N'VNPAY'),
('2025-10-30', 4, 0, 4800000, N'Yêu cầu ăn chay', 10, 11, '2025-11-21', 49, N'Ví MoMo'),
('2025-09-24', 1, 1, 2100000, N'Cần xe riêng', 11, 11, '2025-10-11', 53, N'Ví MoMo'),
('2025-09-02', 2, 1, 3300000, N'Không hút thuốc', 12, 9, '2025-10-22', 58, N'Ví MoMo'),
('2025-09-03', 3, 0, 3600000, N'Không hút thuốc', 13, 8, '2025-10-20', 63, N'Quầy'),
('2025-09-29', 3, 1, 4500000, N'Có trẻ nhỏ', 14, 7, '2025-11-11', 68, N'VNPAY'),
('2025-10-24', 1, 0, 1200000, N'Không hút thuốc', 15, 6, '2025-10-05', 73, N'Ví MoMo'),
('2025-10-20', 2, 2, 4200000, N'', 15, 5, '2025-11-02', 74, N'Ví MoMo'),
('2025-09-16', 3, 0, 3600000, N'', 14, 4, '2025-11-12', 67, N'Quầy'),
('2025-10-24', 4, 2, 6600000, N'', 13, 3, '2025-10-22', 61, N'Quầy'),
('2025-10-07', 4, 2, 6600000, N'Cần xe riêng', 12, 2, '2025-11-13', 59, N'Quầy'),
('2025-09-01', 2, 2, 4200000, N'Có trẻ nhỏ', 11, 2, '2025-10-11', 53, N'Ví MoMo'),
('2025-09-06', 1, 2, 3000000, N'Yêu cầu ăn chay', 23, 16, '2025-12-28', 112, N'Quầy'),
('2025-10-24', 2, 1, 3300000, N'Không hút thuốc', 24, 12, '2025-10-30', 117, N'VNPAY'),
('2025-10-30', 4, 0, 4800000, N'Yêu cầu ăn chay', 29, 13, '2026-01-18', 145, N'Ví MoMo'),
('2025-09-24', 1, 1, 2100000, N'Cần xe riêng', 30, 14, '2025-11-21', 150, N'Ví MoMo'),
('2025-09-02', 2, 1, 3300000, N'Không hút thuốc', 31, 15, '2025-11-17', 155, N'Ví MoMo');
GO

