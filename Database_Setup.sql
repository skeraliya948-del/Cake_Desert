-- SQL Database Script for Sweet Delights ASP.NET Application
-- Run this script in SQL Server Management Studio (SSMS) or Visual Studio SQL Server Object Explorer

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'SweetDelightsDB')
BEGIN
    CREATE DATABASE SweetDelightsDB;
END
GO

USE SweetDelightsDB;
GO

-- 1. Create Table emp_tbl for User/Employee Management & Login
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'emp_tbl')
BEGIN
    CREATE TABLE emp_tbl (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Name VARCHAR(100) NOT NULL,
        Gender VARCHAR(20) NOT NULL,
        Email VARCHAR(100) NOT NULL UNIQUE,
        Password VARCHAR(100) NOT NULL,
        City VARCHAR(50) NOT NULL,
        Address VARCHAR(255) NULL,
        Mobile VARCHAR(20) NULL,
        Image VARCHAR(255) NULL
    );
END
GO

-- 2. Create Table Add_Company_Tbl for Add_Company.aspx & Show_Company.aspx
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Add_Company_Tbl')
BEGIN
    CREATE TABLE Add_Company_Tbl (
        Comp_Id INT IDENTITY(1,1) PRIMARY KEY,
        Comp_Name VARCHAR(150) NOT NULL,
        Comp_Owner_Name VARCHAR(150) NULL,
        Comp_Email VARCHAR(100) NULL,
        Comp_Address VARCHAR(255) NULL,
        Comp_Cover_Img VARCHAR(255) NULL,
        Comp_Image VARCHAR(255) NULL,
        Comp_Desc VARCHAR(MAX) NULL
    );
END
GO

-- 3. Create Table Add_Products_Tbl for Add_Products.aspx, Show_Products.aspx & ViewDetails.aspx
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Add_Products_Tbl')
BEGIN
    CREATE TABLE Add_Products_Tbl (
        Prod_Id INT IDENTITY(1,1) PRIMARY KEY,
        Prod_Comp_Id INT NOT NULL DEFAULT 1,
        Prod_Name VARCHAR(150) NOT NULL,
        Prod_Model VARCHAR(150) NULL,
        Prod_Desc VARCHAR(MAX) NULL,
        Prod_Weight VARCHAR(50) NULL,
        Prod_Config VARCHAR(255) NULL,
        Prod_Img VARCHAR(255) NULL,
        Prod_Image VARCHAR(255) NULL,
        Prod_Price DECIMAL(18,2) NOT NULL DEFAULT 0.00
    );
END
GO

-- 4. Create Table Cart_Tbl for Show_Products.aspx Add To Cart
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Cart_Tbl')
BEGIN
    CREATE TABLE Cart_Tbl (
        Cart_Id INT IDENTITY(1,1) PRIMARY KEY,
        Cart_User_Id INT NOT NULL,
        Cart_Prod_Id INT NOT NULL,
        Quentity INT NOT NULL DEFAULT 1,
        AddedDate DATETIME NOT NULL DEFAULT GETDATE()
    );
END
GO

-- Seed Demo Records into emp_tbl
IF NOT EXISTS (SELECT * FROM emp_tbl WHERE Email = 'admin@gmail.com')
BEGIN
    INSERT INTO emp_tbl (Name, Gender, Email, Password, City, Address, Mobile, Image)
    VALUES ('Admin User', 'Male', 'admin@gmail.com', '123456', 'Ahmedabad', 'Sweet Plaza, CG Road', '9876543210', 'images/default-user.jpg');
END
GO

-- Seed Demo Records into Add_Company_Tbl
IF NOT EXISTS (SELECT * FROM Add_Company_Tbl WHERE Comp_Id = 1)
BEGIN
    INSERT INTO Add_Company_Tbl (Comp_Name, Comp_Owner_Name, Comp_Email, Comp_Address, Comp_Cover_Img, Comp_Image, Comp_Desc)
    VALUES 
    ('Celebration Cakes', 'Chef Pierre', 'pierre@bakery.com', 'CG Road, Ahmedabad', 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=600&q=80', 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=600&q=80', 'Custom birthday, anniversary and designer multi-tiered cakes.'),
    ('French Macarons & Desserts', 'Meera Desai', 'meera@bakery.com', 'SG Highway, Ahmedabad', 'https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=600&q=80', 'https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=600&q=80', 'Authentic French macarons, dessert cups and mousse jars.'),
    ('Gourmet Pastries & Cheesecakes', 'Ramesh Patel', 'ramesh@bakery.com', 'Navrangpura, Ahmedabad', 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?auto=format&fit=crop&w=600&q=80', 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?auto=format&fit=crop&w=600&q=80', 'Fresh single slice pastries, New York cheesecakes and tarts.');
END
GO

-- Seed Demo Records into Add_Products_Tbl
IF NOT EXISTS (SELECT * FROM Add_Products_Tbl WHERE Prod_Id = 1)
BEGIN
    INSERT INTO Add_Products_Tbl (Prod_Comp_Id, Prod_Name, Prod_Model, Prod_Desc, Prod_Weight, Prod_Config, Prod_Img, Prod_Image, Prod_Price)
    VALUES 
    (1, 'Celebration Cakes', 'Belgian Chocolate Truffle', 'Rich Belgian dark chocolate sponge layered with smooth ganache, cocoa dust & gold leaf flakes.', '0.5 kg', '100% Eggless • 24k Gold Flakes', 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80', 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80', 650.00),
    (1, 'Celebration Cakes', 'Red Velvet Cream Cheese', 'Crimson cocoa sponge infused with real vanilla bean and iced with silky cream cheese frosting.', '0.5 kg', '100% Eggless • Cream Cheese', 'https://images.unsplash.com/photo-1586985289688-ca3cf47d3e6e?auto=format&fit=crop&w=800&q=80', 'https://images.unsplash.com/photo-1586985289688-ca3cf47d3e6e?auto=format&fit=crop&w=800&q=80', 700.00),
    (2, 'French Macarons & Desserts', 'Parisian Macaron Box', 'Assorted delicate french macarons: Pistachio blush, Strawberry cream, Lemon curd, and Dark Chocolate.', 'Box of 6', 'Artisanal • 6 Pieces', 'https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=800&q=80', 'https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=800&q=80', 480.00);
END
GO
