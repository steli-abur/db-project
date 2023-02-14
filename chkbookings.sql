-- task 1
replace into bookings(bookingid,customerid,tableno,slot) values(1,1,5,'2022-10-10'),(2,3,3,'2022-11-12'),(3,2,2,'2022-10-11'),(4,1,2,'2022-10-13');

-- task 2
delimiter $
create procedure CheckBooking(in bdate date, in tbno int) begin select case when (select bookingid from bookings where tableno=tbno and slot = bdate) = null then concat('table ',tbno,' is available') else concat('table ',tbno,' is unavailable') end as status; end $
delimiter ;

call checkbooking('2022-10-10',5);

-- task 3

delimiter $
create procedure AddValidBooking(in bdate date, in tbno int,in CID int,in BID int) 
BEGIN
START TRANSACTION;
insert into bookings(bookingid, customerid, tableno, slot) values(bid, cid, tbno, bdate);
if (select count(bookingid) from bookings where tableno = tbno and slot = bdate) > 1 then
	select concat('table ',tbno,' is occupied in that interval ',' -- booking cancelled') as bookingstatus;
	rollback;
else
	select concat('table ',tbno,' booked for ',bdate) as bookingstatus;
    commit;
end if;
END$
delimiter ;

drop procedure AddValidBooking;

CALL addvalidbooking('2022-10-10',2,3,16);
select * from bookings;