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
ALTER TABLE Books 
DROP COLUMN AuthorName;

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
SELECT * FROM Author;

INSERT INTO Books (BookID, Title, AuthorID, AuthorName, Available)
VALUES
(101, "A Time to Kill", 1118, "John Grisham", "Yes"),
(102, "East of Eden", 1258, "John Steinbeck", "Yes"),
(103, "The Sun Also Rises", 2548, "Ernest Hemingway", "No"),
(104, "Tender is the Night", 1258, "John Steinbeck", "Yes"),
(105, "Passage to India", 4489, "E.M. Forster", "Yes");
SELECT * FROM Books;

-- borrow books
INSERT INTO borrow_record (RecordID, BookID, BorrowerName, BorrowDate, ReturnDate)
VALUES
(10, 101, "Maria", CURDATE(), NULL);
SELECT * FROM borrow_record;

-- before return books
UPDATE Books
SET Available= "No"
WHERE BookID= 101;

-- after return books
UPDATE Books
SET Available= "Yes"
WHERE BookID= 101;

-- List all available books
SELECT BookID, Title FROM Books as b
WHERE b.BookID NOT IN (
	SELECT BookID FROM borrow_record as br
    WHERE br.ReturnDate IS NULL
);

-- Find books by a specific author 
SELECT * FROM Books
WHERE AuthorID= (
	SELECT AuthorID FROM Author
    WHERE AuthorName= "John Steinbeck"
);