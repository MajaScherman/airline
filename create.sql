if not exists (select * from sysobjects where name='routes' and xtype='U')
	CREATE TABLE routes (
	  flightnbr varchar(5) PRIMARY KEY, 
	  departure varchar(100) NOT NULL,
	  destination varchar(100) NOT NULL,
	  departuretime varchar(100) NOT NULL,
	  arrivaltime varchar(100) NOT NULL
	);
go



if not exists (select * from sysobjects where name='prices' and xtype='U')
	  CREATE TABLE prices (
	  repayableprice int NOT NULL,
	  rebookableprice int NOT NULL,
	  redprice int NOT NULL,
	  flightnbr varchar(5) primary key references routes(flightnbr)
	);
go

if not exists (select * from sysobjects where name='airplanes' and xtype='U')
	CREATE TABLE airplanes (
		name varchar(100) PRIMARY KEY,
		model varchar(100) NOT NULL,
		seats int NOT NULL
	);
go


if not exists (select * from sysobjects where name='employees' and xtype='U')
	CREATE TABLE employees (
	  name varchar(100) NOT NULL,
	  id varchar(2) PRIMARY KEY
	  
	);
go

if not exists (select * from sysobjects where name='stewardesses' and xtype='U')
	CREATE TABLE stewardesses (
	  employeenbr varchar(2) PRIMARY KEY REFERENCES employees(id),
	  hours_ int NOT NULL
	);
go

if not exists (select * from sysobjects where name='pilots' and xtype='U')
	CREATE TABLE pilots (
	  employeenbr varchar(2) PRIMARY KEY REFERENCES employees(id),
	  hours_ int NOT NULL
	  
	);
go
if not exists (select * from sysobjects where name='flights' and xtype='U')
	CREATE TABLE flights (
	  flightnbr varchar(5) NOT NULL,
	  date_ varchar(100) NOT NULL,
	  stw1 varchar(2) not null foreign key references stewardesses(employeenbr),
	  stw2 varchar(2) not null foreign key references stewardesses(employeenbr),
	  stw3 varchar(2) null foreign key references stewardesses(employeenbr),
	  stw4 varchar(2) null foreign key references stewardesses(employeenbr),
	  pilot1 varchar(2) not null foreign key references pilots(employeenbr),
	  pilot2 varchar(2) not null foreign key references pilots(employeenbr),
	  airplane varchar(100) not null foreign key references airplanes(name),
	  CONSTRAINT flight PRIMARY KEY (flightnbr,date_),
	  constraint flightnbr foreign key (flightnbr) references routes
	  
	);
go




if not exists (select * from sysobjects where name='tickets' and xtype='U')
	CREATE TABLE tickets (
	  ticketnbr int PRIMARY KEY,
	  price varchar(100) NOT NULL,
	  supervision varchar(100) NOT NULL,
	  flightnbr varchar(5) not null,
	  date_ varchar(100) not null,
	  seatnbr int not null,
	  CONSTRAINT flight_fk FOREIGN KEY (flightnbr,date_) REFERENCES flights(flightnbr,date_)
	);
go
if not exists (select * from sysobjects where name='passengers' and xtype='U')
	CREATE TABLE passengers (
	  name varchar(100) PRIMARY KEY,
	  type_ varchar(100) not null,
	  ticket int foreign key references tickets(ticketnbr)
	);
go

if not exists (select * from sysobjects where name='competency' and xtype='U')
	CREATE TABLE competency (
	  id varchar(2) not null foreign key references employees(id),
	  plane varchar(100) not null,
	  constraint comp primary key (id,plane)
	);
go

