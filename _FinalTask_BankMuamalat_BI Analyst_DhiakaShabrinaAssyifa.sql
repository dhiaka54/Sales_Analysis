WITH MasterData AS(
  Select 
    c.CustomerEmail AS cust_email,
    c.CustomerCity AS cust_city,
    o.Date AS order_date,
    o.Quantity AS order_qty,
    p.ProdName AS product_name,
    p.Price AS product_price,
    pc.CategoryName AS category_name,
    (o.Quantity * p.Price) AS total_sales
  From 
    ptsb.Orders AS o
  JOIN
    `ptsb.Customers` AS c ON o.CustomerID = c.CustomerID
  JOIN
    `ptsb.Products` AS p ON o.ProdNumber = p.ProdNumber
  JOIN
    `ptsb.ProductCategory` AS pc ON p.Category = pc.CategoryID)
SELECT 
  MasterData.order_date, MasterData.category_name, 
  MasterData.product_name, MasterData.product_price, 
  MasterData.order_qty, MasterData.total_sales, 
  MasterData.cust_email, MasterData.cust_city
FROM MasterData
ORDER BY
  MasterData.order_date ASC, MasterData.order_qty ASC;
