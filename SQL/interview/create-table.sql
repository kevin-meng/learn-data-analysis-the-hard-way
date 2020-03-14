-- ##################################
-- 创建四张表
-- 1.学生表 : Student
-- 2.课程表 : Course
-- 3.教师表 : Teacher
-- 4.成绩表 : SC
-- ##################################


-- 1.学生表
create table Student(
    SID varchar(10),
    Sname nvarchar(10),
    Sage datetime,
    Ssex nvarchar(10)
);

insert into
    Student
values
('01', '赵雷', '1990-01-01', '男');

insert into
    Student
values
('02', '钱电', '1990-12-21', '男');

insert into
    Student
values
('03', '孙风', '1990-05-20', '男');

insert into
    Student
values
('04', '李云', '1990-08-06', '男');

insert into
    Student
values
('05', '周梅', '1991-12-01', '女');

insert into
    Student
values
('06', '吴兰', '1992-03-01', '女');

insert into
    Student
values
('07', '郑竹', '1989-07-01', '女');

insert into
    Student
values
('08', '王菊', '1990-01-20', '女');

-- 2.课程表
create table Course(
    CID varchar(10),
    Cname nvarchar(10),
    TID varchar(10)
);

insert into
    Course
values
('01', '语文', '02');

insert into
    Course
values
('02', '数学', '01');

insert into
    Course
values
('03', '英语', '03');

-- 3.教师表
create table Teacher(TID varchar(10), Tname nvarchar(10));

insert into
    Teacher
values
('01', '张三');

insert into
    Teacher
values
('02', '李四');

insert into
    Teacher
values
('03', '王五');

-- 4.成绩表
create table SC(
    SID varchar(10),
    CID varchar(10),
    score decimal(18, 1)
);

insert into
    SC
values
('01', '01', 80);

insert into
    SC
values
('01', '02', 90);

insert into
    SC
values
('01', '03', 99);

insert into
    SC
values
('02', '01', 70);

insert into
    SC
values
('02', '02', 60);

insert into
    SC
values
('02', '03', 80);

insert into
    SC
values
('03', '01', 80);

insert into
    SC
values
('03', '02', 80);

insert into
    SC
values
('03', '03', 80);

insert into
    SC
values
('04', '01', 50);

insert into
    SC
values
('04', '02', 30);

insert into
    SC
values
('04', '03', 20);

insert into
    SC
values
('05', '01', 76);

insert into
    SC
values
('05', '02', 87);

insert into
    SC
values
('06', '01', 31);

insert into
    SC
values
('06', '03', 34);

insert into
    SC
values
('07', '02', 89);

insert into
    SC
values
('07', '03', 98);