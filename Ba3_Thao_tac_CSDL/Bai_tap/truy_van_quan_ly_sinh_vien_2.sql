use quanlysinhvien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select StudentID,StudentName
from student
where student.StudentName like 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select ClassID,ClassName,StartDate
from class
where class.StartDate like '_____12%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select SubID,SubName,Credit
from subject
where subject.Credit>=3 and subject.Credit<=5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET sql_safe_updates=0;
update student
set ClassID = 2
where StudentName = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. 
-- nếu trùng sắp theo tên tăng dần.
select S.StudentID,S.StudentName,Sub.SubName,M.Mark
from student S join mark M on S.StudentID = M.StudentID join subject Sub on M.SubID = Sub.SubID
order by Mark desc;