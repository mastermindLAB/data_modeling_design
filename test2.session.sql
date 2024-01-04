CREATE TABLE ecommerce.Product (
    ProductID       INT,
    Name            VARCHAR(255),
    Description     TEXT,
    Price           DECIMAL(10, 2),
    StockQuantity   INT,
    CategoryID      INT,
    PRIMARY KEY (ProductID)
);

CREATE TABLE ecommerce.User (
    UserID          INT,
    Email           VARCHAR(255),
    Password        VARCHAR(255),
    FirstName       VARCHAR(255),
    LastName        VARCHAR(255),
    ShippingAddress TEXT,
    BillingAddress  TEXT,
    PhoneNumber     VARCHAR(20),
    PRIMARY KEY (UserID)
);

CREATE TABLE ecommerce.Order (
    OrderID     INT,
    UserID      INT,
    OrderDate   DATETIME,
    Status      VARCHAR(255),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (UserID) REFERENCES ecommerce.User(UserID)
);

CREATE TABLE ecommerce.OrderItem (
    OrderItemID INT,
    OrderID     INT,
    ProductID   INT,
    Quantity    INT,
    Price       DECIMAL(10, 2),
    PRIMARY KEY (OrderItemID),
    FOREIGN KEY (ProductID) REFERENCES ecommerce.Product(ProductID),
    FOREIGN KEY (OrderID) REFERENCES ecommerce.Order(OrderID)
);

CREATE TABLE ecommerce.ShoppingCart (
    CartID      INT,
    UserID      INT,
    PRIMARY KEY (CartID)
);

CREATE TABLE ecommerce.CartItem (
    CartItemID  INT,
    CartID      INT,
    ProductID   INT,
    Quantity    INT,
    PRIMARY KEY (CartItemID),
    FOREIGN KEY (CartID) REFERENCES ecommerce.ShoppingCart(CartID),
    FOREIGN KEY (ProductID) REFERENCES ecommerce.Product(ProductID)
);

CREATE TABLE ecommerce.Category (
    CategoryID  INT,
    Name        VARCHAR(255),
    Description TEXT,
    PRIMARY KEY (CategoryID)
);
