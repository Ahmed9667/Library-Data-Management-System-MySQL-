create database library ;

-- Create the database
CREATE DATABASE library;
USE library;

-- Create Publishers table
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(50),
    publisher_country VARCHAR(50)
);

-- Insert sample publisher records
INSERT INTO Publishers (publisher_name, publisher_country) VALUES
('Penguin Random House', 'United States'),
('HarperCollins', 'United Kingdom'),
('Simon & Schuster', 'United States'),
('Macmillan Publishers', 'United Kingdom'),
('Cambridge University Press', 'United Kingdom'),
('Oxford University Press', 'United Kingdom'),
('Hachette Livre', 'France'),
('Scholastic Corporation', 'United States'),
('Springer Nature', 'Germany'),
('Pearson Education', 'United States');

-- Create Books table with publisher_id as foreign key
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    genre VARCHAR(50),
    publication_date DATE,
    isbn BIGINT,
    quantity_available INT,
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

-- Insert book records with publisher_id references
INSERT INTO Books (book_id, title, author, genre, publication_date, isbn, quantity_available, publisher_id) VALUES
(1, 'Harry Potter', 'J.K. Rowling', 'Fantasy', '1997-06-26', 9788700631625, 5, 8),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960-07-11', 9780061120084, 3, 2),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', '1925-04-10', 9780743273565, 2, 1),
(4, 'Kant: A Biography', 'Manfred Kuehn', 'Philosophy', '2002-05-06', 9780521524063, 4, 5),
(5, 'Guard Dog Training', 'William Koehler', 'Sports & Hobbies', '1972-08-14', 9780876055526, 3, 3),
(6, 'Kimono As Art', 'Dale Carolyn Gluckman', 'Art', '2008-07-21', 9780500976852, 5, 6),
(7, 'Lessons Of Loss', 'Robert A. Neimeyer', 'Psychology', '2006-03-15', 9780978955618, 2, 7),
(8, 'Bob Wills', 'H Ed Hurt', 'Music', '2000-04-11', 9781587215667, 3, 4),
(9, 'Vistas Of Infinity', 'Jurgen Ziewe', 'Psychology', '2016-02-06', 9781326353384, 4, 9),
(10, 'Hell I Was There', 'Elmer Keith', 'Poetry', '1979-06-29', 0822730146, 3, 10);

 
 create table authors (author_id int primary key unique , author_name varchar(50));
 insert into authors values (1,'J.K. Rowling'),
 (2,'Harper Lee') , (3,'F. Scott Fitzgerald'),(4,'Manfred Kuehn'),(5,'William Koehler'),
 (6,'Dale Carolyn Gluckman'),(7,'Robert A.Neimeyer'),(8,'H Ed Hurt'),(9,'Jurgen Ziewe'),(10,'Elmer Keith');
 select * from authors;
 
 create table members(member_id int primary key unique , member_name varchar(50),
 member_email varchar(50) unique , 
 member_phone varchar(50) unique);
 insert into members values(1,'John Doe','John.doe@yahoo.com','123-456-7890'),
 (2,'Jane Smith' , 'Jane.Smith@yahoo.com','257-698-6666'),
 (3,'Frank Willy','franky47@gmail.com','147-589-3327'),
 (4,'Hannah Mast','Hannah.Mast@yahoo.com','257-984-0267'),
 (5,'Punam Ackerman','Punam_A54@yahoo.com','247-965-3001');
 select * from members;
 
 create table borrowings (borrowing_id int primary key unique,
 book_id int ,
 foreign key (book_id) references books(book_id),
 member_id int,
 foreign key (member_id) references members(member_id),
 borrowing_date date not null,
 return_date date null,
 is_returned varchar(10) not null);
 
 insert into borrowings values(1,1,1,'2024-02-10','2024-02-20','true'),
 (2,2,2,'2024-02-15', null ,'false'),
 (3,2,2,'2024-02-02','2024-02-18','True'),
 (4,2,2,'2024-02-05','2024-02-21','True'),
 (5,4,3,'2024-02-07',null,'false'),
 (6,4,3,'2024-01-25','2024-02-11','true'),
 (7,5,5,'2024-01-26','2024-01-31','true'),
 (8,5,4,'2024-01-03','2024-01-21','true'),
 (9,7,4,'2024-02-13',null,'false'),
 (10,8,1,'2024-01-05','2024-01-31','true');
 select * from borrowings;
 
 create table book_copies (copy_id int primary key auto_increment,
 book_id int ,
 foreign key (book_id) references books(book_id),
 copy_number int,
 conditions varchar(20),
 shelf_location varchar(20));
 insert into book_copies values (1,1,1,'Good','A1'),(2,1,2,'Fair','B3');
 insert into book_copies(book_id,copy_number,conditions,shelf_location) values
 (2,2,'Good','B1'),(2,3,'Fair','A4'),
 (3,4,'Good','A1'),
 (3,1,'Bad','A2'),(3,3,'Fair','A6'),(3,2,'Fair','C3'),(3,2,'Good','A2'),
 (4,2,'Good','A1'),(4,1,'Fair','B6'),
 (5,4,'Good','A1'),
 (6,2,'Fair','B4'),(6,1,'Good','A1'),
 (7,1,'Bad','B7'),(7,3,'Good','A2'),(7,4,'Fair','C5'),
 (8,2,'Fair','F1'),(8,4,'Good','A4'),
 (9,2,'Bad','C5'),(9,4,'Good','A1'),(9,1,'Fair','B2'),(9,2,'Fair','B3'),
 (10,3,'Good','A2'),(10,2,'Fair','B2');
 select * from book_copies;
 
 create table authors_books (author_book_id int primary key unique,
 author_id int,
 foreign key (author_id) references authors(author_id),
 book_id int ,
 foreign key (book_id) references books(book_id));
 insert into authors_books values(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
 (6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
 select * from authors_books;
 
 create table reviews(review_id int primary key ,
 book_id int ,
 foreign key (book_id) references books(book_id),
 member_id int,
 foreign key (member_id) references members(member_id),
 rating float,
 review_text varchar(50),
 review_date date);
 insert into reviews values(1,1,1,4.5,'A classic masterpiece.','2024-02-12'),
 (2,2,2,4.7,'Absolutely loved it!','2024-02-18'),
 (3,2,2,4.7,'Brilliant!','2024-02-16'),
 (4,2,2,2,'It was not that expected','2024-02-20'),
 (5,4,3,4,'A spontaneous book','2024-02-11'),
 (6,4,3,3.5,'Not Good o__o','2024-02-11'),
 (7,5,5,4.5,'A masterpiece','2024-01-31'),
 (8,5,4,4.7,'Aowesome','2024-01-21'),
 (9,7,4,3.5,'I liked it!','2024-02-12'),
 (10,8,1,4.1,'It is pretty good','2024-01-31');
 select * from reviews;
 
 create table transactions(transaction_id int primary key auto_increment ,
 member_id int,
 foreign key (member_id) references members(member_id),
 transaction_date date,
 transaction_type varchar(50),
 amount_paid int);
 insert into transactions values (1,1,'2024-02-10','return',0),
 (2,2,'2024-02-15','Borrow',0),
 (3,2,'2024-02-02','return',0),
 (4,2,'2024-02-05','return',0),
 (5,3,'2024-02-07','purchase',20),
 (6,3,'2024-01-25','return',0),
 (7,5,'2024-01-26','return',0),
 (8,4,'2024-01-03','return',0),
 (9,4,'2024-02-13','purchase',35),
 (10,1,'2024-01-05','return',0);
 select * from transactions;


# 1.List all books borrowed by a specific member:
select * from borrowings ;
select * from books;
select * from members ; 

select t.title , members.member_name from
(select books.title ,borrowings.member_id from books
inner join borrowings on books.book_id = borrowings.book_id)t
inner join members
on members.member_id = t.member_id ;

#or
select books.title , member_name from books
inner join borrowings on books.book_id = borrowings.book_id
inner join members on borrowings.member_id = members.member_id ;
#--------------------------------------------------------------------------------------

# 2.Find the most popular genres

select * from books ;
select count(*) as genre_numbers , genre from books
group by genre
order by genre_numbers desc limit 1 ;
 #--------------------------------------------------------------------------------------
 
 # 3.Identify books with the highest average rating
 select * from books;
 select * from reviews ;
 
 select books.title , reviews.rating from books
 inner join reviews on books.book_id = reviews.book_id
 order by reviews.rating desc ;
 #--------------------------------------------------------------------------------------
 
 # 4.List all members who have borrowed more than 5 books
 select members.member_name , count(book_id) as borrowed_books 
from borrowings inner join
members on borrowings.member_id = members.member_id 
group by member_name
having borrowed_books > 5;

 #--------------------------------------------------------------------------------------
 
 # 5.List all members who have borrowed less than 5 books
 
select members.member_name , count(book_id) as borrowed_books 
from borrowings inner join
members on borrowings.member_id = members.member_id 
group by member_name
having borrowed_books < 5 ;
 #--------------------------------------------------------------------------------------
 
 # 6.Retrieve the top-rated books with at least 5 reviews
 select * from books ;
 select * from reviews ;
 
 select books.title , count(review_text) as num_of_reviews
 from books
 inner join reviews on books.book_id = reviews.book_id
 group by title
 having num_of_reviews =5 ;
 #--------------------------------------------------------------------------------------
 
 #7Calculate the total revenue generated from book purchases
 
 select sum(amount_paid) from transactions as total_revenue_of_books ;
 #--------------------------------------------------------------------------------------
 
 # 8.List all books with their respective authors and publishers
 select * from books ;
 select * from authors ;
 select * from publishers ;
 
 select books.title , authors.author_name , publishers.publisher_name
 from books
 inner join authors on books.book_id = authors.author_id
 inner join publishers on books.book_id = publisher_id ;
 #--------------------------------------------------------------------------------------
 
 # 9.Find books that are currently available for borrowing
 select books.title from books 
 inner join borrowings on books.book_id = borrowings.book_id
 where is_returned = 'true' ;
 
 #--------------------------------------------------------------------------------------
 
 # 10.Identify members who have overdue books
 select members.member_name from  members
 left join borrowings on members.member_id = borrowings.member_id
 where is_returned = 'false' ;
 
 #--------------------------------------------------------------------------------------
 # 11.List the top 10 most borrowed books 
 select books.title , count(is_returned) as num_of_borrowed_books from borrowings
  left join books on borrowings.book_id = books.book_id 
  group by books.title limit 10 ;
  #-------------------------------------------------------------------------------------
  
  # 12.Calculate the average number of days a book is borrowed for

  select books.title , avg(datediff(return_date , borrowing_date))
  from borrowings
  inner join books
  on borrowings.book_id = books.book_id
  group by title 
  ;
  
  #-------------------------------------------------------------------------------------
  
  #13.Find the total number of books published in each year

  select count(book_id)as total_number_of_books , year(publication_date) as year_of_publishing
  from books
  group by  year_of_publishing
  order by total_number_of_books desc ;
  #-------------------------------------------------------------------------------------
  
  # 14.Identify members who have borrowed books more than once
  select members.member_name , count(book_id) as borrowed_books 
from borrowings inner join
members on borrowings.member_id = members.member_id 
group by member_name
having borrowed_books >1;

 #-------------------------------------------------------------------------------------
 
 # 15.List all books with their respective authors and average ratings
  select * from books ;
 select * from authors ;
 select * from reviews;
 
 select books.title , authors.author_name , avg(rating) as rate
 from books
 inner join authors on books.book_id = authors.author_id
 inner join reviews on books.book_id = reviews.book_id 
 group by books.book_id ;
 #-------------------------------------------------------------------------------------
 
 # 16.Calculate the total number of copies available for each book
 
 select books.title , count(copy_number) as total_copies 
 from books
 inner join book_copies on books.book_id = book_copies.book_id
 group by books.title ;
 
 #-------------------------------------------------------------------------------------
 
 # 17.Create a view of transaction table and provide privilege to another user.
 # The user can view only member id and transaction date and 
 # privilege should be to select id who made transaction on any specific date
 
  create user 'ahmed9667' @'localhost' identified by 'ahly987' ;
  grant select on library.transactions from 'ahmed9667' @'localhost';
 