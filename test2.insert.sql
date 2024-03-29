
-- Insert data into Product table
INSERT INTO ecommerce.Product (ProductID, Name, Description, Price, StockQuantity, CategoryID) VALUES
(1, 'Laptop', 'High-performance laptop', 1200.00, 50, 1),
(2, 'Smartphone', 'Latest model smartphone', 800.00, 100, 2),
(3, 'Headphones', 'Noise-cancelling headphones', 150.00, 75, 3);

-- Insert data into User table
INSERT INTO ecommerce.User (UserID, Email, Password, FirstName, LastName, ShippingAddress, BillingAddress, PhoneNumber) VALUES
(1, 'user1@example.com', 'password123', 'John', 'Doe', '123 Main St', '123 Main St', '1234567890'),
(2, 'user2@example.com', 'password456', 'Jane', 'Smith', '456 Elm St', '456 Elm St', '0987654321');

-- Insert data into Order table
INSERT INTO ecommerce.Order (OrderID, UserID, OrderDate, Status) VALUES
(1, 1, '2024-01-05 10:00:00', 'Shipped'),
(2, 2, '2024-01-06 11:00:00', 'Processing');

-- Insert data into OrderItem table
INSERT INTO ecommerce.OrderItem (OrderItemID, OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 1, 1200.00),
(2, 2, 2, 1, 800.00);

-- Insert data into ShoppingCart table
INSERT INTO ecommerce.ShoppingCart (CartID, UserID) VALUES
(1, 1),
(2, 2);

-- Insert data into CartItem table
INSERT INTO ecommerce.CartItem (CartItemID, CartID, ProductID, Quantity) VALUES
(1, 1, 3, 2),
(2, 2, 2, 1);

-- Insert data into Category table
INSERT INTO ecommerce.Category (CategoryID, Name, Description) VALUES
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Mobile Phones', 'Smartphones and mobile accessories'),
(3, 'Audio', 'Audio equipment like headphones and speakers');
