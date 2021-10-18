Use restaurantdb


DELIMITER $$
CREATE PROCEDURE spGetEmployees()
BEGIN
    select * from Employee;
END $$    
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE OrderDetails()
BEGIN
    select * from Customer c  inner join Orders o on c.CustomerID = o.CustomerID;
END $$   
DELIMITER ;

DROP PROCEDURE IF EXISTS `restaurantdb`.`DeleteOrder`;
DELIMITER $$
CREATE PROCEDURE DeleteOrder(IN OrderIDParam INT)
BEGIN
   delete from payment where orderid = OrderIDParam;
   delete from ordermenuitem where orderid = OrderIDParam;
   delete from orders where orderid = OrderIDParam;
END $$   
DELIMITER ;

CALL DeleteOrder(5);

DROP PROCEDURE IF EXISTS  `restaurantdb`.`UpdateOrderPrice`;
DELIMITER $$
CREATE PROCEDURE UpdateOrderPrice(IN OrderIDParam INT, IN OrderPriceParam INT)
BEGIN
   
   update orders set totalamount = OrderPriceParam where orderid = OrderIDParam;
END $$   
DELIMITER ;

CALL UpdateOrderPrice(6, 55)