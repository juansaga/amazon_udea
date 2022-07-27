--Creación Base de datos 

CREATE DATABASE Amazon_UDA;



-- Creación de tablas 

CREATE TABLE Product_Category(
	
	Pk_Product_Category SERIAL PRIMARY KEY,
	Name_Product_Category VARCHAR(50) NOT NULL,
	Description VARCHAR(250) NULL,
	Status BOOLEAN NOT NULL DEFAULT TRUE 
	
);


CREATE TABLE Products(
	Pk_Product SERIAL PRIMARY KEY,
	Name_Product VARCHAR (50) NOT NULL,
	Weight REAL NOT NULL, 
	Description VARCHAR(250) NULL,
	stock INTEGER NOT NULL, 
	Price REAL NOT NULL,
	Fk_Product_Category INTEGER NOT NULL,
	Status BOOLEAN NOT NULL DEFAULT TRUE,
	FOREIGN KEY (Fk_Product_Category) REFERENCES Product_Category (Pk_Product_Category)
	
);

CREATE TABLE Customer_Category(
	Pk_Customer_Category SERIAL PRIMARY KEY,
	Name_Customer_Category VARCHAR(50) NOT NULL,
	Discount REAL NOT NULL,
	Description VARCHAR(250) NULL,
	Status BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Countries(
	Pk_Countries SERIAL PRIMARY KEY,
	Name_Country VARCHAR(100) NOT NULL UNIQUE,
	Postal_Code BIGINT NOT NULL UNIQUE,
	Continent VARCHAR (50) NOT NULL
);

CREATE TABLE Customers(
	Pk_Customer SERIAL PRIMARY KEY,
	First_Name VARCHAR(100) NOT NULL,
	Last_Name VARCHAR(100) NOT NULL, 
	Email VARCHAR(150) NOT NULL, 
	Phone VARCHAR(100) NULL,
	Password_Customer VARCHAR(200) NOT NULL,
	Default_Shipping_Address VARCHAR(200) NOT NULL, 
	Date_Create_Account DATE NOT NULL,
	Fk_Countries INTEGER NOT NULL,
	Fk_Customer_Category INTEGER NOT NULL,
	FOREIGN KEY (Fk_Countries) REFERENCES Countries (Pk_Countries),
	FOREIGN KEY (Fk_Customer_Category) REFERENCES Customer_Category (Pk_Customer_Category)	
);

CREATE TABLE Delivery_Companies(
	Pk_Delivery_Companies SERIAL PRIMARY KEY,
	Name_Company VARCHAR(100) NOT NULL,
	Phone_Contact VARCHAR(100) NOT NULL,
	Email_Contact VARCHAR(100) NOT NULL,
	Address_Company VARCHAR(100) NOT NULL,
	Fk_Countries INTEGER NOT NUll,
	Status BOOLEAN NOT NULL DEFAULT TRUE,
	FOREIGN KEY (Fk_Countries) REFERENCES Countries ( Pk_Countries)
	
);

CREATE TABLE Orders(
	Pk_Order SERIAL PRIMARY KEY,
	Shipping_address VARCHAR(150) NOT NULL,
	Order_Date DATE NOT NULL,
	Order_Status BOOLEAN NOT NULL DEFAULT FALSE,
	Ammount FLOAT8 NOT NULL, 
	Fk_Customers INTEGER NOT NULL,
	Fk_Delivery_Countries INTEGER NOT NULL,
	FOREIGN KEY (Fk_Customers) REFERENCES Customers (Pk_Customer),
	FOREIGN KEY (Fk_Delivery_Countries) REFERENCES Countries (Pk_Countries)	
);

CREATE TABLE Order_Details(
	Pk_Order_Details SERIAL PRIMARY KEY,
	Price FLOAT8 NOT NULL,
	Quantity INTEGER NOT NULL,
	Fk_Products INTEGER NOT NULL,
	Fk_Order INTEGER NOT NULL,
	Fk_Delivery_Companies INTEGER NOT NULL,
	FOREIGN KEY (Fk_Products) REFERENCES Products ( Pk_product),
	FOREIGN KEY (Fk_Order) REFERENCES Orders (Pk_Order),
	FOREIGN KEY (Fk_Delivery_Companies) REFERENCES Delivery_Companies (Pk_Delivery_Companies)

);