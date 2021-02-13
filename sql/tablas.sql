create table curso(
	cod_curso		varchar(5) primary key,
	nombre_curso	varchar(200),
	creditos		numeric(1,0),
	link_whatsapp	varchar(200)
);
create table curso_especialidad(
	ciclo			numeric(2,0),
	cod_curso		varchar(5),
	especialidad	varchar(2),
	foreign key (cod_curso) references curso(cod_curso),
	primary key (cod_curso,especialidad,ciclo)
);

create table usuario(
	especialidad		varchar(2),
	cod_uni				varchar(9) primary key,
	correo_uni			varchar(100),
	ciclo				numeric(2,0),
	tipo_usuario		varchar(10),
	nombre				varchar(30),
	apellido			varchar(30),
	descripcion			varchar(200),
	credencial          varchar(20)
);

create table asesoria(
	cod_asesoria				numeric(5,0) primary key,
	cod_asesor					varchar(9),
	cod_curso					varchar(5),
	cod_usuario_creacion		varchar(9),
	cod_usuario_modificacion	varchar(9),
	link_asesoria				varchar(200),
	fecha_inicio_inscrip		date,
	fecha_final_inscrip			date,
	cap_max						numeric(3,0),
	cap_min						numeric(3,0),
	fecha_asesoria				date,
	hora_inicio					time,
	hora_final					time,
	tema						varchar(200),
	descripcion					varchar(300),
	foreign key (cod_curso) references curso(cod_curso),
	foreign key (cod_asesor) references usuario(cod_uni),
	foreign key (cod_usuario_creacion) references usuario(cod_uni),
	foreign key (cod_usuario_modificacion) references usuario(cod_uni)
);

create table preferencia(
	cod_uni			varchar(9) primary key,
	cod_curso		varchar(5),
	fecha_inicio	date,
	fecha_fin		date,
	foreign key (cod_curso) references curso(cod_curso)
);

create table inscripcion(
	cod_inscripcion		numeric(9,0) primary key,
	cod_uni				varchar(9),
	cod_asesoria		numeric(5,0),
	fecha_inscripcion	timestamp,
	foreign key (cod_uni) references usuario(cod_uni),
	foreign key (cod_asesoria) references asesoria(cod_asesoria)
);

select * from curso_especialidad;

--1er ciclo
insert into curso(cod_curso, nombre_curso,creditos)
values ('FB101','Geometría Analítica', 3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('BMA01','Cálculo Diferencial', 5);
insert into curso(cod_curso, nombre_curso,creditos)
values ('BQU01','Química I',5);
insert into curso(cod_curso, nombre_curso,creditos)
values ('BIC01','Introducción a la Computación', 2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI101','Introducción al Pensamiento y a la Ing. de Sistemas', 3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('BRC01','Redacción y Comunicación', 2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE101','Introducción a Ingeniería Industrial',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE101','Dibujo de Ingeniería',2);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'BMA01','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'BQU01','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'BIC01','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'FB101','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'BRC01','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'SI101','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'BMA01','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'BQU01','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'BRC01','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'BEF01','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'FB101','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'GE101','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (1,'TE101','I1');

--2do ciclo
insert into curso(cod_curso, nombre_curso,creditos)
values ('BMA03','Álgebra Lineal', 4);
insert into curso(cod_curso, nombre_curso,creditos)
values ('BMA02','Cálculo Integral', 5);
insert into curso(cod_curso, nombre_curso,creditos)
values ('BEF01','Ética y Filosofía Política',2);
insert into curso(cod_curso, nombre_curso,creditos)
VALUES ('SI201','Psicología Sistémica',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI203','Teoría y Ciencia de Sistemas', 3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI207','Sistemas Biológicos y Ecológicos', 2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI205','Algoritmia y Estructura de datos', 3);
insert into curso(cod_curso, nombre_curso,creditos)
VALUES ('SI204','Teoría General de Sistemas',2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('FB202','Química II',4);
insert into curso(cod_curso, nombre_curso,creditos)
values ('BRN01','Realidad Nacional, Constitución y Derechos Humanos',3);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'BMA03','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'BMA02','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'BEF01','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'SI201','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'SI203','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'SI101','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'SI205','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'BMA03','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'BMA02','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'BIC01','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'BRN01','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'HU102','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'SI204','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (2,'FB202','I1');

--3er ciclo
INSERT into curso(cod_curso, nombre_curso,creditos)
values ('FB301','Matemática Discreta', 3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('FB303','Cálculo Multivariable', 5);
insert into curso(cod_curso, nombre_curso,creditos)
values ('BFI01','Física I',5);
insert into curso(cod_curso, nombre_curso,creditos)
values ('HU301','Metodología de la Investigación', 2);
insert into curso(cod_curso, nombre_curso,creditos)
VALUES ('FB305','Estadística y Probabilidades', 3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI301','Teoría y Ciencia de Sistemas Aplicados', 2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI302','Programación orientada a objetos', 3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE301','Físico Química y Operaciones Unitarias',4);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE302','Diseño Asistido por Computador',3);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
values (3,'SI302','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'SI301','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'FB305','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'HU301','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'BFI01','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'FB303','I2');
INSERT into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'FB301','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'BFI01','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'HU301','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'FB301','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'FB303','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'TE302','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (3,'TE301','I1');

--4to ciclo
insert into curso(cod_curso, nombre_curso,creditos)
values ('FB402','Cálculo Numérico', 3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('FB403','Ecuaciones Diferenciales', 5);
insert into curso(cod_curso, nombre_curso,creditos)
values ('FB401','Física II',5);
insert into curso(cod_curso, nombre_curso,creditos)
values ('FB405','Estadística Aplicada',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('HU102','Desarrollo Personal', 2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI403','Metodología de los Sistemas Blandos',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI405','Modelo Conceptual de Datos',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE401','Termodinámica',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI401','Lenguaje de Programación',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('BEG01','Economía General',3);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'FB402','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'FB403','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'FB401','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'FB405','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'HU102','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'SI403','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'SI405','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'BEG01','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'SI401','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'TE401','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'FB403','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'FB401','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (4,'FB305','I1');

--5to ciclo
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI501','Investigación de Operaciones I',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE502','Ingeniería del Trabajo I',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE501','Electricidad y Electrónica Industrial',4);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE503','Procesos Industriales I',4);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE502','Resistencia de Materiales',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('HU201','Sociología',2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI505','Diseño de Base de Datos',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('FB501','Matemática Aplicada',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE501','Teoría Organizacional',3);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'BEG01','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'BRN01','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'FB501','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'GE501','I2')
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'SI501','I2')
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'SI503','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'SI505','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'HU201','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'FB405','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'TE502','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'TE503','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'TE501','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'GE502','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (5,'SI501','I1');

--6to ciclo
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE601','Ingeniería de Materiales ',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI601','Investigación de Operaciones II',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE603','Ingeniería del Trabajo II',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE602','Procesos Industriales II',4);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE604','Administración y Organización',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE602','Contabilidad Financiera',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE605','Sistema y Gestión Financiera',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI602','Dinamica de Sistemas',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI603','Modelado de Procesos de Ciclo de Vida de Sistemas',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI604','Analisis y Diseño de Sistemas',4);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI605','Arquitectura Empresarial',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI607','Arquitectura Computacional y Redes',3);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'GE605','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'SI602','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'SI603','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'SI604','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'SI605','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'SI607','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'SI601','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'GE604','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'TE602','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'GE602','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'GE603','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'SI601','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (6,'TE601','I1');

--7mo ciclo
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE704','Contabilidad de Costos y Presupuestos',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI503','Ingeniería de Procesos',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE701','Análisis de Procesos de Manufactura',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI701','Modelado Sistémico y Simulación',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE701','Logística Empresarial',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE702','Ingeniería Económica',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI707','Ingeniería de Software',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE703','Sistemas Integrados Empresariales',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI702','Taller de Dinamica de Sistemas',2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI704','Gestión de la Ingeniería de Sistemas',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI705','Estandares de la Ingeniería de Sistemas',2);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'GE703','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'GE709','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'SI701','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'SI702','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'SI704','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'SI705','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'SI707','I2')
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'GE702','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'GE701','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'SI701','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'TE701','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'SI503','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (7,'GE704','I1');

--8vo ciclo
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE805','Mercadotecnia',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE802','Ingeniería del Producto',3);
insert into curso(cod_curso, nombre_curso,creditos)
VALUES ('GE802',' Gestión de la Cadena de Suministro',3);
insert into curso(cod_curso, nombre_curso,creditos)
VALUES ('GE802',' Gestión de la Cadena de Suministro',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE801','Automatización y Control de Procesos',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE709','Sistemas de Calidad',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI807','Sistemas de Inteligencia de Negocio',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE803','Sistemas Analiticos ',2);
insert into curso(cod_curso, nombre_curso,creditos)
VALUES ('SI801','Modelo del Sistema Viable',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI805','Integración de Sistemas',2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI806','Desarrollo Adaptativo e Integrado del SW',2);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'GE801','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'GE803','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'SI801','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'SI805','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'SI806','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'SI807','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'GE709','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'TE801','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'GE802','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'TE802','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (8,'GE805','I1');

--9no ciclo
insert into curso(cod_curso, nombre_curso,creditos)
values ('TE901','Seguridad y Salud Ocupacional',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE002','Finanzas',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE901','Innovación y Emprendimiento de Negocios',3);
insert into curso(cod_curso, nombre_curso,creditos)
VALUES ('GE905','Planeamiento y Control de Operaciones',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE904','Proyecto de Tesis en Ingeniería Industrial I',2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI904','Seguridad de Sistemas',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI901','01 Proyecto de Tesis en Ing. Sistemas I',2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI902','Ingenieria de Sistemas de Servicio',3);
insert into curso(cod_curso, nombre_curso,creditos)
VALUES ('SI903','Implementacion de Sistemas',2);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'GE902','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'SI901','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'SI902','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'SI903','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'SI904','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'TE901','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'GE002','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'GE901','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'GE905','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (9,'GE904','I1');

--10mo ciclo
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE903','Gestión del Talento Humano',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE801','Planeamiento y Gestión Estrategica',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE902','Diseño y Evaluación de Proyectos',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('GE001','Proyecto de Tesis en Ingeniería Industrial II ',2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI095','Ingeniería Empresarial',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI035','Proyecto de Tesis en Ing. Sistemas II',2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI055',' Gestión de Proyectos',2);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI075','Auditoria de Sistemas',3);
insert into curso(cod_curso, nombre_curso,creditos)
values ('SI085','Aplicación de Negocios Electrónicos',3);

insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (10,'SI035','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (10,'SI055','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (10,'SI075','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (10,'SI085','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (10,'SI095','I2');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (10,'GE903','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (10,'GE801','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (10,'GE902','I1');
insert into curso_especialidad(ciclo,cod_curso, especialidad)
VALUES (10,'GE001','I1');
