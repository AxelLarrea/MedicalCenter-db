--TIPOS

create domain t_gen as char
check(
    value ~ 'm'
    or value ~ 'f'
    or value ~ 'u'
);

create domain t_tipoTurno as text
check(
    value ~ 'Consulta'
    or value ~ 'Estudio'
    or value ~ 'Urgencia'
);

create domain t_factSang as text
check(
    value ~ 'A+'
    or value ~ 'A-'
    or value ~ 'B+'
    or value ~ 'B-'
    or value ~ 'AB+'
    or value ~ 'AB-'
    or value ~ 'O+'
    or value ~ 'O-'
);

create domain t_rol as text
check(
    value ~ 'Medico'
    or value ~ 'Paciente'
    or value ~ 'Administrador'
);

create domain t_dni as char(8);

create domain t_cuil as char(11);

create domain t_cobertura as char;

--TABLAS

create table ObraSocial (
    nombre char(20) not null,
    id serial primary key,
    porcentajeCobertura int
);

create table Rol(
	id serial primary key,
    nombreDelRol t_rol 
);

create table Usuario(
	DNI t_dni primary key,
    nombre char(50),
    apellido char(50),
    genero t_gen,
    correoElectronico text,
    contraseña varchar,
    fechaNac text,
    factorSanguineo text,
    telefono char(20),
	nroAfiliadoOS int,
    id_obrasocial int not null,
    idRol int not null,
    constraint FK_ObraSocial foreign key(id_obrasocial) references ObraSocial(id),
    constraint FK_Rol foreign key(idRol) references Rol(id)
);

create table Medico(
	DNI t_dni primary key,
	CUIL t_cuil,
    nroMatricula varchar,
	provincia varchar,
	ciudad varchar,
	direccion varchar,
	codigopostal varchar,
	especialidad varchar,
	mutual varchar,
	constraint FK_Medico foreign key (DNI) references Usuario(DNI)
);

create table TipoTurno (
    id serial primary key,
    nombreTurno t_tipoTurno unique
);

create table Turno (
    id serial primary key,
    fecha text,
    hora text,
    montoAPagar float not null,
    id_usuarioM t_dni not null,
    id_usuarioP t_dni not null,
    id_tipoTurno int not null,
	id_transaccion text unique not null,
	pago boolean,
    constraint FK_UsuarioM foreign key (id_usuarioM) references Usuario(DNI),
    constraint FK_UsuarioP foreign key (id_usuarioP) references Usuario(DNI),
    constraint FK_TipoTurno foreign key (id_tipoTurno) references TipoTurno(id)
);

create table Cancelado (
    id integer primary key,
    fecha text,
    reintegro boolean,
	constraint FK_Cancelado foreign key (id) references Turno(id)
);


create table Especialidad (
	id serial primary key,
    nombreEspecialidad char(50)
);

create table ObraSocialXMedico(
    dni_medico t_dni,
    id_obrasocial int,
	primary key(dni_medico, id_obrasocial), 
    constraint FK_ObraSocial foreign key (id_obrasocial) references ObraSocial(id),
	constraint FK_MedicoOS foreign key (dni_medico) references Medico(DNI)
);

create table MedicoxEspecialidad (
    id_especialidad integer,
	id_medico t_dni,
	primary key(id_especialidad,id_medico),
    constraint FK_Especialidad foreign key (id_especialidad) references Especialidad(id),
    constraint FK_Medico foreign key (id_medico) references Medico(DNI)
);

create table RegistroHistoriaClinica (
    id integer primary key,
    motivo varchar, 
    diagnostico varchar,
    estudios_solicitados varchar, 
    medicamentos varchar,
    constraint FK_Turno foreign key (id) references Turno(id)
);

create table Noticia (
	titulo text,
	descripcion text,
	contenido text,
	img text,
	autor text,
	id serial
);

--TRIGGERS

create or replace function controlador_medico() returns trigger as $funcemp$
declare
	v_idrol integer;	
begin
	if new.nroMatricula = '' then
		raise exception 'No puede tener número de matrícula vacío.';
	end if;
	
	if new.DNI = '' then
		raise exception 'El DNI no puede ser vacío.';
	end if;
	
	if new.CUIL = '' then
		raise exception 'El CUIL no puede ser vacío.';
	end if;
	
	select idrol into v_idrol from usuario where DNI = new.DNI;
	
	if v_idrol = 2 or v_idrol = 3 then
 		raise exception 'No se puede agregar como médico a un usuario que no lo es.';
 	end if;
	
	return new;
end; $funcemp$ language plpgsql;


create trigger trigger_medico before insert or update on medico
for each row execute procedure controlador_medico();


create or replace function controlador_usuario() returns trigger as $funcemp$
begin
	if new.nombre = '' then
		raise exception 'No puede tener el nombre vacío.';
	end if;
	if new.apellido = '' then
		raise exception 'No puede tener el apellido vacío.';
	end if;
	if length(new.contraseña) <= 8 then
		raise exception 'La contraseña no puede ser menor que 8';
	end if;
	return new;
end; $funcemp$ language plpgsql;

create trigger trigger_usuarios before insert or update on usuario
for each row execute procedure controlador_usuario();



create or replace function controlador_registroHistoriaClinica() returns trigger as $funcemp$
begin
	if new.motivo = '' then
		raise exception 'El motivo no puede ser vacío.';
	end if;
	return new;
end; $funcemp$ language plpgsql;

create trigger trigger_registroHistoriaClinica before insert or update on registrohistoriaclinica
for each row execute procedure controlador_registroHistoriaClinica();



create or replace function controlador_obraSocial() returns trigger as $funcemp$
begin
	if new.nombre = '' then
		raise exception 'El nombre no puede ser vacío.';
	end if;
	if new.porcentajecobertura = 0 then
		raise exception 'El porcentaje de cobertura no puede ser vacío.';
	end if;
	return new;
end; $funcemp$ language plpgsql;

create trigger trigger_obraSocial before insert or update on obrasocial
for each row execute procedure controlador_obraSocial();



create or replace function controlador_rol() returns trigger as $funcemp$
begin
	if new.nombreDelRol = '' then
		raise exception 'El nombre no puede ser vacío.';
	end if;
	return new;
end; $funcemp$ language plpgsql;

create trigger trigger_rol before insert or update on rol
for each row execute procedure controlador_rol();	



create or replace function controlador_especialidad() returns trigger as $funcemp$
begin
	if new.nombreespecialidad = '' then
		raise exception 'El nombre no puede ser vacío.';
	end if;
	return new;
end; $funcemp$ language plpgsql;

create trigger trigger_especialidad before insert or update on especialidad
for each row execute procedure controlador_especialidad();




create or replace function controlar_turno() returns trigger as $funcemp$
begin
	
	if new.id_transaccion = '' then 
		raise exception 'ID de transaccion repetido';
	end if;
	return new;
end; $funcemp$ language plpgsql;

create trigger trigger_controlar_turno before insert or update on turno
for each row execute procedure controlar_turno();



create or replace function controlador_turnos() returns trigger as $funcemp$
declare
	cont int;
begin
	select count(*) into cont from Medico where Medico.dni = new.id_usuarioM;
	if cont = 0 then
    	raise exception 'El turno no se puede cargar debido a que no existe el médico';
	end if;
	return new;
end; $funcemp$ language plpgsql;

create trigger trigger_turnos before insert or update on turno
for each row execute procedure controlador_turnos();

--VISTAS

create view turno_usuario_transaccion
as select nombre, correoelectronico, fecha, hora, montoapagar, id_transaccion, dni
	from turno join usuario on turno.id_usuariop = usuario.dni;

create view historiaclinica_paciente
as select motivo, diagnostico, estudios_solicitados, medicamentos, DNI, registrohistoriaclinica.id,
			fecha
from registrohistoriaclinica join turno on registrohistoriaclinica.id = turno.id
	 join usuario on turno.id_usuariop = usuario.dni;
	 
select * from historiaclinica_paciente;



create view turno_usuario
	as select fecha, hora, montoapagar, nombre, apellido, id_usuariop, id
	from turno join usuario on turno.id_usuariom = usuario.dni;


create view medico_especialidad 
as select DNI, nombre, apellido, genero, correoElectronico, fechaNac, nombreespecialidad
from especialidad join medicoxespecialidad on especialidad.id = medicoxespecialidad.id_especialidad
	 join usuario on usuario.dni = medicoxespecialidad.id_medico;
	 
create view lista_medico
	as select nombre, apellido
	from usuario join medico on usuario.dni = medico.dni;
	
	
create view medico_especialidad_obraSocial
as select usuario.nombre as nombreusuario, apellido, obrasocialxmedico.id_obrasocial, obrasocial.nombre, medico.dni, id_especialidad, nombreespecialidad
from usuario join medico on usuario.dni = medico.dni
	join medicoxespecialidad on medico.dni = medicoxespecialidad.id_medico
	join especialidad on medicoxespecialidad.id_especialidad = especialidad.id
	join obrasocialxmedico on medico.dni = obrasocialxmedico.dni_medico
	join obrasocial on obrasocialxmedico.id_obrasocial = obrasocial.id;
	
create view historiaxturno
as select turno.id, id_transaccion from turno join registrohistoriaclinica on turno.id = registrohistoriaclinica.id;

--Stored Procedures

create or replace function turnosxMedico (dniMedico t_dni) returns integer as 
$$
declare
	cont int;
begin
	cont:= count(Turno.id) from 
			Medico join Turno
			on Medico.dni = Turno.id_usuarioM 
			where Medico.dni = dniMedico;
	return cont;
end
$$
language plpgsql;