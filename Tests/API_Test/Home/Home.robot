
*** Settings ***
Resource    Home.resource
Test Setup  create_new_session

*** Test Cases ***
TC01_Check_get_course
    [Tags]      Check get course
    [Template]      check_get_course
    course[0]       {'id': 26, 'id_monhoc': 8, 'id_giaovien': 22, 'tieude': 'Luyện Thi Vật Lý 10', 'slug_post': 'luyen-thi-vat-ly-10', 'tomtat': 'Luyện Thi Vật Lý 10', 'noidung': 'Luyện Thi Vật Lý 10', 'Soluonghocvien': 15, 'hinhanh': 'vatly1045.png', 'lichkhaigiang': '2022-10-28', 'views': None, 'kichhoat': 0, 'created_at': '2022-10-27 19:59:05', 'updated_at': '2022-10-27 20:43:10'}
    course[1]       {'id': 25, 'id_monhoc': 22, 'id_giaovien': 22, 'tieude': 'Luyện thi Hóa 12', 'slug_post': 'luyen-thi-hoa-12', 'tomtat': 'Luyện thi Hóa 12', 'noidung': 'Luyện thi Hóa 12', 'Soluonghocvien': 15, 'hinhanh': 'hoa1265.png', 'lichkhaigiang': '2022-10-30', 'views': None, 'kichhoat': 0, 'created_at': '2022-10-27 19:52:08', 'updated_at': '2022-10-27 20:43:28'}

TC02_Check_get_teacher
    [Tags]      Check get teacher
    [Template]      check_get_teacher
    teacher[0]      {'id': 36, 'slug_giaovien': 'nguyen-van-a', 'tengiaovien': 'Nguyễn Văn A', 'tomtat': 'Giáo viên dạy toán', 'thongtin': 'Giáo viên 10 năm kinh nghiệm luyện thi đại học.', 'hinhanh': 'gv_vatly_toan41.png', 'kichhoat': '0', 'created_at': '2022-10-28 15:19:45', 'updated_at': '2022-10-28 15:19:45'}
    teacher[1]      {'id': 34, 'slug_giaovien': 'nguyen-thi-p', 'tengiaovien': 'Nguyễn Thị P', 'tomtat': 'Giáo viên 10 năm kinh nghiệm', 'thongtin': 'Giáo viên 10 năm kinh nghiệm', 'hinhanh': 'gv212.jpg', 'kichhoat': '0', 'created_at': '2022-10-27 19:56:52', 'updated_at': '2022-10-27 20:42:27'}


TC02_Check_get_news
    [Tags]      Check get news
    [Template]      check_get_news
    news[0]         Tin tức mới nhất về kỳ thi THPT quốc gia















