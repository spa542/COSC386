/* 
 * Ryan Rosiak
 * COSC 386-750 Exam 1 Part B Answers
 * 3/14/21
 */

/* Table Creation */
CREATE TABLE Product(maker CHAR, model INT, type VARCHAR(10), PRIMARY KEY(model));
CREATE TABLE PC(model INT, speed FLOAT, ram INT, hd INT, price INT, PRIMARY KEY(model));
CREATE TABLE Laptop(model INT, speed FLOAT, ram INT, hd INT, screen FLOAT, price INT, PRIMARY KEY(model));
CREATE TABLE Printer(model INT, color BOOLEAN, type VARCHAR(10), price INT, PRIMARY KEY(model));

/* Insert data next... 
 * Sample:
 * INSERT INTO tableName VALUES(.......);
 */

/* 1 */
SELECT maker, speed FROM Product JOIN Laptop ON Product.model = Laptop.model WHERE hd >= 30;
/* Results: 
+-------+-------+
| maker | speed |
+-------+-------+
| E     |     2 |
| E     |  1.73 |
| E     |   1.8 |
| A     |     2 |
| A     |  2.16 |
| A     |     2 |
| B     |  1.83 |
| F     |   1.6 |
| F     |   1.6 |
| G     |     2 |
+-------+-------+
*/


/* 2 */
(SELECT Product.model, price FROM Product JOIN PC ON Product.model = PC.model WHERE maker = "B") UNION (SELECT Product.model, price FROM Product JOIN Laptop ON Product.model = Laptop.model WHERE maker = "B") UNION (SELECT Product.model, price FROM Product JOIN Printer ON Product.model = Printer.model WHERE maker = "B");
/* Results: 
+-------+-------+
| model | price |
+-------+-------+
|  1004 |   649 |
|  1005 |   630 |
|  1006 |  1049 |
|  2007 |  1429 |
+-------+-------+
*/

/* 3 */
SELECT hd FROM PC GROUP BY hd HAVING COUNT(hd) > 1;
/* Results: 
+------+
| hd   |
+------+
|   80 |
|  160 |
|  250 |
+------+
*/

/* 4 */
SELECT p1.model, p2.model FROM PC p1, PC p2 WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model;
/* Results: 
+-------+-------+
| model | model |
+-------+-------+
|  1012 |  1004 |
+-------+-------+
*/

/* 5 */
SELECT Product.maker FROM Product LEFT JOIN PC ON Product.model = PC.model LEFT JOIN Laptop ON Product.model = Laptop.model WHERE PC.speed > 3.0 OR Laptop.speed > 3.0 GROUP BY Product.maker HAVING COUNT(*) >= 2;
/* Results: 
+-------+
| maker |
+-------+
| B     |
+-------+
*/
