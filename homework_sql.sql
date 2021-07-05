-- Bt1: Hãy tìm tất cả những nam giới tuổi dưới 45
SELECT p.name, p.age, p.gender FROM 
(SELECT name, DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)), '%Y')+0 AS age, gender 
FROM person) 
AS p 
WHERE p.gender = 'Male' and p.age < 45
ORDER BY p.age, p.gender DESC;

-- Bt2: Hãy tìm tất cả những nữ giới làm nghề lái xe 'driver'
SELECT * FROM person 
WHERE gender = 'female' and job = 'driver';

-- Bt3: Tính tỷ lệ nam/nữ lập trình viên trong tất cả tập dữ liệu
SELECT t.job, m.malecount/(t.total-m.malecount) FROM 
(SELECT job, COUNT(*) AS total 
FROM person WHERE job='developer' 
GROUP BY job) AS t 
JOIN 
(SELECT job, COUNT(*) AS malecount 
FROM person WHERE gender = 'Male' and job='developer'
GROUP BY job) AS m ON t.job = m.job;


-- Bt4: Hãy tìm 5 thành phố có số lượng nữ lớn nhất
SELECT city, gender, COUNT(*) as countFemale FROM person GROUP BY city, gender HAVING gender ='Female' ORDER BY countFemale DESC LIMIT 5;