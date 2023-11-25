USE section24
go

DROP table orders
drop table ORDERLINE
DROP TABLE PRODUCT


CREATE TABLE orders(
    orderid NUMERIC(5) PRIMARY KEY,
    orderdate DATE NOT NULL
)

CREATE TABLE ORDERLINE (
    orderid numeric(5) CONSTRAINT orders_orderid_pk FOREIGN KEY REFERENCES ORDERS(orderid),
    productid NUMERIC(5) CONSTRAINT product_productid_fk FOREIGN KEY REFERENCES PRODUCT(productid),
    orderedquantity NUMERIC(5) CONSTRAINT chk_in_quantity CHECK (orderedquantity > 0),
    CONSTRAINT composite_key_inv_and_part PRIMARY KEY(orderid, productid)
)



CREATE TABLE PRODUCT (
    productid NUMERIC(5) PRIMARY KEY,
    productdescription VARCHAR(30),
    productfinish VARCHAR(30),
    productstandardprice DECIMAL(10, 2) CONSTRAINT chk_in_price CHECK (productstandardprice >= 0.0),
    productlineid NUMERIC(5)
)

select * from PRODUCT

insert into PRODUCT VALUES(001, 'used to walk', 'shoes', 60.5, 100);
insert into PRODUCT VALUES(002, 'used to where', 't-shirt', 15, 100);

select * from ORDERS

insert into ORDERS VALUES (001, '2023-10-27')
insert into ORDERS VALUES (002, '2023-12-27')

select * from ORDERLINE

INSERT into ORDERLINE VALUES (001, 001, 10);
INSERT into ORDERLINE VALUES (001, 002, 20);

Update OrderLine set OrderedQuantity=-1;

DELETE FROM PRODUCT ;

ALTER TABLE Product
ADD ProductColor VARCHAR(10)

ALTER TABLE Product
DROP COLUMN ProductColor;

