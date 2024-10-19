/***********************************************************************************
NAME: EC_IT143_AB_W_5.2
PURPOSE: Answers to Health Comunity questions
MODIFICATION LOG:
Ver   Date        Author       Description
----- ----------  -----------  -------------------------------------------------------------------------------
1.0   10/19/2024  Adekunle Bakare      1. EC IT143 W5.2 assignment
RUNTIME: 
Approx. 0m 50s
NOTES:
***********************************************************************************/

/* Health Community */
--Q1.	How many patients have fish allergy during 7 months? Wisdom
SELECT * 
FROM Allergies
WHERE DESCRIPTION = 'Allergy to fish' AND START <= DATEADD(MONTH, -7,  (select MAX(START) from Allergies where DESCRIPTION = 'Allergy to fish'))
--Q2.	Does any patient with fish allergy have any scheduled immunization Wisdom
SELECT
 Allergies.PATIENT As P,
 Immunizations.DESCRIPTION AS I, 
 Allergies.ENCOUNTER
FROM Allergies 
JOIN Immunizations ON Immunizations.ENCOUNTER = Immunizations.DESCRIPTION
--Q3. Immunization may be of help to our immunity and may help to overcome some allergy. What are the perfect imunization to go for in other to reduce exposure to allergies? Know this will break some health limitation and challengies.
SELECT COUNT('PATIENT') AS high
FROM Allergies
JOIN Immunizations ON Immunizations.PATIENT = Immunizations.DESCRIPTION
--Q4. Regular checks at hospital is of great help if not the best thing to do all the time. Can we examine the impact of encounter on the allergies. This will gives holystic view importance of medical checkup.
SELECT MAX(DESCRIPTION) AS High FROM Allergies