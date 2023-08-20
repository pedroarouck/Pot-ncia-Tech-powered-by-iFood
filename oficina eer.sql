-- criacao de banco de dados para o cenario de oficina mecanica
create database workshop;
use workshop;

create table clients(
	idClient int auto_increment primary key,
    Fname varchar(15) not null,
    Mname varchar(15),
    Lname varchar(15),
    CPF char(11) not null,
    Address varchar(60) not null,
    CEP char(8) not null,
    UF char(2),
    TelNumber varchar (11),
    CelNumber varchar(11),
    constraint unique_cpf_client unique(CPF)
);
alter table clients auto_increment=1;

create table vehicles(
	RegPlate char(7) primary key,
    idClient int,
    Manufacturer varchar(10) not null,
    Model varchar(10) not null,
    VehicleYear int,
    constraint fk_client_id foreign key (idClient) references clients(idClient)
);

create table maintenance(
	idMaintenance int auto_increment primary key,
    idVehicle char(7),
    serviceDescription text(50),
    entryDate date not null,
    expectedDate date,
    releaseDate date,
    budget float(2),
    constraint fk_vehicle_id foreign key (idVehicle) references vehicles(RegPlate)
);

alter table maintenance auto_increment=1;

create table mechanician(
	idMechanician int auto_increment primary key,
    Fname varchar(15) not null,
    Mname varchar(15),
    Lname varchar(15),
    CPF char(11) not null,
    Address varchar(60),
    CEP char(8),
    UF char(2),
    TelNumber varchar(11),
    CelNumber varchar(11),
    constraint unique_cpf_mechanician unique(CPF)
);

alter table mechanician auto_increment=1;

create table maintenance_mechanician(
	idMaintenance int,
    idMechanician int,
    workload float(2) default 0,
    constraint fk_idMaintenance foreign key (idMaintenance) references maintenance(idMaintenance),
    constraint fk_idMechanician foreign key (idMechanician) references mechanician(idMechanician),
    constraint pk_mechanician_service primary key (idMaintenance, idMechanician)
);