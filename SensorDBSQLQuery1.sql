If Not Exists(Select * From sys.databases Where name = 'sensorDB')
create database sensorDB
go 
use sensorDB
go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'sensors')

Create Table sensors
	(
		sensorID Int Identity Primary Key ,
		sansorName Varchar(50) Unique,
		definition varchar(max) not null,
	);
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'DataType')

Create table  DataType
(
DataTypeID int identity primary key,
DataType varchar(15) not null,

);
go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'MeasurementTypes')

Create Table MeasurementTypes
	(
		MEasurementTypeID Int Identity Primary Key,
		MeasurementTypeName Varchar(50) Unique,
		Abbreviation varchar(50) not null,
		DataTypeID int ,
				Constraint FK_MeasurementTypes_DataTypeID Foreign Key(DataTypeID) References DataType(DataTypeID),

	);
go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'SensorDefinitions')

Create Table SensorDefinitions 
     (
	     SensorDefinitionsID int Identity primary key,
		 sensorID int not null,
		 MEasurementTypeID int not null,
		 DataTypeID int ,
		 Constraint FK_SensorDefinitions_DataTypeID Foreign Key(DataTypeID) References DataType(DataTypeID),
		 Constraint FK_SensorDefinitions_MEasurementTypeID Foreign Key(MEasurementTypeID) References MeasurementTypes(MEasurementTypeID),

     )
go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Coordinators')

Create Table Coordinators 
(
         CoordinatorID int identity primary key,
		 Name varchar(50) not null,
		 description varchar(max) not null,
		 country varchar(50) not null,
		 city varchar(50) not null,
		 county varchar(50) not null,
		 district varchar(50) not null,
		 latitude decimal not null,
		 longtitude decimal not null,

)
go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Router')

Create Table Router 
     (
	     RouterID int Identity primary key,
		 RouterName varchar (50) not null,
		 Description varchar(max) not null,
		 Country varchar(50) not null,
		 City  varchar(50) not null,
		 County  varchar(50) not null,
		 District   varchar(50) not null,
		 latitude decimal not null,
		 longtitude decimal not null,
		 CoordinatorID int ,
		 sensorID int,
		 		 Constraint FK_Router_CoordinatorID Foreign Key(CoordinatorID) References Coordinators(CoordinatorID),
				 Constraint FK_Router_sensorID Foreign Key(sensorID) References sensors(sensorID),
     )
	 go
 If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'SensorMeasurements')

Create Table SensorMeasurements 
(
        SensorMeasurementID int identity primary key,
        sensorID int not null,
        RouterID int not null,
        MEasurementTypeID int not null,
        MeasurementValue decimal not null,
        MeasurementDateTime datetime Default Getdate() Not Null,
		       Constraint FK_SensorMeasurements_sensorID Foreign Key(sensorID) References sensors(sensorID),
		       Constraint FK_SensorMeasurements_RouterID Foreign Key(RouterID) References Router(RouterID),
		       Constraint FK_SensorMeasurements_MEasurementTypeID Foreign Key(MEasurementTypeID) References MeasurementTypes(MEasurementTypeID),



);
go
 If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Domain')

Create Table Domain
	(
		DomainID Int Identity Primary Key ,
		DomainName Varchar(50) Unique,
		
	);
go
 If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Status')

Create Table Status
	(
		StatusID Int Identity Primary Key ,
		StatusName Varchar(50) Unique,
		
	);
go
 If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'WirelessSensorNetworks')

Create Table WirelessSensorNetworks  
     (
	     WirelessSensorNetworkID int Identity primary key,
		 Description varchar (max) not null,
		 DomainID int,
		 StatusID int,
		 CreatedDateTime DATETIME NOT NULL,
		 CoordinatorID INT NOT NULL,
		 		       Constraint FK_WirelessSensorNetworks_DomainID Foreign Key(DomainID) References Domain(DomainID),
					   Constraint FK_WirelessSensorNetworks_StatusID Foreign Key(StatusID) References Status(StatusID),
				       Constraint FK_WirelessSensorNetworks_CoordinatorID Foreign Key(CoordinatorID) References Coordinators(CoordinatorID),



);
