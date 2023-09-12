DROP DATABASE IF EXISTS dept_emp;
CREATE DATABASE dept_emp;
USE dept_emp;

CREATE TABLE dept(
	deptno numeric(2,0) primary key,
    dname varchar(12),
    loc varchar(11) not null
);

CREATE TABLE emp(
	empno numeric(4,0) primary key,
    ename varchar(11) not null,
    job varchar(13) not null,
    mgr numeric(4,0),
    hiredate date not null,
    sal decimal(7,2) not null,
    comm decimal(7,2),
    deptno numeric(2,0) not null,
    CONSTRAINT emp_mgr_emp_empno_fk
    FOREIGN KEY emp(mgr)
    REFERENCES emp(empno),
    CONSTRAINT emp_deptno_dept_deptno_fk
    FOREIGN KEY emp(deptno)
    REFERENCES dept(deptno)
);

CREATE TABLE salgrade(
	grade decimal(1,0) primary key,
    losal decimal(7,2) not null,
    hisal decimal(7,2) not null
);

-- Insertamos los registro en la tabla dept
INSERT INTO dept(deptno, dname,loc) 
VALUES(10,'ACCOUNTING','NEW_YORK');
INSERT INTO dept(deptno, dname,loc) 
VALUES(20,'RESEARCH','DALLAS');
INSERT INTO dept(deptno, dname,loc) 
VALUES(30,'SALES','CHICAGO');
INSERT INTO dept(dname,deptno,loc) 
VALUES('OPERATIONS',40,'BOSTON');

INSERT INTO emp VALUES  
    (7839, 'KING', 'PRESIDENT', NULL, '2011-11-17',5000, NULL, 10),
    (7698, 'BLAKE','MANAGER',7839,'2011-05-01',2850,NULL,30),
    (7782,'CLARK','MANAGER',7839,'2011-06-09',2450,NULL,10),
    (7566,'JONES','MANAGER', 7839, '2011-04-02',2975,NULL,20),
    (7654,'MARTIN','SALESMAN',7698, '2011-09-28',1250,1400,30),
    (7499,'ALLEN', 'SALESMAN',7698, '2011-02-20',1600,300, 30),
    (7844,'TURNER','SALESMAN',7698, '2011-09-08',1500,0, 30),
    (7900,'JAMES', 'CLERK',7698, '2011-12-03',950,NULL,30),
    (7521,'WARD','SALESMAN',7698, '2011-02-22',1250,500, 30),
    (7902,'FORD','ANALYST', 7566, '2011-12-03',3000,NULL,20),
    (7369,'SMITH', 'CLERK',7902, '2010-12-17',800,NULL, 20),
    (7788,'SCOTT', 'ANALYST', 7566, '2012-12-09',3000,NULL,20),
    (7876,'ADAMS', 'CLERK', 7788, '2012-01-12',1100,NULL,20),
    (7934,'MILLER','CLERK',7782, '2012-01-23',1300,NULL,10);

INSERT INTO salgrade VALUES 
(1,700,1200),
(2,1201,1400),
(3,1401,2000),
(4,2001,3000),
(5,3001,9999);

SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM salgrade;

DROP TRIGGER IF EXISTS emp_verifica_BU;
DELIMITER $$
CREATE TRIGGER emp_verifica_BU 
BEFORE UPDATE ON emp
FOR EACH ROW
BEGIN
    IF NEW.sal<0 THEN
       SET NEW.sal = 0;
    END IF;
    
    IF NEW.sal>5000 THEN
       SET NEW.sal = 5000;
    END IF;
    
    IF NEW.deptno<0 THEN
		SET NEW.deptno = 10;
	END IF;
    
    IF NEW.deptno>40 THEN
		SET NEW.deptno = 40;
	END IF;
END$$