
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


delimiter //
CREATE PROCEDURE addborrower(in id varchar(100) ,in nam varchar(100), in phone int ,out idii varchar(100))
begin
declare idi varchar(100) default null;
select borrower_id into idi from borrower where borrower_id=id limit 1;
if idi IS NOT NULL then
set idii=id;
else
insert into borrower(borrower_id,borrower_name, phone_number) values(id,nam,phone);
end if;
end;




delimiter //
CREATE DEFINER PROCEDURE borrow(in bok_id int , in borower_id varchar(100), in returndate varchar(100))
begin
declare quantity int;
start transaction;

select book_quantity into quantity from books where book_id=bok_id limit 1;
if quantity>0 then
insert into borrowed (book_id, borrower_id,return_date,statas) values(bok_id, borower_id, returndate,'borrowed');
update books set book_quantity=book_quantity-1 where book_id=bok_id;

commit ;
else
rollback ;
end if;
end;
delimiter;


delimiter //
CREATE PROCEDURE r_eturn(in borower_id varchar(100), in bok_id int)
begin
declare borrowed_id int;
start transaction;
select b.borrow_id into borrowed_id
from borrowed b
inner join books k on b.book_id = k.book_id
where  b.borrower_id = borower_id and k.book_id = bok_id and statas='borrowed' limit 1;


update books set book_quantity=book_quantity+1 where book_id=bok_id;
update borrowed set statas='returned' where borrow_id=borrowed_id;
commit;
end;
delimiter;


delimiter //
CREATE PROCEDURE chek(in bok_name varchar(200),in borower_id varchar(100),out chkk boolean, out chk Boolean,out bok_id int)
begin
declare bookcount int default -1;

declare b varchar(100) default -1;

select borrower_id into b from borrowed where  statas='borrowed' limit 1;
select book_id into bok_id from books where book_name=bok_name limit 1;
select count(*) into bookcount from books where book_name=bok_name;
if bookcount >0 then
set chk =true;
if b = borower_id then
set chkk=false;
else set chkk=true;
end if;
else
set chk=false;
end if;
end;
delimiter;



delimiter //
CREATE PROCEDURE chec(in bok_name varchar(200), in borower_id varchar(100), out chk boolean, out bok_id int)
begin
declare borrowedcount int default 0;
declare bokid int default null;
SELECT book_id INTO bokid
    FROM books
    WHERE book_name = bok_name
    LIMIT 1;

if bokid>0 then
set bok_id=bokid;

select count(*) into borrowedcount
from borrowed b
join books k on b.book_id = k.book_id
where k.book_id = bok_id and b.borrower_id = borower_id;

if borrowedcount>0 then
set chk=true;
else
set chk=false;
end if;
else
set chk=false;
end if;
end;
delimiter;

CREATE VIEW booklist AS
    SELECT
        p.pic_name,
        p.pic_url,
        b.book_name,
        b.book_author,
        b.book_quantity,
        c.cat_id AS cat_id
    FROM
        book_pic p
        JOIN books b ON p.pic_name = b.pic_name
        JOIN book_category c ON b.cat_id = c.cat_id;


CREATE VIEW borrowlist AS
    SELECT
        br.borrower_name,
        br.borrower_id,
        br.phone_number,
        b.book_name,
        bo.return_date,
        bo.statas
    FROM
       borrower br
        JOIN borrowed bo ON br.borrower_id = bo.borrower_id
        JOIN books b ON bo.book_id = b.book_id


insert into U_ser(username,passwd) values('admin', '123')

	
insert into book_pic(pic_name,pic_url) values('App01','img/Campbell Biology.webp')
insert into book_pic(pic_name,pic_url) values('App02','img/chemistry The Central Science.jpg')
insert into book_pic(pic_name,pic_url) values('App03','img/James Stewart - Calculus - Early transcendentals (8th Edition)_0000.jpg')
insert into book_pic(pic_name,pic_url) values('App04','img/University Physics with Modern Physics.jpg')
insert into book_pic(pic_name,pic_url) values('SE01','img/Code clean.jpg')
insert into book_pic(pic_name,pic_url) values('SE02','img/The Mythical Man-Month.jpg')
insert into book_pic(pic_name,pic_url) values('CSE01','img/Computer Systems A Programmers Perspective.jpg')
insert into book_pic(pic_name,pic_url) values('CSE02','img/Introduction to Algorithms.jpg')
insert into book_pic(pic_name,pic_url) values('A01','img/Electric Machinery.jpg')
insert into book_pic(pic_name,pic_url) values('A02','img/Power System Analysis and Design.jpg')
insert into book_pic(pic_name,pic_url) values('A03','img/Architectural Graphics.jpg')
insert into book_pic(pic_name,pic_url) values('A04','img/Building Construction.jpg')
insert into book_pic(pic_name,pic_url) values('CE01','img/Principles of Geotechnical Engineering.jpg')
insert into book_pic(pic_name,pic_url) values('CE02','img/Structural Analysis.webp')
insert into book_pic(pic_name,pic_url) values('ME01','img/Fundamentals of Thermodynamics.jpg')
insert into book_pic(pic_name,pic_url) values('ME02','img/Mechanics of Materials.jpg')

insert into book_category(cat_name) values('SE')
insert into book_category(cat_name) values('CSE')
insert into book_category(cat_name) values('CE')
insert into book_category(cat_name) values('Applied')
insert into book_category(cat_name) values('ME')
insert into book_category(cat_name) values('other')


insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(1,'SE01','Clean Code: A Handbook of Agile Software Craftsmanship','Robert C. Martin',10);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(1,'SE02','The Mythical Man-Month: Essays on Software Engineering','Frederick Brooks Jr.',12);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(2,'CSE01','Computer Systems: A Programmers Perspective','Randal E. Bryant and David R. OHallaron',9)
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(2,'CSE02','Introduction to Algorithms ','Thomas H. Cormen And Charles E. Leiserson',20);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(3,'CE01','Principles of Geotechnical Engineering',' Braja M. Das',11);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(3,'CE02','Structural Analysis','R. C. Hibbeler',21);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(4,'App01','Campbell Biologyborrow',' Neil Campbell and Jane Reece',6);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(4,'App02','chemistry The Central Science','Theodore L. Brown And H. Eugene LeMay Jr.',9);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(4,'App03','James Stewart - Calculus - Early transcendentals','James Stewart',10);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(4,'App04','University Physics with Modern Physics','Hugh D. Young and Roger A. Freedman',11);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(5,'ME01','Fundamentals of Thermodynamics ','Claus Borgnakke and Richard E. Sonntag',30);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(5,'ME02','Mechanics of Materials','Russell C. Hibbeler',1);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(6,'A01','Electric Machinery','A. E. Fitzgerald, Charles Kingsley Jr., and Stephen D. Umans',20);
insert into books(cat_id,pic_name,book_name,book_author, book_quantity) values(6,'A02','Power System Analysis and Design','Mulukutla S. Sarma, and Thomas J. Overbye',15);






