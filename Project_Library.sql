CREATE DATABASE library_management;
CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- Author table
CREATE TABLE Author(
	AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(25)
);

-- Books table
CREATE TABLE Books(
	BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(20) NOT NULL,
    AuthorID INT,
    AuthorName VARCHAR(25),
    Available VARCHAR(5),
	FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID) -- foreign key
);

-- Borrow_Record table
CREATE TABLE Borrow_Record(
	RecordID INT AUTO_INCREMENT PRIMARY KEY,
	BookID INT,
    BorrowerName VARCHAR(20),
    BorrowDate DATETIME,
    ReturnDate DATETIME,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Add authors and new books 
INSERT INTO Author (AuthorID, AuthorName)
VALUES
(1118, "John Grisham"),
(1258, "John Steinbeck"),
(2548, "Ernest Hemingway"),
(4489, "E.M. Forster");

INSERT INTO Books (BookID, Title, AuthorID, AuthorName, Available)
VALUES
(101, "A Time to Kill", 1118, "John Grisham", "Yes"),
(102, "East of Eden", 1258, "John Steinbeck", "Yes"),
(103, "The Sun Also Rises", 2548, "Ernest Hemingway", "No"),
(104, "Tender is the Night", 1258, "John Steinbeck", "Yes"),
(105, "Passage to India", 4489, "E.M. Forster", "Yes");









