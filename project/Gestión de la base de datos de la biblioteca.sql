if DB_ID('LaLibreriaLRI') is null
use LaLibreriaLRI

--Richard Vicente -20-SIIM-1-1069--Trabajo final de BD.

BEGIN
DROP DATABASE LaLibreriaLRI;
END

create database LaLibreriaLRI;

--Tablas

create table LibraryLRI (
Ubicacion varchar (20),
Sector varchar (20),
Direccion varchar (20),
Telefono varchar (10),
Correo varchar (20),
Horario varchar (20),
D_laborable varchar (20),
);

CREATE TABLE empleado (
empleadoID varchar(6),
Enombre VARCHAR(40),
Eapellido VARCHAR(40),
Edireccion VARCHAR(50),
Telefono varchar(10),
usuario VARCHAR(10),
Contraseña VARCHAR(20),
correo varchar(8),
  CONSTRAINT empleado_PK PRIMARY KEY (empleadoID)
);

create table lector (
Lector_id varchar(6),
Pnombre varchar(30),
SNombre varchar(30),
Ciudad varchar(15),
Telefono varchar(10),
Ocupacion varchar(10),
DiaNacimiento Date,

Constraint lector_pk Primary key(lector_id)
);

create table libro (
Lid varchar(6),
Lnombre varchar(40),
Lgenero varchar(30),
paginas varchar(6),
Editoria varchar(30),
Constraint libro_Lid_pk Primary key(Lid)
);

-- Estas son las cuentas de los lectores, donde se registran ciertas informaciones de nuestros clientes

Create table LectoresActivos (
cuenta_id varchar(6),
lector_id varchar(6),
Lid varchar(6),
tipoCuenta varchar(10),
EstatusCuenta varchar(10),

constraint LectoresActivos_numeroC_pk primary key (cuenta_id),
constraint cuenta_lector_id_fk Foreign key (lector_id) References Lector(lector_id),
constraint cuenta_Lid_fk Foreign key (Lid) References Libro(Lid),
);

create table detalle_ProblemadeLibros (
Numero_problema varchar (7),
cuenta_id varchar (6),
Lid varchar (20),
Lnombre varchar (50),
Numeros_de_los_problemas_del_libro varchar(7),

constraint DetalleLibro_problema_pk primary key (Numero_problema),
constraint DetalleLibro_NumCuenta_fk Foreign key (cuenta_id) References LectoresActivos(cuenta_id),
);


----------------------------------------------------------Values-------------------------------------------------------------------

INSERT INTO LibraryLRI values ('SantoDomingo', 'Alma Rosa','Costa Rica', '8097800882','LLRI@Hotmail.com','9AM-5PM','Luneas a Viernes');

INSERT INTO empleado values ('1551', 'Marcus','Rodriguez','Distrito Nacional', '809529141','MR007','asf','MR@gmail');
INSERT INTO empleado values ('1552', 'Melissa','Villanueva','San luis', '829754965','MV051','brt','MV@gmail');
INSERT INTO empleado values ('1553', 'Raul','Escobar','Higuey', '809852696','RE251','alf','RE@gmail');
INSERT INTO empleado values ('1554', 'Pablo','Mateo','San luis', '829254128','PM221','dav','PM@gmail');
INSERT INTO empleado values ('1555', 'Eliezer','Campusano','La vega', '809514986','EC325','vaw','EC@gmail');


INSERT INTO lector values ('S0001','Esteban','Lamar','Azua', '8297854525','dominicano','1989-1-4');
INSERT INTO lector values ('S0002','Karinna','Martinez','SantoDomingo', '8295156574','dominicano','1997-5-14');
INSERT INTO lector values ('S0003','Joan','Vicente','LaRomana', '8297152517','dominicano','1999-1-15');
INSERT INTO lector values ('S0004','Michael','Mercedes','Puerto Plata', '8291547814','dominicano','1995-1-12');
INSERT INTO lector values ('S0005','Maria','Campusano','Azua', '8295541258','dominicano','1998-8-11');
INSERT INTO lector values ('S0007','Ahmed','Kadafi','Bani', '8098412535','Arabe','1987-5-15');


INSERT INTO libro values ('B001','MEMORIA DEL SIGLO','Historia','540','LibroDominicano');
INSERT INTO libro values ('B002','La Gran Pelea','Aventura', '248', 'TUSQUETSEDITORES');
INSERT INTO libro values ('B003','MEMORIAS DE UNA MULA','Drama', '222', 'PLANETA');
INSERT INTO libro values ('B004','HISTORIA DEL PUEBLO DOMINICANO','Historia','659','LIBRODOMINICANO');
INSERT INTO libro values ('B005','LA SANGRE (ISFODOSU)','Drama','203','LIBRODOMINICANO');
INSERT INTO libro values ('B006','LA PARADOJA DEL FENIX','Drama','188','LIBRODOMINICANO');
INSERT INTO libro values ('B007','100 LEYENDAS DOMINICANAS','Historia','111','LIBRODOMINICANO');
INSERT INTO libro values ('B008','30 DIAS','Aventura','138','LIBRODOMINICANO');


Insert into LectoresActivos values('C0001','S0001','B001','Premium','Activo');
Insert into LectoresActivos values('C0002','S0002','B002','Regular','Suspendido');
Insert into LectoresActivos values('C0003','S0003','B003','Premium','Activo');
Insert into LectoresActivos values('C0004','S0004','B004','Regular','Terminada');
Insert into LectoresActivos values('C0005','S0005','B005','Regular','Activo');
Insert into LectoresActivos values('C0006','S0006','B006','Premium','Suspendida');
Insert into LectoresActivos values('C0007','S0007','B007','Regular','Activo');
Insert into LectoresActivos values('C0008','S0008','B008','Regular','Activo');


Insert into detalle_ProblemadeLibros values('P0001','C0001','B001','MEMORIA DEL SIGLO','1');
Insert into detalle_ProblemadeLibros values('P0002','C0002','B003','MEMORIAS DE UNA MULA','3');
Insert into detalle_ProblemadeLibros values('P0003','C0003','B007','100 LEYENDAS DOMINICANAS','1');

----select options----

select *from LibraryLRI;
select *from empleado;
select *from libro;
select *from lector;
select *from LectoresActivos;
select *from detalle_ProblemadeLibros;

--inser sample data --Empleado-- ingreso de nuevo lector o cliente--

insert into empleado
(empleadoID, Enombre, Eapellido, sexo, Edireccion, Telefono, usuario, contraseña, correo, Salario)
values
('1556','Fatima','Vicente','F','SantoDomingo','8295874525','FV541','sde','FV@gmail','2500' )


--inser sample data --lector-- ingreso de nuevo lector o cliente

insert into lector
(Lector_id,Pnombre,SNombre,Ciudad,Telefono, Procedencia,DiaNacimiento)
values
('S0006','John','Roberts','SantoDomingo', '8098424548','EST','1987-5-20')

---------------------------Cliente 2----------------------------------------

insert into lector
(Lector_id,Pnombre,SNombre,Ciudad,Telefono, Procedencia,DiaNacimiento)
values
('S0008','Jean','Whites','SantoDomingo', '8098424548','canadiense','1998-6-10')

update lector
set Procedencia= 'Estadounidense'
where Lector_id='S0006'

update lector
set Telefono= '8295925587'
where Lector_id='S0008'

update lector
set DiaNacimiento= '1998-1-02'
where Lector_id='S0008'

update LectoresActivos
set EstatusCuenta= 'Suspendida'
where cuenta_id='C0002'
---------------------------------------------------------------------------

--inser sample data --detalle_ProblemadeLibros--

insert into detalle_ProblemadeLibros
(Numero_problema, cuenta_id, Lid, Lnombre, Numeros_de_los_problemas_del_libro)
values
('P0004','C0004','B006','LA PARADOJA DEL FENIX','2')

update detalle_ProblemadeLibros
set Numeros_de_los_problemas_del_libro= '3'
where cuenta_id='C0004'

update detalle_ProblemadeLibros
set Numeros_de_los_problemas_del_libro= '2'
where cuenta_id='C0002'

update detalle_ProblemadeLibros
set Numeros_de_los_problemas_del_libro= '2'
where cuenta_id='C0001'


--Alter tables-- lector

Alter table lector add lector_Acc varchar (15)
Alter table lector add lector_Pass varchar (15)

--Alter tables-- libro

Alter table libro add Libro_Copias varchar (4)

--update data --- libro

update libro
set Lnombre= 'Manofactura Lean'
where Lid='B002'

--update data -- detalle de problemas de los libros
update detalle_ProblemadeLibros
set Numeros_de_los_problemas_del_libro= '2'
where cuenta_id='C0001'

update detalle_ProblemadeLibros
set Numeros_de_los_problemas_del_libro= '3'
where cuenta_id='C0001'

--update data -- empleado sexo

update empleado
set Sexo= 'M'
where empleadoID='1551'

update empleado
set Sexo= 'F'
where empleadoID='1552'

update empleado
set Sexo= 'M'
where empleadoID='1553'

update empleado
set Sexo= 'M'
where empleadoID='1554'

update empleado
set Sexo= 'M'
where empleadoID='1555'

--update data -- empleado salario

update empleado
set Salario= 5000
where empleadoID='1551'

update empleado
set Salario= 3500
where empleadoID='1552'

update empleado
set Salario= 2000
where empleadoID='1553'

update empleado
set Salario= 2000
where empleadoID='1554'

update empleado
set Salario= 2000
where empleadoID='1555'

update empleado
set Salario= 1500
where empleadoID='1556'

--update lector --- lector

update lector
set lector_Acc= 'L0001'
where Lector_id='S0001'

update lector
set lector_Acc= 'L0002'
where Lector_id='S0002'

update lector
set lector_Acc= 'L0003'
where Lector_id='S0003'

update lector
set lector_Acc= null
where Lector_id='S0004'

update lector
set lector_Acc= 'L0005'
where Lector_id='S0005'

update lector
set lector_Acc= 'L0006'
where Lector_id='S0006'

update lector
set lector_Acc= 'L0007'
where Lector_id='S0007'

update lector
set lector_Acc= 'L0008'
where Lector_id='S0008'

--- lector-Pass---
update lector
set lector_Pass= 'frt'
where Lector_id='S0001'

update lector
set lector_Pass= 'drc'
where Lector_id='S0002'

update lector
set lector_Pass= 'ade'
where Lector_id='S0003'

update lector
set lector_Pass= null
where Lector_id='S0004'

update lector
set lector_Pass= 'asc'
where Lector_id='S0005'

update lector
set lector_Pass= 'fcv'
where Lector_id='S0006'

update lector
set lector_Pass= 'fca'
where Lector_id='S0007'

update lector
set lector_Pass= 'dfa'
where Lector_id='S0008'

----------Gastos del Cliente---------
update lector
set Gastos= 6000
where Lector_id='S0001'

update lector
set Gastos= 8500
where Lector_id='S0002'

update lector
set Gastos= 6800
where Lector_id='S0003'

update lector
set Gastos= 6000
where Lector_id='S0004'

update lector
set Gastos= 5900
where Lector_id='S0005'

update lector
set Gastos= 5600
where Lector_id='S0006'

update lector
set Gastos= 3000
where Lector_id='S0007'

update lector
set Gastos= 1800
where Lector_id='S0008'

----------Cantidad-de-Libros---------

update libro
set Libro_Copias=3
where Lid='B001'

update libro
set Libro_Copias=15
where Lid='B002'

update libro
set Libro_Copias=25
where Lid='B003'

update libro
set Libro_Copias=30
where Lid='B004'

update libro
set Libro_Copias=25
where Lid='B005'

update libro
set Libro_Copias=10
where Lid='B006'

update libro
set Libro_Copias=15
where Lid='B007'

update libro
set Libro_Copias=30
where Lid='B008'

----------Costo de Renta---------

update libro
set Costo_Renta=1000
where Lid='B001'

update libro
set Costo_Renta=850
where Lid='B002'

update libro
set Costo_Renta=800
where Lid='B003'

update libro
set Costo_Renta=900
where Lid='B004'

update libro
set Costo_Renta=1000
where Lid='B005'

update libro
set Costo_Renta=850
where Lid='B006'

update libro
set Costo_Renta=800
where Lid='B007'

update libro
set Costo_Renta=900
where Lid='B008'
-----------------------------------
--select options
select *from LibraryLRI;
select *from empleado;
select *from libro;
select *from lector;
select *from LectoresActivos;
select *from detalle_ProblemadeLibros;


------------------Funciones-y-problematicas------------------------------

--Problematica-1- Establesca la cantidad de empleados, clientes y libros que hay en la liberia 

-----Numero de Empleados-----
select count (empleadoID) as Cantidad_Empleados
from empleado
-----Numero de lectores------
select count(Lector_id) as Cantidad_Clientes
from lector
-----Nnumero de libros-------
select count (Lid) as Cantidad_Libros
from libro

--Problematica-2- Determinar los defectos en las que un cliente puede entregar los libros

select count (Numero_problema) as Tercera_Categoria
from detalle_ProblemadeLibros
where Numeros_de_los_problemas_del_libro = '3';

select count (Numero_problema) as Segunda_Categoria
from detalle_ProblemadeLibros
where Numeros_de_los_problemas_del_libro = '2';

select count (Numero_problema) as Primera_Categoria
from detalle_ProblemadeLibros
where Numeros_de_los_problemas_del_libro < '2';

--Problematica-3- Ecuentre la cantidad de copias que sean mayor a 15

select count (Lid) as Cantidad_Copias_mayor_15
from libro
where Libro_Copias > 15 and Libro_Copias < 51;

--Problematica-4- Encuentra la cantidad de lectores activos, suspendidos y terminados 

select count (EstatusCuenta) as Cantidad, EstatusCuenta as Estatus_Cuenta
from LectoresActivos
group by EstatusCuenta

--Problematica-5- Encuentra la cantidad de suscriptores estadounidences que se encuentran en nuestra libreria 

select count (Procedencia) as Suscriptores_Estadounidenses
from lector
where Procedencia = 'Estadounidense'

--Problematica-6- Cuanto esta gastando la libreria en pagos salariales

select sum (Salario) as Suma_total_empleado
from empleado

--Problematica-7- Encuentre el promedio de las ganancias de los empleados que son Masculinos

select avg(Salario) as Ganancia_Total_M
from empleado
where sexo = 'M';

--Problematica-8- Cuanto es la Ganacia total de la libreria
select sum (Gastos) as Ganancia_T_Libreria
from lector


