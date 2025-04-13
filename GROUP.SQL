USE bookstore;
CREATE TABLE customeradress(customerid INT UNSIGNED NOT NULL,
adressid INT UNSIGNED NOT NULL,
adressstatusid TINYINT UNSIGNED NOT NULL,
PRIMARY KEY(customerid,adressid),
FOREIGN KEY(customerid)
REFERENCES customer(customerid),
FOREIGN KEY(adressid)
REFERENCES adress(adressid),
FOREIGN KEY(adressstatusid)
REFERENCES adressstatus(adressstatusid));

CREATE TABLE custorder(orderid INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
customerid INT UNSIGNED NOT NULL,
orderdate DATETIME NOT NULL DEFAULT current_timestamp,
shippingmethodid TINYINT UNSIGNED,
ordestatusid TINYINT UNSIGNED,
totalamount DECIMAL(10.2) NOT NULL DEFAULT 0.00,
FOREIGN KEY (customerid)
REFERENCES customer(customerid),
FOREIGN KEY (shippingmethodid)
REFERENCES shippingmethod(shoppingmethodid),
FOREIGN KEY (orderstatusid)
REFERENCES orderstatus(orderstatusid));

--
CREATE TABLE  orders(orderid INT PRIMARY KEY,
ordersstatus INT,
CONSTRAINT fkstatus FOREIGN KEY (orderstatus) REFERENCES status(statusid));


CREATE ROLE bookstoreadmin;
CREATE ROLE bookstorereadwrite;
CREATE ROLE bookstorereadonly;

GRANT ALL PRIVILEGES ON bookstore  TO bookstoreadmin;
GRANT SELECT,INSERT,UPDATE,DELETE ON bookstore TO bookstorereadwrite;
GRANT SELECT ON bookstore TO bookstorereadonly;

CREATE TABLE bookstore(bookid INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
author VARCHAR(255),
publisher VARCHAR(255) NOT NULL,
publicationdate DATE NOT NULL,
genre VARCHAR(255),
price DECIMAL(10.2) NOT NULL);

CREATE USER "johnadmin" IDENTIFIED BY "1234";
CREATE USER "fabian" IDENTIFIED BY "1234";
CREATE USER "jepther" IDENTIFIED BY "1234";

GRANT bookstoreadmin TO "johnadmin";
GRANT bookstorereadwrite TO "fabian";
GRANT bookstorereadonly TO "jepther";

SET DEFAULT ROLE bookstoreadmin TO "johnadmin";
SET DEFAULT ROLE bookstorereadwrite TO "fabian";
SET DEFAULT ROLE bookstorereadonly TO "jepther";
