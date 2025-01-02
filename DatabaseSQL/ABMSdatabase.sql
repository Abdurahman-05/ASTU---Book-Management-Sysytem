
create database book_management
use book_management
create table U_ser(
user_id int primary key auto_increment,
username varchar(40) ,
passwd varchar(40))


create table book_pic(
pic_name varchar(30)primary key,
pic_url varchar(300));

create table book_category(
cat_id int primary key auto_increment,
cat_name varchar(40));

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    cat_id INT,
    pic_name varchar(30),
    book_name VARCHAR(200) UNIQUE,
    book_author VARCHAR(150),
    book_quantity INT,
    CONSTRAINT fk_cat_id FOREIGN KEY (cat_id) REFERENCES book_category(cat_id),
    CONSTRAINT fk_pic_name FOREIGN KEY (pic_name) REFERENCE
	S book_pic(pic_name)
);


create table borrower(
borrower_id varchar(100) primary key,
borrower_name varchar(100),
phone_number int);


create view borrowlist as
select
br.borrower_name,
br.borrower_id,
br.phone_number,
b.book_name,
bo.return_date,
bo.curent_date
from borrower br
inner join borrowed bo on br.borrower_id=bo.borrower_id
inner join books b on bo.book_id=b.book_id;



CREATE TABLE borrowed (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    borrower_id VARCHAR(100),
    return_date VARCHAR(100),
    statas VARCHAR(30),
    curent_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id),
    CONSTRAINT fk_borrower_id FOREIGN KEY (borrower_id) REFERENCES borrower(borrower_id)
);



