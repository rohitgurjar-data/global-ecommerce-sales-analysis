/*=========================================================
                SALES PERFORMANCE ANALYSIS
=========================================================*/
/*
=========================================================
Business Question:
What is the total revenue?

Business Importance:
Measures the overall sales performance.

Expected Output: 9726006.95
=========================================================
*/
SELECT
	SUM(Sales_Amount) AS Total_Revenue
FROM OnlineRetailClean;
/*
=========================================================
Business Question:
What is the total Order?

Business Importance:
Measures the overall Total Order.

Expected Output: 25900
=========================================================
*/
SELECT
	COUNT(DISTINCT InvoiceNo) AS Total_Order
FROM OnlineRetailClean;
/*
=========================================================
Business Question:
What is the total Customers?

Business Importance:
Measures the overall Unique customers.

Expected Output:4372
=========================================================
*/
SELECT
	COUNT(DISTINCT CustomerID) AS Total_Customers
FROM OnlineRetailClean
WHERE CustomerID IS NOT NULL
	 AND CustomerID<>'';
/*
=========================================================
Business Question:
What is the Average Order Value?

Business Importance:
Measures the overall Average Order Value.

Expected Output:375.52
=========================================================
*/
SELECT
	ROUND(SUM(Sales_Amount)
	/COUNT(DISTINCT InvoiceNo),2) AS Average_Order_Value
FROM OnlineRetailClean;
/*
=========================================================
Business Question:
What is the Revenue by Country?

Business Importance:
Measures the Revenue by Country To check which country genrate highest revenue.

Expected Output: United Kingdom = 8167128 , Netherlands = 284661
=========================================================
*/
SELECT
	Country,
	SUM(Sales_Amount) as Revenue
FROM OnlineRetailClean
GROUP BY Country 
ORDER BY Revenue DESC ;
/*
=========================================================
Business Question:
What is the Revenue by Top 10 Country?

Business Importance:
Measures the Top 10 highest revenue genrate Country.

Expected Output: United Kingdom , Netherlands,Eire, Germany, France, Austraila, Switzerland etc.
=========================================================
*/
SELECT TOP 10
	Country,
	SUM(Sales_Amount) as Revenue
FROM OnlineRetailClean
GROUP BY Country 
ORDER BY Revenue DESC ;
/*
=========================================================
Business Question:
What is the Revenue by Top 10 Products by Revenue?

Business Importance:
Measures the Top 10 highest revenue Products .

Expected Output:REGENCY_CAKESTAND_3_TIER .
=========================================================
*/
SELECT TOP 10
	Description AS Product,
	SUM(Sales_Amount) as Revenue
FROM OnlineRetailClean
GROUP BY Description 
HAVING Description NOT LIKE'%POSTAGE%'
ORDER BY Revenue DESC ;
/*
=========================================================
Business Question:
What is the Revenue by Top 10 Products by Quantity Sold?

Business Importance:
Measures the Top 10 Products by Quantity Sold .

Expected Output:WORLDWAR_2_GLIDERS_ASSTD_DESIGNS = 53751 QUANTITY .
=========================================================
*/
SELECT TOP 10
	Description AS Product,
	SUM(Quantity) as Sold_Quantity
FROM OnlineRetailClean
GROUP BY Description 
ORDER BY Sold_Quantity DESC ;
/*
=========================================================
Business Question:
What is the  Products Having Revenue > 50,000?

Business Importance:
Find out the Products that having Revenue > 50000 .

Expected Output:REGENCY_CAKESTAND_3_TIER .
=========================================================
*/
SELECT 
	Description AS Product,
	SUM(Sales_Amount) as Revenue
FROM OnlineRetailClean
WHERE Description NOT LIKE'%POSTAGE%'
GROUP BY Description 
HAVING SUM(Sales_Amount)> 50000
ORDER BY Revenue DESC ;
/*
=========================================================
Business Question:
What is the  Top 10 Customers?

Business Importance:
Find out the Top 10 Customers .

Expected Output: CustomerID - 14646 is the highest revenue genrate customer .
=========================================================
*/
SELECT 
	TOP 10
	CustomerID,
	SUM(Sales_Amount) as Revenue
FROM OnlineRetailClean
GROUP BY CustomerID
HAVING  CustomerID IS NOT NULL
	  AND CustomerID <>' '
ORDER BY Revenue DESC ;
/*
=========================================================
Business Question:
What is the list of Customers who Spending > 10,000?

Business Importance:
Find out the list of Customers who spending more then 10000 .

Expected Output: Total 97 customer are spending more then 10000.
=========================================================
*/
SELECT 
	CustomerID,
	SUM(Sales_Amount) as Revenue
FROM OnlineRetailClean
GROUP BY CustomerID
HAVING  SUM(Sales_Amount)>10000 
	  AND CustomerID IS NOT NULL
ORDER BY Revenue DESC ;
/*
=========================================================
Business Question:
What is the Revenue by Year?

Business Importance:
Find out the the Revenue on the basis of year .To analysis the year of year sales.
=========================================================
*/
SELECT 
	YEAR(InvoiceDate) as Sales_Year,
	SUM(Sales_Amount) as Revenue
FROM OnlineRetailClean
GROUP BY YEAR(InvoiceDate)
ORDER BY YEAR(InvoiceDate) DESC;
/*
=========================================================
Business Question:
What is the Revenue by Year and month?

Business Importance:
Find out the the Revenue on the basis of year and month.To analysis the seles which month is highest and wchich month is lowest seles.

=========================================================
*/
SELECT 
	YEAR(InvoiceDate) as Sales_Year,
	MONTH(InvoiceDate)as Sales_Month,
	SUM(Sales_Amount) as Revenue
FROM OnlineRetailClean
GROUP BY YEAR(InvoiceDate),
		MONTH(InvoiceDate)
ORDER BY YEAR(InvoiceDate) DESC,
		  MONTH(InvoiceDate);

/*
=========================================================
Business Question:
What are the returned orders?

Business Importance:
Find out the the returnded orders. To analysis the returned sales 
=========================================================
*/
SELECT 
	InvoiceNo,
	CustomerID,
	Sales_Amount
FROM OnlineRetailClean
WHERE InvoiceNo LIKE 'C%'
/*
=========================================================
Business Question:
What is the Total Returned Amount?

Business Importance:
Measure the total Returned Amount.to analysis the returned product total amount .

Expected Output: -893979.73.
=========================================================
*/
SELECT 
	SUM(Sales_Amount) as Total_Returned_Amount
FROM OnlineRetailClean
WHERE InvoiceNo LIKE 'C%';