select * from customers;

insert into customers values(1,'Taylor', 'Smith', 09564321),
(2,'Mary', 'Adam', 04456328),
(3,'Chris', 'Johnson', 04456789),
(4,'Julia', 'Holmes', 08876541),
(5,'Stan', 'Morgan', 09987654),
(6,'Nelly', 'Broms', 055664432),
(7,'Moses', 'Sajid', 05678433),
(8,'Wilson', 'Nakamura', 09876548);

insert into bookings(BookingID,CustomerID,tableno,Slot) VALUES(1, 4, 2, '2022-10-23 10:23'),
(2, 2, 1, '2022-09-13 18:25'),
(3, 4, 5, '2022-08-15 20:20'),
(4, 6, 3, '2022-10-23 15:23'),
(5, 1, 4, '2022-05-17 12:23'),
(6, 3, 6, '2022-12-01 11:23'),
(7, 7, 2, '2022-11-30 15:30'),
(8, 8, 1, '2022-06-21 14:23'),
(9, 4, 2, '2022-07-22 10:23'),
(10, 5, 3, '2022-10-23 18:40'),
(11, 4, 1, '2022-12-12 13:55'),
(12, 7, 3, '2022-06-07 10:23');

select * from bookings;
insert into menuitems values (1, 22, 'cesars', 'salad'),
(2, 55, 'greek', 'salad'),
(3, 52, 'beefsteak', 'maincourse'),
(4, 43, 'fried_chicken', 'maincourse'),
(5, 15, 'risoto', 'side_dish'),
(6, 26, 'mushrooms', 'side_dish'),
(7, 30, 'porksteak', 'maincourse'),
(8, 32, 'meatballs', 'maincourse'),
(9, 29, 'cake', 'desert'),
(10, 17, 'icecream', 'desert');
insert into menu values (1, 'classic', 'maincourse', 3),
(2, 'classic', 'maincourse', 4),
(3, 'mediteranian', 'side_dish', 5),
(4, 'classic', 'side_dish', 6),
(5, 'classic', 'maincourse', 7),
(6, 'classic', 'maincourse', 8),
(7, 'mediteranian', 'desert', 10),
(8, 'mediteranian', 'salad', 2),
(9, 'french', 'salad', 1),
(10, 'classic', 'desert', 9),
(11, 'classic', 'maincourse', 3),
(12, 'classic', 'maincourse', 4);

SELECT * from employees;
insert into orderdelivery values (1, 'cooking', '2022-09-13 19:05', 1),
(2, 'cooking', '2022-09-13 19:05', 2),
(3, 'delivered', '2022-09-13 19:05', 3), 
(4, 'delivered', '2022-09-13 19:05', 4),
(5, 'in_progress', '2022-09-13 19:05', 5),
(6, 'in_progress', '2022-09-13 19:05', 6);


INSERT into employees values (1, 'Donald', 'chef', 4000.00),
(2, 'Mark', 'chef', 3500.00),
(3, 'John', 'waiter', 20000.00),
(4, 'iusuf', 'waiter', 2000.00),
(5, 'aAli', 'driver', 1800.00),
(6, 'Tim', 'driver', 1800.00);
select * from employees;
insert into orders values (1, 2, 104.00, 1, 1, 1,4),
(2, 2, 104.00, 2, 1, 2,2),
(3, 2, 34.00, 3, 7, 2,4),
(4, 1, 32.00, 4, 6, 3,6),
(5, 4, 172.00, 5, 2, 4, 1),
(6, 1, 55.00, 6, 8, 5, 3),
(7, 2, 44.00, 7, 9, 6, 7),
(8, 3, 45.00, 8, 3, 1, 8),
(9, 2, 30.00, 1, 1, 6, 4),
(10, 1, 52.00, 1, 11, 5, 5),
(11, 2, 86.00, 1, 12, 3, 4),
(12, 2, 30.00, 1, 3, 2, 7);