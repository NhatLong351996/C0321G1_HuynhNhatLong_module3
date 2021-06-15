-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

use quanlysinhvien;

select SubID,SubName,Credit
from subject 
having Credit>= all (select max(Credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select S.SubID,S.SubName,max(Mark)
from subject S join mark M on S.SubID = M.SubID
group by S.SubName
having max(Mark)>=all(select max(Mark) from mark group by mark.SubID);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
--  xếp hạng theo thứ tự điểm giảm dần
select *,avg(Mark) as avg
from student S join mark M on S.StudentID = M.StudentID
group by S.StudentID
order by avg desc;
