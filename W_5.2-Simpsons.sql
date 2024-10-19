/***********************************************************************************
NAME: EC_IT143_AB_W_5.2
PURPOSE: Answers to Simpsons questions
MODIFICATION LOG:
Ver   Date        Author       Description
----- ----------  -----------  -------------------------------------------------------------------------------
1.0   10/19/2024  Adekunle Bakare      1. EC IT143 W5.2 assignment
RUNTIME: 
Approx. 0m 50s
NOTES:
***********************************************************************************/

/* Simpsons Family Community */
--Q1. Considering Salary is important to get a credit, which is Homer´s monthly salary, did he get any  promotion on last year? - Cannot be answered with dataset? Eminialo
/* Once there is increment in Salary it will add to credit and promotion is the major factor that cause the increment in Salary. The details of this is not included in the data set */
--Q2.	Amounts are not the only thing that banks consider for credits, payments are also important, How big is the difference between the debit and credit for Viza for both Simpsons? Eminialo
SELECT (F.Debit - F.Credit) As Loan
     , P.Amount
	 , P.Account
FROM FBS_Viza_Costmo AS F
JOIN 
    Planet_Express AS P ON P.Description=F.Description
--Q3.	Considering that job seniority is important to get a credit, how many years has Homer Simpson being working and where? - Eminialo
SELECT
    f.First_Name,
    p.Category,
    COUNT(p.Amount) AS Transaction_Count
FROM 
    dbo.Planet_Express p
JOIN 
    dbo.Family_Data f ON p.Card_Member = f.Name
WHERE 
    Date >= DATEADD(MONTH, -6, GETDATE())
GROUP BY 
    f.First_Name, p.Category
ORDER BY 
    Transaction_Count DESC;
--Q4.	We may not understand flow in the description until we can review 10 performing in the column. Can we review the account with the debit to get these details?  Me
SELECT TOP 10
    MONTH(Date) AS Month,
    f.First_Name,
    SUM(p.Account) AS Performing
FROM 
    dbo.Planet_Express p
JOIN 
    dbo.Family_Data f ON p.Card_Member = f.Name
GROUP BY 
    MONTH(Date), f.First_Name
ORDER BY 
    Month;

