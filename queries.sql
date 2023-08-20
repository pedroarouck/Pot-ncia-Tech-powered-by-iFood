use workshop;

-- Insercao de clientes
insert into clients (Fname,Mname,Lname,CPF,Address,CEP,UF,TelNumber,CelNumber)
	values ('Maria','Das Dores','Silva','78236778290','Rua Dr. José Bonifácio, 9030','67283988','RS','8233876492',null),
    ('Moacir','Soares','Costa','78236778243','Rua Manoel da Silva Lemos, 302', '78654333','MA',null,89987675530),
    ('Luzia','Miranda','De Souza','98276589732','Av. Joaquim Barros Rocha, 902','78900877','RN',null,87987654099);

-- insercao de veiculos
insert into vehicles (RegPlate, idClient, Manufacturer, Model, VehicleYear)
	values ('LLO9022',1,'Volkswagen','SUVW',2022),
		   ('AI97UF1',1,'Volkswagen','Sedan',2020),
           ('FGU9811',2,'Mercedes','C43',2020),
           ('AGU8911',3,'BMW','X1',2022);
           
-- registro de manutencao
insert into maintenance (idVehicle,serviceDescription,entryDate,expectedDate,releaseDate,budget)
	values ('LLO9022','Motor. Freio.','2023-02-10','2023-02-20','2023-03-03',3950.00),
    ('LLO9022','Freio','2023-05-16','2023-05-20','2023-05-18',680.00),
    ('FGU9811','Para-brisa','2021-04-25','2021-05-02','2021-04-30',1200.00),
    ('AI97UF1','Suspensão','2022-12-02','2023-01-12','2022-12-20', 1340.00),
    ('AGU8911','Eixo','2022-10-11','2022-11-18','2022-11-20',928.00)
    ;

-- registro de mecanicos
insert into mechanician (Fname,Mname,Lname,CPF,Address,CEP,UF,TelNumber,CelNumber)
	values ('Antonio','José','Mendes','05892322230','Rua Tal, 1010','32449877','SP',1133245688,null),
    ('Francisco','Ananias','Farias','05892352230','Rua Tal, 1012','32449877','SP',1133240612,null),
    ('Aloisio','Almeida','Rocha','90928388920','Av qualquer, 2130','32449877','SP',1133245609,null);
    

-- registro de manutenções realizadas por mecanico
insert into maintenance_mechanician (idMaintenance,idMechanician,workload)
	values (1,2,12),(1,3,6),(2,1,18),(3,3,9),(4,1,22),(4,2,13),(4,3,5),(5,1,10),(5,3,4);
    
-- queries 
-- Historico de manutenções por cliente
select concat(Fname,' ', Lname) as ClientName, RegPlate, Manufacturer, Model, budget from clients c
	inner join vehicles v on c.idClient=v.idClient
	inner join maintenance m on idVehicle=RegPlate
    order by ClientName;
    
-- Numero de manutenções realizadas em cada veiculo e o total gasto
select concat(Fname,' ', Lname) as ClientName, RegPlate, Manufacturer, Model, count(*) as NumMaintenances,
    sum(budget) as TotalSpent from clients c
	inner join vehicles v on c.idClient=v.idClient
	inner join maintenance m on idVehicle=RegPlate
    group by RegPlate
    order by ClientName;