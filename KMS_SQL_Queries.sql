
-- KMS SQL Case Study Queries

-- 1. Product category with highest sales
SELECT "Product Category", SUM(Sales) AS TotalSales
FROM sales_data
GROUP BY "Product Category"
ORDER BY TotalSales DESC;

-- 2. Top 3 and Bottom 3 regions by sales
SELECT Region, SUM(Sales) AS TotalSales
FROM sales_data
GROUP BY Region
ORDER BY TotalSales DESC;

-- 3. Total sales of appliances in Ontario
SELECT SUM(Sales) AS ApplianceSales
FROM sales_data
WHERE "Product Sub-Category" = 'Appliances' AND Province = 'Ontario';

-- 4. Bottom 10 customers by total sales
SELECT "Customer Name", SUM(Sales) AS TotalSales
FROM sales_data
GROUP BY "Customer Name"
ORDER BY TotalSales ASC
LIMIT 10;

-- 5. Shipping method with highest shipping cost (using total discount as proxy)
SELECT "Ship Mode", SUM(Discount) AS TotalShippingCost
FROM sales_data
GROUP BY "Ship Mode"
ORDER BY TotalShippingCost DESC;

-- 6. Most valuable customers and what they buy
SELECT "Customer Name", "Product Category", SUM(Sales) AS TotalSales
FROM sales_data
GROUP BY "Customer Name", "Product Category";

-- 7. Small business customer with highest sales
SELECT "Customer Name", SUM(Sales) AS TotalSales
FROM sales_data
WHERE "Customer Segment" = 'Small Business'
GROUP BY "Customer Name"
ORDER BY TotalSales DESC
LIMIT 1;

-- 8. Corporate customer with most orders
SELECT "Customer Name", COUNT(*) AS OrderCount
FROM sales_data
WHERE "Customer Segment" = 'Corporate'
GROUP BY "Customer Name"
ORDER BY OrderCount DESC
LIMIT 1;

-- 9. Most profitable consumer customer
SELECT "Customer Name", SUM(Profit) AS TotalProfit
FROM sales_data
WHERE "Customer Segment" = 'Consumer'
GROUP BY "Customer Name"
ORDER BY TotalProfit DESC
LIMIT 1;

-- 10. Customers who returned items (based on negative profit)
SELECT DISTINCT "Customer Name", "Customer Segment"
FROM sales_data
WHERE Profit < 0;
