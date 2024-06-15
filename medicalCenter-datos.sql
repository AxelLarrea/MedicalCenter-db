insert into "obrasocial"("nombre","porcentajecobertura") values('IOSPER',25);
insert into "obrasocial"("nombre","porcentajecobertura") values('TVSALUD',5);
insert into "obrasocial"("nombre","porcentajecobertura") values('AVALIANT',6);
insert into "obrasocial"("nombre","porcentajecobertura") values('Federada Salud',75);
insert into "obrasocial"("nombre","porcentajecobertura") values('Apres Salud',80);
insert into "obrasocial"("nombre","porcentajecobertura") values('Medicus',50);
insert into "obrasocial"("nombre","porcentajecobertura") values('OMINT',60);
insert into "obrasocial"("nombre","porcentajecobertura") values('Bristol Medicine',25);
insert into "obrasocial"("nombre","porcentajecobertura") values('AcaSalud',35);
insert into "obrasocial"("nombre","porcentajecobertura") values('Galeno',43);
insert into "obrasocial"("nombre","porcentajecobertura") values('Prevención Salud',73);
insert into "obrasocial"("nombre","porcentajecobertura") values('Swiss Medical',100);
insert into "obrasocial"("nombre","porcentajecobertura") values('FEMEBA',14);

select * from obrasocial;

-- alter sequence especialidad_id_seq restart with 1;
-- update especialidad set id=nextval('especialidad_id_seq');

insert into "rol"("nombredelrol") values('Medico');
insert into "rol"("nombredelrol") values('Paciente');
insert into "rol"("nombredelrol") values('Administrador');

select * from rol;


insert into "usuario" values ('42487766','Facundo','Pereyra','m','facupereyra4@gmail.com', 'pepitojajaja','30/03/00','A+','3455408792',125,3,1); 
insert into "usuario" values ('40409986','Martin','Fochesatto','m','focheperyra@gmail.com', 'juancitojajaja','5/08/98','O+','3447640826',758,8,2); 
insert into "usuario" values ('41819148','Axel','Larrea','m','axel@gmail.com','pedritojajaja','15/04/99','A-','3442601823',783,12,3);
insert into "usuario" values ('47896122', 'Tomás', 'Gutierrez', 'm', 'tomasgutierrez@gmail.com', 'contraseña123','12/07/87', 'A-', '3446876916',157, 6, 2);
insert into "usuario" values ('42123737', 'Alexis', 'Huck', 'm', 'huckalexis0@gmail.com', 'deportivo12', '15/02/2000', 'O+', '3446583020',737, 5,2);
insert into "usuario" values ('32456987','Marcela', 'Garibaldi', 'f', 'marcelagaribaldi@gmail.com', 'password123', '12/04/78', 'A+', '3455894125',859, 8, 1);
insert into "usuario" values ('43897645','Juan','Albornoz','m','1323@gmail.com','contraseña','23/08/97','A-','3442543213',769,7,2);
insert into "usuario" values ('37547172','Leandro', 'Moyano', 'm', 'leandro.moy@gmail.com','Leandro45637', '11/05/1995', 'A+', '3447679328',684, 3,2);
insert into "usuario" values ('40159765', 'Felipe', 'Fernandez', 'm', 'felipardo@gmail.com', 'holahola2', '4/07/2007', 'A+', '3442302058',164, 4,3);
insert into "usuario" values ('41783234','Diego','Valdez','m','correo@gmail.com','niidea12345','02/12/98','B-','3442233213',123,9,2);

select * from usuario;


insert into "medico" values('42487766','20424877663','42123','Buenos Aires','Campana','Direccion 879','2022','Neurologo','OSDE');
insert into "medico" values ('32456987','20324569876','458965','Entre Rios','Colón','Direccion 174','2021','Oftalmologo','IOSPER');

select * from medico;


insert into "especialidad"("nombreespecialidad") values('Kinesiologia');
insert into "especialidad"("nombreespecialidad") values('Neurologia');
insert into "especialidad"("nombreespecialidad") values('Pediatria');
insert into "especialidad"("nombreespecialidad") values('Cardiologia');
insert into "especialidad"("nombreespecialidad") values('Otorrinolaringologia');
insert into "especialidad"("nombreespecialidad") values('Dermatologia');
insert into "especialidad"("nombreespecialidad") values('Anestesiología');
insert into "especialidad"("nombreespecialidad") values('Toxicología');

select * from especialidad;

insert into "medicoxespecialidad" values(1,'42487766');
insert into "medicoxespecialidad" values(2,'42487766');
insert into "medicoxespecialidad" values(4,'32456987');
insert into "medicoxespecialidad" values(8,'32456987');


select * from medicoxespecialidad;

insert into "tipoturno"("nombreturno") values('Consulta');
insert into "tipoturno"("nombreturno") values('Estudio');


select * from tipoturno;

alter sequence turno_id_seq restart with 1; update turno set id=nextval('turno_id_seq');
alter sequence tipoturno_id_seq restart with 1; update tipoturno set id=nextval('tipoturno_id_seq');
alter sequence especialidad_id_seq restart with 1; update especialidad set id=nextval('especialidad_id_seq');
alter sequence rol_id_seq restart with 1; update rol set id=nextval('rol_id_seq');
alter sequence obrasocial_id_seq restart with 1; update obrasocial set id=nextval('obrasocial_id_seq');
alter sequence registrohistoriaclinica_id_seq restart with 1; update registrohistoriaclinica set id=nextval('registrohistoriaclinica_id_seq');




insert into "turno"("fecha", "hora", "montoapagar","id_usuariom", "id_usuariop", "id_tipoturno", "id_transaccion", "pago") values('13/12/2021', '14:00', 500, '42487766', '40409986',1, 'jhiosdfjklsdfa', true);
insert into "turno"("fecha", "hora", "montoapagar","id_usuariom", "id_usuariop", "id_tipoturno", "id_transaccion", "pago") values('3/12/2022', '8:00', 2500, '42487766', '42123737',1, 'ñkldrjcliamjlsa', true);
insert into "turno"("fecha", "hora", "montoapagar","id_usuariom", "id_usuariop", "id_tipoturno", "id_transaccion", "pago") values('30/03/2022', '17:00', 750, '32456987', '40159765',2, 'prtks,csamdcsektm', false);
insert into "turno"("fecha", "hora", "montoapagar","id_usuariom", "id_usuariop", "id_tipoturno", "id_transaccion", "pago") values('18/03/2022', '17:00', 5500, '42487766', '43897645',1, '9werwejczcxzcw2w', false);
insert into "turno"("fecha", "hora", "montoapagar","id_usuariom", "id_usuariop", "id_tipoturno", "id_transaccion", "pago") values('08/02/2022', '09:00', 2500, '32456987', '41783234',2, 'dasdlnsadisdnsdi3', false);
insert into "turno"("fecha", "hora", "montoapagar","id_usuariom", "id_usuariop", "id_tipoturno", "id_transaccion", "pago") values('20/05/2022', '10:00', 1000, '42487766', '42123737',1, '6sa5d6ada5sd6sad5', false);
insert into "turno"("fecha", "hora", "montoapagar","id_usuariom", "id_usuariop", "id_tipoturno", "id_transaccion", "pago") values('21/02/2022', '11:00', 1500, '42487766', '42123737',1, '6sa5d6adasdasdadsadasd6sad5', true);
insert into "turno"("fecha", "hora", "montoapagar","id_usuariom", "id_usuariop", "id_tipoturno", "id_transaccion", "pago") values('30/07/2022', '17:00', 7500, '42487766', '42123737',1, 'aaaaaaaasdasdadsadasd6sad5', true);

alter sequence turno_id_seq restart with 1; update turno set id=nextval('turno_id_seq');


insert into "cancelado" values (1,'13/12/2021', true);
insert into "cancelado" values (2,'3/12/2022',true);
insert into "cancelado" values (3,'08/02/2022',false);
insert into "cancelado" values (5,'06/12/2022',false);

select * from turno
where id_usuariop = '42123737'
	
select * from cancelado

insert into "registrohistoriaclinica" values(1,'dolor de oido', 'otitis', 'ninguno', 'paracetamol');
insert into "registrohistoriaclinica" values(2,'dolor de panza', 'apendicitis', 'ecografia', 'ibupirac600');

delete from turno
where pago is true


select * from registrohistoriaclinica

insert into "obrasocialxmedico" values('42487766','1');
insert into "obrasocialxmedico" values('42487766','4');
insert into "obrasocialxmedico" values('42487766','7');
insert into "obrasocialxmedico" values('32456987','4');
insert into "obrasocialxmedico" values('32456987','2');
insert into "obrasocialxmedico" values('32456987','3');

select * from obrasocialxmedico


insert into "noticia"("titulo","descripcion","contenido","img","autor") values(
        'Coronavirus: cuánto tarda el resultado de un hisopado',
        'El testeo se realiza en centros de salud públicos y privados y también de manera particular; se recomienda hacerlo en los cuatro días siguientes a la aparición de los síntomas',
        'nLa suba de contagios de coronavirus enciende las alarmas de las autoridades sanitarias de todas las jurisdicciones del país y de los ciudadanos que, en caso de notar algún síntoma coincidente con la enfermedad, deberán acudir a un centro de testeo para realizarse el hisopado. Si una persona presenta uno o más de los siguientes síntomas es conveniente que realice una consulta médica y, de ser necesario, se acerque a un centro de salud para someterse al hisopado de coronavirus. El llamado hisopado nasofaríngeo (RT-PCR) es el método por excelencia para detectar la enfermedad y se usa a nivel mundial, tiene una efectividad del 99% y consta de la introducción de un hisopo en las fosas nasales y la garganta. El hisopado está indicado en las personas que tienen síntomas compatibles con el coronavirus y es recomendable realizarlo en los cuatros días siguientes a la aparición o al contacto con un caso positivo, para evitar un falso negativo. El análisis de laboratorio sobre una muestra de hisopado normalmente demora 24 horas, dependiendo, en algunas ocasiones, del volumen de testeos diarios. Esta demora suele ser la misma en los centros de salud públicos y privados o los que se realizan de manera particular, donde es el paciente quien abona el hisopado.',
        'hisopado.jpg',
        'Ricardo Pristupluk');

insert into "noticia"("titulo","descripcion","contenido","img","autor") values(
        'Deficiencia de hierro: cómo cambiar los alimentos que consumís te puede ayudar a sentirte menos cansado',
        'El cansancio y la fatiga afecta a gran parte de la población y a veces no hay un motivo obvio por el que nos sintamos con la energía tan baja. ¿Consumir hierro podría ayudar?',
        'Una de cada cinco personas se siente inusualmente cansada de forma habitual y una de cada diez sufre fatiga prolongada, según el Real Colegio de Psiquiatras de Reino Unido. A veces, puede no haber una razón obvia. Sorprende, entonces, que apenas estemos comenzando a comprender algunas de las causas del cansancio y la fatiga. Lo que es más, una nueva investigación está arrojando algunos datos sorprendentes sobre el papel que juega nuestra dieta. La deficiencia de hierro es la deficiencia nutricional más común en todo el mundo. Más del 30% de la población mundial está anémica, según la Organización Mundial de la Salud (OMS). La Encuesta Nacional de Dieta y Nutrición de Reino Unido revela que el 48% de las niñas de entre 11 y 18 años, el 27% de las mujeres de entre 19 y 64 años y casi uno de cada 10 niños de entre 11 y 18 años registran una ingesta de hierro baja. ¿Cómo afecta esto a los niveles de energía?',
        'hierro.jpg',
        'Esther Martinez');
		
insert into "noticia"("titulo","descripcion","contenido","img","autor") values(
        'Ley de Etiquetado Frontal: guía para saber cómo leer los alimentos y entender qué es cada cosa',
        'Te dejamos una guía para entender cuáles son los principales ingredientes de los alimentos procesados, y cuáles deberías evitar',
        'De un tiempo a esta parte, como resultado de la explosión de ultraprocesados, la consciencia sobre la composición de los alimentos y sus efectos en nuestra salud es cada vez mayor. Como siempre, los cambios de paradigma tienen sus detractores, y el camino parece avanzar, primero, por un registro a nivel social y luego por un lento cambio de hábitos de las masas. No solamente hay cada vez más comunicadores, nutricionistas, cocineros e influencers que nos abren los ojos sobre la calidad de lo que comemos, sino que ese reclamo avanzó, aunque lentamente, y ayer por la noche se anunció la aprobación de la Ley de Etiquetado. Para que entiendas en el marco de qué se trató, tenés que tener en cuenta que una de las principales causas por las que enfermamos y morimos los argentinos, son las enfermedades crónicas no transmisibles, como el cáncer y la diabetes, y las enfermedades crónicas respiratorias y cardiovasculares. Existen factores de riesgo que hacen que esas enfermedades empeoren y se desarrollen de una manera más pronunciada, entre los cuales se encuentra la alimentación, que está muy ligada al comportamiento y que por ende es posible de mejorar.',
        'ley.jpg',
        'Ernesto Ramirez');

insert into "noticia"("titulo","descripcion","contenido","img","autor") values(
        'Se incrementó en los argentinos el riesgo de padecer un trastorno mental',
        'Así lo reveló un estudio de la Facultad de Psicología de la UBA; las causas y el rol de la pandemia',
        'El riesgo de padecer un trastorno mental en la población argentina se incrementó un 257,4% durante la epidemia por Covid-19, según un estudio realizado por el Observatorio de Psicología Aplicada de la Facultad de Psicología de la Universidad de Buenos Aires. El informe reveló que el 12,51% de la población presentó riesgo de padecer un trastorno mental en este año, frente al 4,86% de marzo de 2020, una semana después de que se decretara el aislamiento social preventivo y obligatorio en la Argentina.Son cifras muy preocupantes, afirmó el secretario de investigación y coordinador del estudio Martín Etchevers. La población se enfrentó a un desafío multidimensional: económico, laboral y social. Un cambio drástico en el estilo de vida. Este panorama se incrementa en las poblaciones más vulnerables, donde se observa un mayor deterioro en múltiples aspectos de la vida de las personas. Asimismo, los niveles de sintomatología ansiosa depresiva y el riesgo suicida también aumentaron a nivel nacional de la mano del malestar psicológico. Y estos síntomas se manifestaron en mayor medida en aquellas personas que presentaron adicción al tabaco, al alcohol o a sustancias ilegales. Sin embargo, en aquellas personas que se refugiaron en el ejercicio físico el impacto fue menor.',
        'depresion.jpg',
        'Sandra Rodríguez Ramos');

insert into "noticia"("titulo","descripcion","contenido","img","autor") values(
        'Cáncer de pulmón: la detección precoz salva vidas',
        'Un diagnóstico a tiempo es fundamental en el tratamiento de esta enfermedad y la tomografía computada de baja dosis en fumadores de más de 50 años puede significar el primer paso para una mayor supervivencia de los pacientes.',
        'En el Día Mundial de concientización sobre el cáncer de pulmón, resulta importante conocer cuáles son los factores que aumentan el riesgo de desarrollarlo, cómo realizar un diagnóstico a tiempo y de qué manera se identifica a la población de riesgo.El tabaco acompaña la vida de muchas personas y, a lo largo de los años, deja su huella en el cuerpo, una huella que puede ser mortal. El humo del tabaco tiene al menos 70 sustancias químicas que causan cáncer, también conocidas como carcinógenos [1]. Fumar es el factor de riesgo más importante para desarrollar cáncer de pulmón, sin embargo, no todas las personas que fuman padecen de este tipo de cáncer [2]. Los números de la Organización Mundial de la Salud (OMS) señalan al cáncer de pulmón como el segundo tipo de cáncer con más casos a escala global: en 2020, 2,21 millones de personas fueron diagnosticadas con esta afección. En la Argentina, fue el tercero en nuevos casos con un total de 12.110 personas que se enfermaron, según el Observatorio Global del Cáncer, afectando a 7.738 hombres y 4.372 mujeres. Y es el primero en fallecimientos: 10.279 fue el número en 2020, por encima del de mama y el de colon, que son los dos con más cantidad de casos diagnosticados.',
        'cancer-pulmon.jpg',
        'Content LAB');
