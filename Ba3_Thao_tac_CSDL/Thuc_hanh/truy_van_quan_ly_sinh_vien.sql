use quanlysinhvien;
-- hiển thị danh sách tất cả các học viên.
SELECT * FROM Student;

-- hiển thị danh sách học viên đang theo học.
SELECT * FROM Student
WHERE Status = true;

-- lấy ra danh sách các môn học có thời gian học nhỏ hơn 10.
SELECT * FROM Subject
WHERE Credit < 10;

-- hiển thị danh sách học viên lớp A1.
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on C.ClassId = S.ClassID;

-- hiển thị danh sách học viên lớp A1.
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

-- Hiển thị điểm của các học viên.
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

-- hiển thị điểm môn CF của các học viên
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';


