-- task1
delimiter $
create procedure AddBooking(in BID int, in CID int, in tbno int, in slotp date)
begin
insert into bookings(bookingid,customerid,tableno,slot) values(bid,cid,tbno,slotp);
select concat('table ',tbno,' booked for ',slot);
end$
delimiter ;

call addbooking(212,1,1,'2099-12-12');
select * from bookings;

-- task2
delimiter $
create procedure UpdateBooking(in bookid int,in slotp date)
begin
update bookings set slot=slotp where bookingid=bookid;
end $
delimiter ;

select * from bookings;
call updatebooking(1,'1991-01-05');
select * from bookings;

-- task3
delimiter $
create procedure CancelBooking(in bookid int)
begin
delete from bookings where bookingid=bookid;
select concat('booking with ID: ',bookid,' has been cancelled');
end $
delimiter ;

call cancelbooking(212);
select * from bookings;