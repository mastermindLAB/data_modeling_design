
-- 1. List of Products with Stock Status
SELECT ProductID, Name, StockQuantity 
FROM ecommerce.Product 
WHERE StockQuantity < 70;

-- 2. Total Revenue Per Product
SELECT p.ProductID, p.Name, SUM(oi.Quantity * oi.Price) AS TotalRevenue
FROM ecommerce.Product p
JOIN ecommerce.OrderItem oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductID;

-- 3. Orders by Users
SELECT u.UserID, u.FirstName, u.LastName, COUNT(o.OrderID) AS NumberOfOrders
FROM ecommerce.User u
JOIN ecommerce.Order o ON u.UserID = o.UserID
GROUP BY u.UserID;

-- 4. Recent Orders
SELECT OrderID, UserID, OrderDate, Status 
FROM ecommerce.Order 
WHERE OrderDate >= NOW() - INTERVAL 30 DAY;

-- 5. Top Selling Products
SELECT p.ProductID, p.Name, SUM(oi.Quantity) AS TotalSold
FROM ecommerce.OrderItem oi
JOIN ecommerce.Product p ON oi.ProductID = p.ProductID
GROUP BY p.ProductID
ORDER BY TotalSold DESC
LIMIT 10;

-- 6. User Purchase History
SELECT u.UserID, u.FirstName, u.LastName, o.OrderID, o.OrderDate
FROM ecommerce.User u
JOIN ecommerce.Order o ON u.UserID = o.UserID
ORDER BY u.UserID, o.OrderDate;

-- 7. Average Order Value
SELECT AVG(TotalOrderValue) AS AvgOrderValue
FROM (
    SELECT o.OrderID, SUM(oi.Price * oi.Quantity) AS TotalOrderValue
    FROM ecommerce.Order o
    JOIN ecommerce.OrderItem oi ON o.OrderID = oi.OrderID
    GROUP BY o.OrderID
) AS OrderValues;

-- 8. Popular Categories
SELECT c.CategoryID, c.Name, COUNT(p.ProductID) AS NumberOfProducts
FROM ecommerce.Category c
JOIN ecommerce.Product p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID
ORDER BY NumberOfProducts DESC;

-- 9. Items in User Shopping Carts
SELECT u.UserID, u.FirstName, u.LastName, ci.CartID, COUNT(ci.CartItemID) AS ItemsInCart
FROM ecommerce.User u
JOIN ecommerce.ShoppingCart sc ON u.UserID = sc.UserID
JOIN ecommerce.CartItem ci ON sc.CartID = ci.CartID
GROUP BY u.UserID,u.FirstName, u.LastName, ci.CartID;

-- 10. Order Details (Joining Multiple Tables)
SELECT o.OrderID, u.FirstName, u.LastName, p.Name AS Product, oi.Quantity, oi.Price
FROM ecommerce.Order o
JOIN ecommerce.User u ON o.UserID = u.UserID
JOIN ecommerce.OrderItem oi ON o.OrderID = oi.OrderID
JOIN ecommerce.Product p ON oi.ProductID = p.ProductID;
