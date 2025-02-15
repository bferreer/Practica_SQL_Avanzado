-- Alumna: Betlem Ferrer

-- Creo la tabla Student
create or replace table `my-project-practica-450315.keepcoding_dataset.student` as 
select 1000001 as student_id, 'Juan' as name, 'Cortés' as surname, '8726258H'as dni, datetime('1980-03-21') as date_birthday, 'Madrid' as city, 5500 as tuition_cost, 1 as bootcamp_id union all
select 1000002 as student_id, 'Claudia' as name, 'Fernández' as surname, '8726658H'as dni, datetime('1972-03-25') as date_birthday, 'Barcelona' as city, 6000 as tuition_cost, 2 as bootcamp_id union all
select 1000003 as student_id, 'Montse' as name, 'Premià' as surname, '5126258J'as dni, datetime('1976-07-04') as date_birthday, 'Girona' as city, 3000 as tuition_cost, 1 as bootcamp_id union all
select 1000004 as student_id, 'Enrique' as name, 'Calderón' as surname, '3026258Q'as dni, datetime('1981-06-10') as date_birthday, 'Sabadell' as city, 4200 as tuition_cost, 1 as bootcamp_id union all
select 1000005 as student_id, 'Ana' as name, 'Mistral' as surname, '4956258S'as dni, datetime('1990-08-09') as date_birthday, 'Valencia' as city, 5000 as tuition_cost, 3 as bootcamp_id;



-- Creo la tabla Teacher
create or replace table `my-project-practica-450315.keepcoding_dataset.teacher` as 
select 2000001 as teacher_id, 'Mariana' as name, 'Pérez' as surname, '8770258H'as dni, datetime('1995-03-21') as date_birthday, 'Granada' as city, 5500 as salary, 1 as module_id union all
select 2000002 as teacher_id, 'José' as name, 'Martínez' as surname, '8726248K'as dni, datetime('1991-03-25') as date_birthday, 'Barcelona' as city, 6000 as salary, 2 as module_id union all
select 2000003 as teacher_id, 'Luis' as name, 'Martín' as surname, '5873258T'as dni, datetime('1986-07-04') as date_birthday, 'Pontevedra' as city, 3000 as salary, 1 as module_id union all
select 2000004 as teacher_id, 'Raquel' as name, 'Sánchez' as surname, '3028358Q'as dni, datetime('1989-06-10') as date_birthday, 'Lleida' as city, 4200 as salary, 1 as module_id union all
select 2000005 as teacher_id, 'Javier' as name, 'López' as surname, '4936255S'as dni, datetime('1994-08-09') as date_birthday, 'Tarragona' as city, 5000 as salary, 3 as module_id;



-- Creo la tabla Bootcamp
create or replace table `my-project-practica-450315.keepcoding_dataset.bootcamp` as 
select 1 as bootcamp_id, 'IA' as name, 'Bootcamp de formación full stack. Aprende Inteligencia Artificial y domina la Revolución del Mercado: Fórmate a Nivel Avanzado en un área con alta demanda de profesionales' as description, 5000 as cost, '1, 2, 3, 4, 5' as modules_id union all
select 2 as bootcamp_id, 'Programación desde cero' as name, 'Introducción a la programación orientada a objetos y funcional a través de Python. La puerta al desarrollo Mobile, Web, Big Data, Videojuegos e IA' as description, 5000 as cost, '1, 6, 3, 4, 7' as modules_id union all
select 3 as bootcamp_id, 'Ciberseguridad' as name, 'Conviértete en un experto en ciberseguridad, hacking ético y análisis forense, uno de los perfiles del sector IT más demandados en la actualidad con un 98% de empleabilidad' as description, 5000 as cost, '1, 6, 3, 4, 7' as modules_id;


-- Creo la tabla Módulo
create or replace table `my-project-practica-450315.keepcoding_dataset.modulo` as 
select 1 as modulo_id, 'Programación' as name, 'Descripción del módulo de programación' as description, 1 as bootcamp_id, 2000001 as teacher_id union all
select 2 as modulo_id, 'Matemáticas' as name, 'Descripción del módulo de matemáticas' as description, 1 as bootcamp_id, 2000002 as teacher_id union all
select 3 as modulo_id, 'SQL' as name, 'Descripción del módulo de SQL' as description, 1 as bootcamp_id, 2000003 as teacher_id union all
select 4 as modulo_id, 'GIT' as name, 'Descripción del módulo de GIT' as description, 1 as bootcamp_id, 2000004 as teacher_id union all
select 5 as modulo_id, 'Machine Learning' as name, 'Descripción del módulo de Machine Learning' as description, 1 as bootcamp_id, 2000005 as teacher_id;