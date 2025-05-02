use titanic;
select * from tested;
SELECT COUNT(*) AS total_passengers FROM tested;
/*Survival Rate*/
SELECT 
    Survived, 
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM tested), 2) AS percentage
FROM tested
GROUP BY Survived;
/*number of passengers survived by gender*/
SELECT 
    Sex, 
    Survived,
    COUNT(*) AS total
FROM tested
GROUP BY Sex, Survived
ORDER BY Sex, Survived;
 /* Fill Missing Ages with Average*/
UPDATE tested
SET Age = (SELECT ROUND(AVG(Age), 2) FROM tested WHERE Age IS NOT NULL)
WHERE Age IS NULL;
/*Convert Sex to Numeric*/
SELECT 
    PassengerId,
    CASE WHEN Sex = 'male' THEN 1 ELSE 0 END AS Sex_numeric
FROM tested;
/*Survival by Ticket Class (Pclass)*/
SELECT 
    Pclass,
    Survived,
    COUNT(*) AS total
FROM tested
GROUP BY Pclass, Survived
ORDER BY Pclass, Survived;
/*Average Fare by Survival Status*/
SELECT 
    Survived,
    ROUND(AVG(Fare), 2) AS avg_fare
FROM tested
GROUP BY Survived;
/*Average Age by Survival Status*/
SELECT 
    Survived,
    ROUND(AVG(Age), 2) AS avg_age
FROM tested
WHERE Age IS NOT NULL
GROUP BY Survived;
/*Cabin Availability vs Survival*/
SELECT 
    CASE WHEN Cabin IS NOT NULL THEN 'Has Cabin' ELSE 'No Cabin' END AS cabin_status,
    Survived,
    COUNT(*) AS total
FROM tested
GROUP BY cabin_status, Survived;
/*Convert Sex to Numeric*/
SELECT 
    PassengerId,
    CASE WHEN Sex = 'male' THEN 1 ELSE 0 END AS Sex_numeric,
    Survived
FROM tested;
