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

-----------------Assignment 4: Student Marks Management 
---------Create a PL/SQL block using an associa ve array indexed by VARCHAR2 to store students’ marks and 
---------calculate their average score. 
------- Requirements: 
-------1. Use an associa ve array where: 
------ Key → Student Name 
-------Value → Marks (NUMBER) 
--------Insert marks for at least 5 students. 
----Display all student names with their marks. 
-----4. Calculate and print: 
-----Total marks 
------Average marks 
 ------Hint:     Use .FIRST, .NEXT for itera on.  

DECLARE
    TYPE stud_marks IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
    v_marks stud_marks;
    
    v_key VARCHAR2(20);
    
    total_marks NUMBER := 0;
    v_count NUMBER := 0;
    average_marks NUMBER;
    
BEGIN
    v_marks('Alice') := 90;
    v_marks('Bob') := 40;
    v_marks('Clare') := 55;
    v_marks('David') := 85;
    v_marks('Eve') := 35;
    
    v_key := v_marks.FIRST;
    WHILE v_key IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_key || ', ' || 'Marks Scored: ' || v_marks(v_key));
        v_key := v_marks.NEXT(v_key);
    END LOOP;
    
    v_key := v_marks.FIRST;
    WHILE v_key IS NOT NULL LOOP
        total_marks := total_marks + v_marks(v_key);
        v_count := v_count + 1;
        v_key := v_marks.NEXT(v_key);
    END LOOP;
    
    IF v_count > 0 THEN
        average_marks := total_marks / v_count;
    ELSE
        average_marks := 0;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Total Marks: ' || total_marks);
    DBMS_OUTPUT.PUT_LINE('Average Marks: ' || average_marks);
    
END;


------------------------------Assignment 5:     Country–Capital Lookup 
-------------Objective:   Use an associa ve array indexed by VARCHAR2 to perform lookups. 
------------Requirements: 
-----------1. Declare an associa ve array with: 
-----------Key → Country Name 
-----------Value → Capital City 
-----------2. Insert at least 6 country–capital pairs. 
-----------3. Ask the user for a country name (using &country subs tu on variable). 
---------4. Display: 
----------The capital if the country exists. 
----------A message “Country not found” otherwise. 
---------- Hint:  Use EXISTS(key) to check if the element is in the associative array.

DECLARE
    TYPE t_country_capital IS TABLE OF VARCHAR2(25) INDEX BY VARCHAR2(25);
    country_capitals t_country_capital;
    country_name VARCHAR2(25) := '&country';
BEGIN
    country_capitals('INDIA') := 'DELHI';
    country_capitals('USA') := 'WASHINGTON D.C.';
    country_capitals('JAPAN') := 'TOKYO';
    country_capitals('FRANCE') := 'PARIS';
    country_capitals('GERMANY') := 'BERLIN';
    country_capitals('BRAZIL') := 'BRASILIA';
    
    IF country_capitals.EXISTS(country_name) THEN
        DBMS_OUTPUT.PUT_LINE('The capital of ' || country_name || ' is ' || country_capitals(country_name));
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found');
    END IF;
END;
