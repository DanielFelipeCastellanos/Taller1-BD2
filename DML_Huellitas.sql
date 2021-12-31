-- -------------------------------------
-- Insertar datos huellitas.tipos_rol
-- -------------------------------------
INSERT INTO huellitas.tipos_rol (nombre)
	VALUES ('Maestro Zapatero');
INSERT INTO huellitas.tipos_rol (nombre)
	VALUES ('Cortador');
INSERT INTO huellitas.tipos_rol (nombre)
	VALUES ('Ayudante');

-- --------------------------------------
-- Insertar datos huellitas.tipos_lote
-- --------------------------------------
INSERT INTO huellitas.tipos_lote (nombre)
	VALUES ('Moldes');
INSERT INTO huellitas.tipos_lote (nombre)
	VALUES ('Materiales');
INSERT INTO huellitas.tipos_lote (nombre)
	VALUES ('Suelas');
INSERT INTO huellitas.tipos_lote (nombre)
	VALUES ('Accesorios');	
	
-- --------------------------------------
-- Insertar datos huellitas.empleados
-- --------------------------------------
INSERT INTO huellitas.empleados (nombre,cargo)
	VALUES ('Juan Wick',1);
INSERT INTO huellitas.empleados (nombre,cargo)
	VALUES ('Ed Toreto',1);
INSERT INTO huellitas.empleados (nombre,cargo)
	VALUES ('Charlie Perez',1);
INSERT INTO huellitas.empleados (nombre,cargo)
	VALUES ('Marta Johansson',2);
INSERT INTO huellitas.empleados (nombre,cargo)
	VALUES ('Ortrencia Mora',2);
INSERT INTO huellitas.empleados (nombre,cargo)
	VALUES ('Paolo Walker',3);
INSERT INTO huellitas.empleados (nombre,cargo)
	VALUES ('Efesto Sanchez',3);
	-- --------------------------------------
-- Insertar datos huellitas.lotes_importe
-- --------------------------------------
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (1,'1',50,'Molde tenis',6);
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (1,'2',50,'Molde zapato clásico',6);
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (1,'3',50,'Molde zapatilla',7);
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (2,'1',200,'Textil azul',7);
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (2,'2',200,'Textil negro',6);
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (2,'3',200,'Cuero sintético rojo',6);
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (2,'4',200,'Cuero negro');
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (3,'1',150,'Suela goma blanca');
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (3,'2',150,'Suela corcho ');
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (3,'3',150,'Suela eva');
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (3,'4',150,'Suela poliuretano',7);
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (4,'1',600,'Pedrería dorada pequeña');
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (4,'2',600,'Pedrería plateada mediana',6);
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (4,'3',600,'Hebilla plateada circular',6);
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (4,'4',600,'Hebilla plateada rombo');
INSERT INTO huellitas.lotes_importe (tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (4,'5',600,'Flor azul cuero');

-- --------------------------------------
-- Insertar datos huellitas.info_moldes
-- --------------------------------------
INSERT INTO huellitas.info_moldes (id_lote,talla)
	VALUES (1,40);
INSERT INTO huellitas.info_moldes (id_lote,talla)
	VALUES (2,35);
INSERT INTO huellitas.info_moldes (id_lote,talla)
	VALUES (3,38);

-- --------------------------------------
-- Insertar datos huellitas.moldes
-- --------------------------------------
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (1);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);
INSERT INTO huellitas.moldes (id_info_molde)
	VALUES (3);

-- --------------------------------------
-- Insertar datos huellitas.info_suelas
-- --------------------------------------
INSERT INTO huellitas.info_suelas (id_lote,talla)
	VALUES (8,40);
INSERT INTO huellitas.info_suelas (id_lote,talla)
	VALUES (9,38);

-- --------------------------------------
-- Insertar datos huellitas.suelas
-- --------------------------------------
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (1);
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (1);
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (1);
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (1);
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (1);
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (2);
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (2);
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (2);
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (2);
INSERT INTO huellitas.suelas (id_info_suela)
	VALUES (2);

-- --------------------------------------
-- Insertar datos huellitas.materiales
-- --------------------------------------
INSERT INTO huellitas.materiales (id_lote,cortador)
	VALUES (4,4);
INSERT INTO huellitas.materiales (id_lote,cortador)
	VALUES (5,4);

-- --------------------------------------
-- Insertar datos huellitas.accesorios
-- --------------------------------------
INSERT INTO huellitas.accesorios (id_lote)
	VALUES (15);
INSERT INTO huellitas.accesorios (id_lote)
	VALUES (15);
INSERT INTO huellitas.accesorios (id_lote)
	VALUES (15);
INSERT INTO huellitas.accesorios (id_lote)
	VALUES (14);
INSERT INTO huellitas.accesorios (id_lote)
	VALUES (14);
INSERT INTO huellitas.accesorios (id_lote)
	VALUES (14);
INSERT INTO huellitas.accesorios (id_lote)
	VALUES (13);
INSERT INTO huellitas.accesorios (id_lote)
	VALUES (13);

-- --------------------------------------
-- Insertar datos huellitas.disenos
-- --------------------------------------
INSERT INTO huellitas.disenos (nombre,id_molde,id_suela,descripcion)
	VALUES ('Tenis facherito - negro y azul',1,2,'Tenis ergonómico para hombre en color negro con suela blanca y detalles en azul talla 40.');

-- ----------------------------------------
-- Insertar datos huellitas.trozos_material
-- ----------------------------------------
INSERT INTO huellitas.trozos_material (id_material,id_diseno,cantidad,descripcion)
	VALUES (1,1,10,'Empeine negro');
INSERT INTO huellitas.trozos_material (id_material,id_diseno,cantidad,descripcion)
	VALUES (1,1,10,'Talón negro');
INSERT INTO huellitas.trozos_material (id_material,id_diseno,cantidad,descripcion)
	VALUES (2,1,10,'Lengüeta azul');
INSERT INTO huellitas.trozos_material (id_material,id_diseno,cantidad,descripcion)
	VALUES (2,1,20,'Oreja azul');


-- --------------------------------------
-- Insertar datos huellitas.lotes_zapatos
-- --------------------------------------
INSERT INTO huellitas.lotes_zapatos (cantidad,ref_zapato,ayudante)
	VALUES (10,1,7);

--  Auto-generated SQL script #202112282020
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (1,6,1,1);
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (1,6,1,1);
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (1,6,1,1);
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (2,7,1,1);
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (2,7,1,1);
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (2,7,1,1);
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (2,7,1,1);
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (2,7,1,1);
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (1,6,1,1);
INSERT INTO huellitas.zapatos (id_maestro,id_ayudante,id_diseno,id_lote)
	VALUES (1,6,1,1);
