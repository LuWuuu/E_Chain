
create table Systbl(
    adminNotice SMALLINT,/*0-no 1-yes������Աһ����ϵͳ�Ͷ���������м�飬�����1��˵�����������Ա�ύ������������ѹ���Ա�����S2A & T2A�е�����*/
    stuNum SMALLINT,/*ѧ��������*/
)

create table Dept(
    Dname varchar(30) PRIMARY KEY,
    Dintro varchar(200),/*introduction*/
)

create table Student(
    Sno char(9) PRIMARY KEY,/*ѧ�ţ�ÿλ���������ַ�*/
    Sname varchar(10),
    Ssex char(2),/*Լ������orŮ*/
    Sdept varchar(30),/**/
    Sgrade smallint,/*��ѧ�꼶*/
    FOREIGN KEY(Sdept) REFERENCES Dept(Dname),
)

create table Teacher(
    Tno char(9) PRIMARY KEY,/*���ţ�ÿλ���������ַ�*/
    Tname varchar(10),
    Tprof varchar(10),/*��ʦְ��*/
    Tdept varchar(30),
    Tnotice SMALLINT,/*0-no 1-yes����ʦһ����ϵͳ�Ͷ���������м�飬�����1��˵���������ʦ�ύ���������*/
    FOREIGN KEY(Tdept) REFERENCES Dept(Dname),
)

/*
*ATTENTION����������
*һѧ���У�һ�ſ�ֻ��һ����ʦ���ڣ�ֻ��һ�Σ���������1��2������
*ÿ�ſεĿ�������һ����ÿ�ſ�ֻ��һ���Ͽεص�
*/
create table CourseBasic(
    Cno varchar(9)PRIMARY KEY,
    Cname varchar(30),
    Climit SMALLINT,/*ѡ����������*/
    Ccur SMALLINT,/*��ǰѡ��������ÿѡ�γɹ�һ���ˣ���Ҫ��Trigger����*/
    Cdept varchar(30),
    Cgrade SMALLINT,/*�����꼶*/
    FOREIGN KEY(Cdept) REFERENCES Dept(Dname),

)

create table CTime(
    Cno varchar(9),
    Cterm SMALLINT, /*����1��2*/
    Weekday SMALLINT,
    Cbegin SMALLINT,
    Cend SMALLINT,
    FOREIGN KEY(Cno) REFERENCES CourseBasic(Cno),
    PRIMARY KEY(Cno, Cterm, Weekday, Cbegin, Cend)
)
/*ѡ�β������ǵ�����*/

create table Tcourse(/*��ʦ�̿α�*/
    Cno varchar(9),
    Tno char(9),
    Cterm SMALLINT, /*����1��2*/
    FOREIGN KEY(Cno) REFERENCES CourseBasic(Cno),
    FOREIGN KEY(Tno) REFERENCES Teacher(Tno),
    PRIMARY KEY(Cno, Tno, Cterm)
    /*�ڵ�ǰѧ�ڵ��ﾳ�£�����Ҫָ��ѧ��*/
)

create table Stu_Cour(
    Sno char(9),
    Cno varchar(9), 
    Cterm SMALLINT, /*����1��2*/
    Grade SMALLINT,
    PRIMARY KEY(Sno, Cno, Cterm),
    FOREIGN KEY(Cno) REFERENCES CourseBasic(Cno),
    FOREIGN KEY(Sno) REFERENCES Student(Sno),
)

/*��ʦ��ѧ���������һЩ�������������ı��������Ա���룬����Ҫ��ѧ�������С��˿Σ����һ�����ڡ�����ʦ���涼��һ�����޸Ŀγ���Ϣ���Ĵ��ڣ������������ʵ������д�����ű��С�����д���֮����Sys���е�AdminNotice���1*/
/*������һ�������ԣ�һ���к����ܰ��������...*/
create table T2A(
    Tno char(9) NOT NULL,/*������ʦ����*/
    Rcontent varchar(200) NOT NULL,/*�������ݣ���٣��˿Σ��޸Ŀγ���������֮���*/
    Response varchar(50),/*Admin����*/
    FOREIGN KEY(Tno) REFERENCES Teacher(Tno),
    PRIMARY KEY(Tno, Rcontent),
)

create table S2A(
    Sno char(9) NOT NULL,/*����ѧ��ѧ��*/
    Rcontent varchar(200) NOT NULL,/*�������ݣ���٣��˿Σ��޸Ŀγ���������֮���*/
    Response varchar(50),/*Admin����*/
    FOREIGN KEY(Sno) REFERENCES Student(Sno),
    PRIMARY KEY(Sno, Rcontent),
)


/*ѧ����������ʦ���뱨������Ŀ
���뱨������Ŀ�ɹ�Ϊ��ͨ����*/
create table ProjectLst(
    ProgramName varchar(40) PRIMARY KEY,
    Tno char(9) NOT NULL,
    ProIntro varchar(400),
    FOREIGN KEY(Tno) REFERENCES Teacher(Tno),
)

/*��һ���뷨��֪���в��У���ÿ����Ŀ��4�ˣ�����������˿��Բ�ֹ�ĸ�
������ʦֻ��ͬ���ĸ�
Ȼ��ѧ���ӽǿ��Կ����Լ��Ƿ�ͨ��
��������Ŀ����ֻҪselect Response='ͨ��'�ͺ���

һ���������룬��������ʦ*/
create table ProjectAppli(
    Sno char(9), 
    ProjectName varchar(40),
    Reason varchar(400),
    Response varchar(6),/*ͨ�����߲�ͨ��*/
    FOREIGN KEY(Sno) REFERENCES Student(Sno),
    FOREIGN KEY(ProjectName) REFERENCES ProjectLst(ProgramName),
)



/*���뽱ѧ��֮��Admin���յ�����*/
/*��ѧ��չʾ��*/
create table ScholarLst(
    Scholarship varchar(20) PRIMARY KEY,
    SchoIntro varchar(200),/*��ѧ����ܣ�������ѡҪ��*/
    Money SMALLINT,/* ��5k�ȽϿ��Ƿ�߶һ�������Ѿ��õ��߶������߶ѧ��͵Ͷѧ�𲻿�������*/
)

/*��ѧ�������
���Ǻ�����һ����˼·��ѧ���ӽǿ��Կ����Լ��Ƿ�ͨ��
������Ŀ����ֻҪselect Response='ͨ��'�ͺ���
��Triggerʵ������Ѿ���һ��ͨ���ĸ߶����룬�򲻸�����*/
create table ScholarAppli(
    Sno char(9),
    Scholarship varchar(20),
    Reason varchar(200),
    Response varchar(6),/*ͨ�����߲�ͨ��*/
    FOREIGN KEY(Sno) REFERENCES Student(Sno),
    FOREIGN KEY(Scholarship) REFERENCES ScholarLst(Scholarship)
)



