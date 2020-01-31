
USE master
GO
if exists (select * from sysdatabases where name='CroisiereEscoumins2020')
		drop database CroisiereEscoumins2020
GO

Create database CroisiereEscoumins2020
GO
use CroisiereEscoumins2020

GO

Create Table AccomodationRates
(
"AccomodationRateID" int IDENTITY (1, 1) NOT NULL,
"AccomodationRateName" varchar(20) not null,
"AccomodationSingle" decimal not null,
"AccomodationDouble" decimal not null,
"AccomodationTriple" decimal not null,
"AccomodationQuad" decimal not null,
"AccomodationRateStartDate" date DEFAULT GETDATE() not null,
"AccomodationRateEndDate" date DEFAULT GETDATE()+1 not null,
"AccomodationRateIsActive" BIT DEFAULT 1 NOT NULL
)

GO

Create Table Accomodations
(
"AccomodationID" int IDENTITY (1, 1) NOT NULL,
"FK_AccomodationTypeID" int NOT NULL,
"AccomodationName" varchar(20) not null,
"AccomodationDescription" text,
"AccomodationMaxOccupancy" tinyint DEFAULT 1 not null,
"AccomodationIsPublic" bit DEFAULT 0 not null,
"AccomodationPriority" tinyint DEFAULT 0 not null,
"AccomodationExtraCharge" decimal not null,
"AccomodationIsActive" BIT DEFAULT 1 NOT NULL
)
GO

Create Table AccomodationTypes
(
"AccomodationTypeID" int IDENTITY (1, 1) NOT NULL,
"AccomodationTypeName" varchar(30) not null,
"AccomodationTypeDescription" text,
"AccomodationTypeIsActive" BIT DEFAULT 1 NOT NULL
)
GO

Create Table BookingHistory
(
"BookingHistoryID" int IDENTITY (1, 1) NOT NULL,
"FK_UserID" int not null,
"FK_BookingID" int not null,
"BookingHistoryCreatedOn" datetime DEFAULT GETDATE() NOT NULL,
"BookingHistoryAction" varchar(12) NOT NULL
)
GO

Create Table Bookings
(
"BookingID" int IDENTITY (1, 1) NOT NULL,
"FK_UserID" int not null,
"FK_GuestID" int not null,
"FK_DepartureID" int,
"FK_AccomodationID" int,
"BookingDate" date DEFAULT GETDATE() NOT NULL,
"BookingCreatedOn" datetime DEFAULT GETDATE() NOT NULL,
"BookingVoucher" varchar(20),
"BookingStatus" varchar(20) NOT NULL,
"BookingAdultsCount" smallint DEFAULT 1 NOT NULL,
"BookingFreeAdultsCount" smallint DEFAULT 0 NOT NULL,
"BookingChildrenCount" smallint DEFAULT 0 NOT NULL,
"BookingFreeChildrenCount" smallint DEFAULT 0 NOT NULL,
"BookingStudentsCount" smallint DEFAULT 0 NOT NULL,
"BookingModified" BIT DEFAULT 0 NOT NULL,
"BookingIsActive" BIT DEFAULT 1 NOT NULL
)
GO

Create Table Departures
(
"DepartureID" int IDENTITY (1, 1) NOT NULL,
"FK_SeasonID" int,
"FK_ShipID" int,
"DepartureHour" varchar(5) DEFAULT '09:00' NOT NULL,
"DepartureDate" date  NOT NULL,
"DepartureMaxPassengers" smallint DEFAULT 0 NOT NULL,
"DepartureMaxAdults" smallint DEFAULT 0
)
GO


Create Table EmailTemplates
(
"EmailTemplateID" int IDENTITY (1, 1) NOT NULL,
"EmailTemplateName" varchar(40) not null,
"EmailTemplateText" text,
"EmailTemplateSubject" varchar(78),
"EmailTemplateLanguage" varchar(3) DEFAULT 'FRA' NOT NULL,
"EmailTemplateIsActive" BIT DEFAULT 1 NOT NULL
)
GO

Create Table Emails
(
"EmailID" int IDENTITY (1, 1) NOT NULL,
"FK_UserID" int not null,
"FK_GuestID" int,
"FK_BookingID" int,
"FK_EmailTemplateID" int DEFAULT 1 NOT NULL,
"EmailText" text,
"EmailSubject" varchar(78),
"EmailSent" BIT DEFAULT 0 NOT NULL,
"EmailSentOn" DATETIME,
"EmailTo" text,
"EmailFrom" varchar(320) DEFAULT 'info@croisierebaleine.ca'
)
GO


Create Table Guests
(
"GuestID" int IDENTITY (1, 1) NOT NULL,
"FK_SupplierID" int DEFAULT 1 not null,
"GuestFirstName" varchar(50) NOT NULL,
"GuestLastName" varchar(50) NOT NULL,
"GuestPhone" varchar(12),
"GuestEmail" varchar(320),
"GuestAddress" varchar(50),
"GuestCity" varchar(50),
"GuestCountry" varchar(20),
"GuestPostalCode" varchar(7),
"GuestDescription" text,
"GuestUserName" varchar(20),
"GuestPasswordHash" binary(64),
"GuestCreditCardHash" binary(64),
"GuestCCExpiry" varchar(5),
"GuestCVVHash" binary(64),
"GuestLanguage" varchar(3) DEFAULT 'FRA' NOT NULL,
"GuestOptIn" BIT DEFAULT 0 NOT NULL,
"GuestCreatedOn" DATETIME DEFAULT GETDATE() NOT NULL,
"GuestIsActive" BIT DEFAULT 1 NOT NULL,
)
GO

Create Table InvoicedBookings
(
"FK_InvoiceID" int not null,
"FK_BookingID" int NOT NULL,
"InvoicedAdultPrice" money,
"InvoicedFreeAdultPrice" money,
"InvoicedChildrenPrice" money,
"InvoicedFreeChildrenPrice" money,
"InvoicedStudentPrice" money,
"InvoicedAccomodationPrice" money
)
GO

Create Table InvoicedProducts
(
"FK_InvoiceID" int not null,
"FK_ProductID" int NOT NULL,
"InvoicedQuantity" money
)
GO

Create Table Invoices
(
"InvoiceID" int IDENTITY (1, 1) NOT NULL,
"FK_UserID" int not null,
"FK_GuestID" int NOT NULL,
"InvoiceDate" DATETIME DEFAULT GETDATE() NOT NULL,
"InvoiceStatus" varchar(20) DEFAULT 'À payer' NOT NULL,
"InvoiceDiscount" decimal DEFAULT 0 NOT NULL,
"InvoiceDiscountReason" varchar(140)
)
GO

Create Table Logbook
(
"FK_UserID" int not null,
"FK_DepartureID" int NOT NULL,
"LogBoatName" varchar(20) NOT NULL,
"LogAdultCount" smallint NOT NULL,
"LogChildrenCount" smallint NOT NULL,
"Weather" varchar(10) Not null,
"Wind" varchar(10) Not null,
"Waves" varchar(10) Not null,
"Whale" bit DEFAULT 0 Not null,
"Observations" text NOT NULL
)
GO

Create Table Payments
(
"PaymentID" int IDENTITY (1, 1) NOT NULL,
"FK_InvoiceID" int not null,
"PaymentMethod" varchar(12) Not NUll,
"PaymentTransactionNumber" varchar(32),
"PaymentDate" DATETIME DEFAULT GETDATE() NOT NULL
)
GO

Create Table Products
(
"ProductID" int IDENTITY (1, 1) NOT NULL,
"ProductName" varchar(24) not null,
"Productrice" decimal DEFAULT 0 Not NUll,
"ProductIsPublic" bit DEFAULT 0 not null,
"ProductPriority" tinyint DEFAULT 0 not null,
"ProductDescription" text,
"ProductIsActive" BIT DEFAULT 1 NOT NULL
)
GO

Create Table Seasons
(
"SeasonID" int IDENTITY (1, 1) NOT NULL,
"SeasonName" varchar(20) not null,
"SeasonStartDate" Date DEFAULT GETDATE() NOT NULL,
"SeasonEndDate" Date DEFAULT GETDATE()+1 NOT NULL,
"SeasonIsActive" BIT DEFAULT 1 NOT NULL
)
GO

Create Table ShipDesigns
(
"ShipDesignID" int IDENTITY (1, 1) NOT NULL,
"ShipDesignName" varchar(20) not null,
"ShipDesignDescription" text,
"ShipDesignIsActive" BIT DEFAULT 1 NOT NULL
)
GO

Create Table ShipRates
(
"ShipRateID" int IDENTITY (1, 1) NOT NULL,
"ShipRateName" varchar(20) not null,
"ShipRateAdult" decimal not null,
"ShipRateFreeAdult" decimal not null,
"ShipRateChildren" decimal not null,
"ShipRateFreeChildren" decimal not null,
"ShipRateStudent" decimal not null,
"ShipRateStartDate" date DEFAULT GETDATE() not null,
"ShipRateEndDate" date DEFAULT GETDATE()+1 not null,
"ShipRateIsActive" BIT DEFAULT 1 NOT NULL
)

GO

Create Table Ships
(
"ShipID" int IDENTITY (1, 1) NOT NULL,
"FK_ShipDesignID" int NOT NULL,
"ShipName" varchar(20) not null,
"ShipDescription" text,
"ShipMaxPassengers" tinyint DEFAULT 36 not null,
"ShipIsPublic" bit DEFAULT 0 not null,
"ShipPriority" tinyint DEFAULT 0 not null,
"ShipIsActive" BIT DEFAULT 1 NOT NULL
)
GO

Create Table SupplierRates
(
"FK_SupplierID" int not null,
"FK_ShipRateID" int NOT NULL,
"FK_AccomodationRateID" int NOT NULL,
"SupplierRateName" varchar(30) NOT NULL,
"SuplierRateIsActive" BIT DEFAULT 1 NOT NULL
)
GO

Create Table Suppliers
(
"SupplierID" int IDENTITY (1, 1) NOT NULL,
"CompanyName" varchar(50) not null,
"SupplierContactFirstName" varchar(50),
"SupplierContactLastName" varchar(50),
"SupplierContactPhone" varchar(12),
"SupplierSecondaryPhone" varchar(12),
"SupplierExtension" varchar(6),
"SupplierEmail" varchar(320),
"SupplierAddress" varchar(50),
"SupplierCity" varchar(50),
"SupplierCountry" varchar(20),
"SupplierPostalCode" varchar(7),
"SupplierDescription" text,
"SupplierIsActive" BIT DEFAULT 1 NOT NULL,
)
GO

Create Table Users
(
"UserID" int IDENTITY (1, 1) NOT NULL,
"UserName" varchar(20),
"UserPasswordHash" binary(64),
"UserEmail" varchar(320),
"UserFirstName" varchar(50),
"UserLastName" varchar(50),
"UserAddress" varchar(50),
"UserCity" varchar(50),
"UserCountry" varchar(20),
"UserPostalCode" varchar(7),
"UserPhone" varchar(12),
"UserDescription" text,
"UserRole" varchar(12) NOT NULL,
"UserCreatedOn" DATETIME DEFAULT GETDATE() NOT NULL,
"UserIsActive" BIT DEFAULT 1 NOT NULL,
)
GO

insert "Suppliers"("CompanyName") values('Client Régulier')

insert into ShipDesigns(ShipDesignName, ShipDesignDescription) values ('Zodiac', 'Bateau de croisière de type Zodiac')

insert into Ships(FK_ShipDesignID, ShipName, ShipDescription, ShipMaxPassengers) values(1,'Croisière Regulière', 'Croisière pour tous et toutes', 40)

insert into Ships(FK_ShipDesignID, ShipName, ShipDescription, ShipMaxPassengers) values(1,'Croisière VIP', 'Croisière plus intimes pour petits groupes', 12)

Insert into Seasons(SeasonName, SeasonStartDate, SeasonEndDate, SeasonIsActive) values('Printemps 2020', '2020-05-20', '2020-07-01', 1)

Insert into Departures(FK_SeasonID, FK_ShipID, DepartureHour, DepartureDate, DepartureMaxPassengers, DepartureMaxAdults)
values(1,1, '10h00', '2020-05-20', 40,30 )

Insert into Departures(FK_SeasonID, FK_ShipID, DepartureHour, DepartureDate, DepartureMaxPassengers, DepartureMaxAdults)
values(1,2, '10h00', '2020-01-29', 40,30 )

Insert into Departures(FK_SeasonID, FK_ShipID, DepartureHour, DepartureDate, DepartureMaxPassengers, DepartureMaxAdults)
values(1,1, '10h00', '2020-01-29', 40,30 )

Insert into Guests(GuestFirstName, GuestLastName, GuestLanguage)
values('Jean','Passant', 'FRA' )


Insert into Users(UserName, UserFirstName, UserLastName, UserRole)
values('BigJohn','John', 'Doe', 'Admin')




Insert into Bookings(FK_UserID, FK_GuestID, FK_DepartureID, FK_AccomodationID, BookingDate, BookingCreatedOn, Bookingstatus, BookingAdultsCount, BookingFreeAdultsCount, BookingChildrenCount, BookingFreeChildrenCount, BookingStudentsCount)
values(1,1, '10h00', '2020-05-20', 40,30 )
