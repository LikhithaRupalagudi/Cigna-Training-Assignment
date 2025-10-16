------------------Assignment-1: Calculate Simple Interest 
------------Objective:     Use variables and arithmetic expressions inside a PL/SQL block. 
--Requirements: 
--1. Declare three variables: 
-- p (principal) 
--r (rate of interest) 
--t (time in years) 
--2. Compute Simple Interest using: 
-----SI=(𝒑∗𝒓∗𝒕)/𝟏𝟎𝟎
----3. Display the result using DBMS_OUTPUT.PUT_LINE. 

DECLARE
 P NUMBER;
 R NUMBER;
 T NUMBER;
 SI NUMBER;
BEGIN
  P:= 100;
  R := 200;
  T := 300;
  
  SI := (P*R*T)/100;
  DBMS_OUTPUT.PUT_LINE('Simple interest : ' || SI);
END;

--------------------------------------------------------------------------------------------------
--Assignment 2: Employee Bonus Calculation 
--Objective:     Practice variable declaration and IF conditions. 
--Requirements: 
--1. Declare variables: 
--emp_name VARCHAR2(50) 
--salary NUMBER 
---bonus NUMBER 
---2. Assign values to emp_name and salary. 
---3. Use conditions: 
---o If salary > 50000 → bonus = 0.10 × salary 
----Else → bonus = 0.15 × salary 
---4. Display employee name, salary, and bonus.

DECLARE 
  emp_name VARCHAR(50);
  salary NUMBER;
  bonus NUMBER;
  
BEGIN 
  emp_name := 'Likhitha';
  salary := 50000;

  
  IF salary > 50000 THEN
    bonus := salary * 0.10;
  ELSE
    bonus := salary * 0.15;
  END IF;
  DBMS_OUTPUT.PUT_LINE('name of employee: ' ||  emp_name || chr(10) || 'salary of employee: ' || salary || chr(10) || 'bonus of employee' || bonus ); 
 
END;
DECLARE
   emp_record emp%ROWTYPE;
BEGIN
   SELECT * INTO emp_record  FROM emp WHERE empno = 1004;
   DBMS_OUTPUT.PUT_LINE('Name: ' || emp_record.emp_name || ', Job :  ' || emp_record.job);
END;

--------------------Assignment-3:    Retrieve and Display Department Details 
---Objective:      Use %ROWTYPE with a WHERE clause. 
--Requirements: 
---1. Declare a variable v_dept of type DEPARTMENTS%ROWTYPE. 
---2. Take a sample department ID in variable 
---3. Fetch the corresponding record into v_dept. 
---4. Display department name and location 
DECLARE
    v_dept Dept%ROWTYPE;   -- Variable of type DEPARTMENTS%ROWTYPE
    v_dept_id Dept.Deptno%TYPE;  -- Variable to hold department ID
BEGIN
    v_dept_id := 10;
SELECT *INTO v_dept
FROM Dept
WHERE Deptno = v_dept_id; 

DBMS_OUTPUT.PUT_LINE('Department Name: ' || v_dept.dept_name);
DBMS_OUTPUT.PUT_LINE('Location ID: ' || v_dept.Loc); 

END;
