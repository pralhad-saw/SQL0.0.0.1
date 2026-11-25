WITH DeptPayroll AS (
    SELECT department_id, SUM(salary) AS total_payroll
    FROM employees
    GROUP BY department_id
)
SELECT department_id, total_payroll
FROM DeptPayroll
ORDER BY total_payroll DESC
LIMIT 1;
