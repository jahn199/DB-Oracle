SELECT DEPT_CODE, FLOOR(avg(SALARY)) AS 평균_급여
FROM EMPLOYEE
WHERE upper(DEPT_CODE) in ('D5','D6')
GROUP BY DEPT_CODE;

SELECT JOB_CODE, sum(SALARY)
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2000
GROUP BY job_code; 

SELECT DEPT_CODE, JOB_CODE, sum(salary)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE;

SELECT dept_code, SAL_LEVEL, count(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE, SAL_LEVEL
ORDER BY DEPT_CODE, SAL_LEVEL;

SELECT dept_code, count(*)
FROM EMPLOYEE
WHERE bonus IS NOT null
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

SELECT dept_code, bonus, count(BONUS)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

--employee 테이블과 department 테이블에서 부서코드 조회하기
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

SELECT employee.emp_id, employee.emp_name, employee.dept_code, department.dept_title
FROM EMPLOYEE,DEPARTMENT --테이블 조회를 2개이상 가능 
WHERE employee.dept_code = department.dept_id; --오라클에서는 되지 않음 

SELECT e.EMP_ID, e.emp_name, e.JOB_CODE, n.JOB_NAME
FROM EMPLOYEE e, JOB n;

SELECT d.DEPT_ID, d.DEPT_TITLE, l.LOCAL_CODE, l.LOCAL_NAME
FROM DEPARTMENT d, LOCATION l;

--department 테이블과 location 테이블 national 테이블을 이용해서
-- dept_id, dept_title, location_id, national_code, national_name 출력
-- where 절 사용 -> 서로 같다는 표기를 2개 이상의 테이블에서 진행해야할 떼는 where 절을 필수로 사용 
--department 테이블에서 location_id와 location 테이블에서 local_code 일치하고
-- location 테이블에서 national_code 와 national 테이블에서 national_code 일치
SELECT d.DEPT_ID, d.DEPT_TITLE, l.LOCAL_CODE, n.NATIONAL_CODE, n.NATIONAL_NAME
FROM DEPARTMENT d, LOCATION l, NATIONAL n
WHERE d.LOCATION_ID = l.LOCAL_CODE
AND l.NATIONAL_CODE= n.NATIONAL_CODE;

--employee 테이블에서 각 부서에 속한 사원들에 평균 급여
SELECT  DEPT_CODE,floor(avg(SALARY)) AS "평균_급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--employee 테이블에서 각 직급마다 급여가 가장 높은 사원의 이름과 급여 max(salary)
SELECT job_code, emp_name, MAX(SALARY) AS "가장 높은 급여"
FROM EMPLOYEE
GROUP BY JOB_CODE, EMP_NAME
ORDER BY JOB_CODE, MAX(SALARY) DESC;

--부서별로 입사한 직원들의 평균 급여 
SELECT DEPT_CODE, floor(avg(SALARY)) AS 평균급여 
FROM EMPLOYEE
GROUP BY DEPT_CODE;

부서이름이 
SELECT e.emp_name 
FROM DEPARTMENT d, EMPLOYEE e
WHERE d.DEPT_ID = e. DEPT_CODE
AND d.DEPT_TITLE = '인사관리부'';'

SELECT e.emp_name, d.dept_title
FROM EMPLOYEE e, DEPARTMENT d
WHERE e.DEPT_CODE = d.DEPT_ID
AND e.email IS NOT NULL;

SELECT emp_name, dept_code, max(salary)
FROM employee,department 
GROUP BY emp_name, dept_code
ORDER BY emp_name, max(salary) DESC;

SELECT SALARY, COUNT(*) AS 직원_수
FROM EMPLOYEE
GROUP BY SALARY;

SELECT dept_title, avg(salary) AS 평균_급여
FROM EMPLOYEE,DEPARTMENT 
GROUP BY DEPT_TITLE
ORDER BY avg(salary) DESC;

SELECT LOCATION_ID, count(DISTINCT DEPT_ID) AS 부서수
FROM department
GROUP BY LOCATION_ID;

SELECT DEPT_code, avg(salary) AS 평균_급여, avg(bonus) AS 평균_보너스_비율
FROM DEPARTMENT, EMPLOYEE
GROUP BY DEPT_code
ORDER BY avg(bonus);

SELECT DEPT_TITLE, avg(salary) AS 평균_급여, avg(bonus) AS 평균_보너스_비율
FROM DEPARTMENT, EMPLOYEE
GROUP BY DEPT_TITLE 
ORDER BY DEPT_TITLE ASC;

SELECT dept_code, count(*) AS 퇴사자 
FROM EMPLOYEE
WHERE ENT_YN = upper('y')
GROUP BY DEPT_CODE
ORDER BY 퇴사자 DESC;






