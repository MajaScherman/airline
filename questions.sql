
select flightnbr, date_, count(ticketnbr) as 'Childeren traveling by themselves' 
from tickets 
where ticketnbr in (select ticket from passengers where type_ = 'Child') 
and flightnbr = 'BA801' 
and supervision = 'Yes' 
group by flightnbr,date_

select flightnbr,date_, 'pilot1' as position, pilot1 as Id , name
from flights,employees where flightnbr='VR111'and employees.id=pilot1
union all
select flightnbr,date_,  'pilot2', pilot2,name 
from flights,employees where flightnbr='VR111' and employees.id=pilot2
union all
select flightnbr, date_, 'stw1', stw1 , name
from flights, employees where flightnbr='VR111' and employees.id=stw1
union all
select flightnbr, date_, 'stw2', stw2 ,name
from flights,employees where flightnbr='VR111' and employees.id=stw2
union all
select flightnbr, date_, 'stw3', stw3 ,name
from flights, employees where flightnbr='VR111' and employees.id=stw3
union all
select flightnbr, date_, 'stw4', stw4, name
from flights,employees where flightnbr='VR111' and employees.id=stw4


select name,plane from competency,employees where competency.id='G1' and employees.id='G1'

select flights.flightnbr, flights.date_, 
routes.departure,routes.destination, (max(airplanes.seats) - count(tickets.flightnbr)) as 'Availible seats' 
from tickets,airplanes , flights,routes where flights.flightnbr in 
(select flightnbr from routes 
where departure ='Paris' and destination='London')
and flights.flightnbr=routes.flightnbr
and flights.flightnbr=tickets.flightnbr
and flights.airplane=airplanes.name
and flights.date_=tickets.date_
group by flights.flightnbr,flights.date_,routes.departure,routes.destination

select flightnbr,date_,name from tickets,passengers
 where tickets.ticketnbr = 
(select passengers.ticket from passengers where name = 'Martii Turunen')
and name='Martii Turunen'


select name, max(hours_) as 'Worked hours' from stewardesses,employees where id in 
(select employeenbr from stewardesses where hours_ = 
(select max(hours_) from stewardesses))
group by name
union
select name, max(hours_) from pilots,employees where id in
(select employeenbr from pilots where hours_ = 
(select max(hours_) from pilots))
group by name



select flightnbr, date_, count(ticketnbr) as 'Supervision' 
from tickets where flightnbr = 'BA801' 
and supervision = 'Yes' 
group by flightnbr,date_


select name, flightnbr,date_, 'P1' as Funktion from flights,employees
 where pilot1 = (select id 
from employees where name='Gork Getaway')
and flights.pilot1=employees.id


select tickets.date_, tickets.flightnbr, prices.rebookableprice + (select prices.rebookableprice from tickets,prices where tickets.flightnbr = 'SK405' 
and prices.flightnbr = 'SK405' and tickets.ticketnbr = 4) + (select prices.repayableprice from tickets,prices where tickets.flightnbr = 'SK405' 
and prices.flightnbr = 'SK405' and tickets.ticketnbr = 10) as income from tickets,prices where tickets.flightnbr = 'SK405' 
and prices.flightnbr = 'SK405' and tickets.ticketnbr = 3
go


select flightnbr,date_, 'pilot1' as position, pilot1 as Id , name
from flights,employees where flightnbr='VR111'and employees.id=pilot1
union all
select flightnbr,date_,  'pilot2', pilot2,name 
from flights,employees where flightnbr='VR111' and employees.id=pilot2
union all
select flightnbr, date_, 'stw1', stw1 , name
from flights, employees where flightnbr='VR111' and employees.id=stw1
union all
select flightnbr, date_, 'stw2', stw2 ,name
from flights,employees where flightnbr='VR111' and employees.id=stw2
union all
select flightnbr, date_, 'stw3', stw3 ,name
from flights, employees where flightnbr='VR111' and employees.id=stw3
union all
select flightnbr, date_, 'stw4', stw4, name
from flights,employees where flightnbr='VR111' and employees.id=stw4


IF OBJECT_ID ('income1', 'V') IS NOT NULL
drop view income1
go
create view income1 as
select tickets.ticketnbr, tickets.flightnbr, date_, tickets.price as pricetype, 
redprice as price from tickets,prices 
where tickets.price='redprice' and tickets.flightnbr=prices.flightnbr
union
select tickets.ticketnbr, tickets.flightnbr, date_, tickets.price as pricetype, 
rebookableprice as price from tickets,prices 
where tickets.price='rebookableprice' and tickets.flightnbr=prices.flightnbr
union
select tickets.ticketnbr, tickets.flightnbr, date_, tickets.price as pricetype, 
repayableprice as price from tickets,prices 
where tickets.price='repayableprice' and tickets.flightnbr=prices.flightnbr
go

IF OBJECT_ID ('income', 'V') IS NOT NULL
drop view income
go
create view income
as
select flightnbr,date_,sum(price) as income from income1
group by flightnbr,date_
go

select * from income where flightnbr='SK405'

select * from income


select tickets.flightnbr,date_, departure, destination, 5 - count(*) as 
'Availible seats with supervision' from tickets,routes 
where tickets.flightnbr in 
(select flightnbr from routes 
where departure = 'Paris' and destination = 'London') 
and date_='2013-08-01'
and supervision = 'Yes'
and tickets.flightnbr=routes.flightnbr
group by tickets.flightnbr,date_,departure,destination
union
select tickets.flightnbr,date_,departure, destination, 5  
from tickets,routes where tickets.flightnbr in 
(select flightnbr from routes 
where departure = 'Paris' and destination = 'London') 
and date_='2013-08-01'
and supervision = 'No'
and tickets.flightnbr=routes.flightnbr
group by tickets.flightnbr,date_,departure,destination



