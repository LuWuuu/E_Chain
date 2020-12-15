/*A teacher's view*/

/*
1. �Լ����ڵĿε��б�???
2. ���ڵ�ĳһ�ſεľ���ѧ��ѡ�����
3. �Լ�����һЩ�������ͼ
4. �нӵĴ󴴵���Ŀ��������׼���߾ܾ�
*/

CREATE VIEW TC_Tno /*e.g. TC_1*/
AS 
SELECT Tcourse.Cterm, CourseBasic.Cno, Cname, Wday, Cbegin, Cend
FROM CourseBasic, CTime, Tcourse
WHERE Tcourse.Tno='x' AND Tcourse.Cno=CourseBasic.Cno
AND Tcourse.Cno=CTime.Cno AND Tcourse.Cterm=CTime.Cterm

/*һ����ʦ���ڵ�һ�ſεľ���ѧ����Ϣ�����ں�����¼�ɼ�*/
CREATE VIEW TCS_Tno__Cno_Cterm 
AS
SELECT Sno, Grade
FROM Stu_Cour
WHERE Stu_Cour.Cno='x' AND Stu_Cour.Cterm='y'

CREATE VIEW T2A_Tno
AS
SELECT Rcontent, Response
FROM T2A
WHERE T2A.Tno='x'

CREATE VIEW TP_Tno
AS
SELECT Sno, ProjectName, Reason, Response
FROM ProjectAppli, ProjectLst
WHERE ProjectLst.Tno='x' AND ProjectAppli.ProjectName=ProjectLst.ProgramName

CREATE ROLE Teacher_Tno

GRANT SELECT
ON TC_Tno
TO Teacher_Tno

GRANT SELECT, UPDATE(Grade)
ON TCS_Tno__Cno_Cterm 
TO Teacher_Tno

GRANT SELECT, UPDATE(Rcontent)
ON T2A_Tno
TO Teacher_Tno

GRANT SELECT, UPDATE(Response)
ON TP_Tno
TO TP_Tno


