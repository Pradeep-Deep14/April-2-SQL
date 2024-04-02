--SELECT * FROM PRODUCTS
--SELECT * FROM SUPPLIERS


--SQL query to find the name of Product with the highest price in each country--





WITH CTE AS
(SELECT *,
ROW_NUMBER()OVER (PARTITION BY s.COUNTRY ORDER BY p.PRICE DESC)AS RN
FROM products as p
JOIN SUPPLIERS as s
ON s.supplier_id=p.supplier_id)
SELECT product_name,price,country
FROM CTE WHERE RN =1
