
-- task1 --                  summarize data
create or replace view OrdersView as select Orders.OrderID , Orders.Quantity, Orders.TotalCost from Orders join Bookings on Orders.BookingID = Bookings.BookingID where Orders.Quantity >0 and Bookings.TableNo = 1;
select * from OrdersView;

-- task2 --
create or replace view info as select Customers.CustomerID,CONCAT(Customers.FirstName,Customers.LastName) as FullName,Orders.OrderID,Orders.TotalCost,Menu.Name as MenuName,menuitems.Name from customers join bookings on customers.customerid = bookings.customerid join orders on bookings.bookingid= orders.bookingid join menu on menu.menuid = orders.MenuID join menuitems on menu.itemid = menuitems.ItemID order by Orders.TotalCost asc;
select * from info;

-- task3 --
select menu.name from menu where menu.menuid = any (select menuid from orders group by menuid having count(menuid)>1);


-- task 1 --                optimized queries
delimiter $
create procedure GetMaxQuantity() begin select max(quantity) from orders; END $
delimiter ;

call GetMaxQuantity();

-- task 2 prepared statement
prepare GetOrderDetail from 'select orderid, quantity, totalcost from orders where customerid = ?';
set @a = 3;
execute GetOrderDetail using @a;

-- task 3 CancelOrder
Delimiter $
create procedure CancelOrder(in whichorder int) begin delete from orders where orderid = whichorder; end $
delimiter ;

select orderid from orders;
call CancelOrder(2);
select orderid from orders;