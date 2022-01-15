-- ****************** PUNTO 3 ****************** --

/* 
 * INSERTAR 3 MAESTROS ZAPATEROS, 2 AYUDANTES Y 2 CORTADORES
 */

-- -------------------------------------
-- Insertar datos huellitas.tipos_rol
-- -------------------------------------
INSERT INTO huellitas.cargos (nombre)
	VALUES ('Maestro Zapatero');
INSERT INTO huellitas.cargos (nombre)
	VALUES ('Cortador');
INSERT INTO huellitas.cargos (nombre)
	VALUES ('Ayudante');

-- --------------------------------------
-- Insertar datos huellitas.empleados
-- --------------------------------------
INSERT INTO huellitas.empleados (nombre,id_cargo)
	VALUES ('Juan Wick',1);
INSERT INTO huellitas.empleados (nombre,id_cargo)
	VALUES ('Ed Toreto',1);
INSERT INTO huellitas.empleados (nombre,id_cargo)
	VALUES ('Charlie Perez',1);
INSERT INTO huellitas.empleados (nombre,id_cargo)
	VALUES ('Marta Johansson',2);
INSERT INTO huellitas.empleados (nombre,id_cargo)
	VALUES ('Ortrencia Mora',2);
INSERT INTO huellitas.empleados (nombre,id_cargo)
	VALUES ('Paolo Walker',3);
INSERT INTO huellitas.empleados (nombre,id_cargo)
	VALUES ('Efesto Sanchez',3);

/* 
 * INSERTAR UN NUEVO DISEÑO DE UN ZAPATO
 */

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
-- Insertar datos huellitas.lotes_importe
-- --------------------------------------
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (1,'1',50,'Molde tenis',6);
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (1,'2',50,'Molde zapato clásico',6);
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (1,'3',50,'Molde zapatilla',7);
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (2,'1',200,'Textil azul',7);
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (2,'2',200,'Textil negro',6);
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (2,'3',200,'Cuero sintético rojo',6);
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (2,'4',200,'Cuero negro');
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (3,'1',150,'Suela goma blanca');
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (3,'2',150,'Suela corcho ');
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (3,'3',150,'Suela eva');
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (3,'4',150,'Suela poliuretano',7);
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (4,'1',600,'Pedrería dorada pequeña');
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (4,'2',600,'Pedrería plateada mediana',6);
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion,ayudante)
	VALUES (4,'3',600,'Hebilla plateada circular',6);
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion)
	VALUES (4,'4',600,'Hebilla plateada rombo');
INSERT INTO huellitas.lotes_importe (id_tipo_lote,ref_producto,cantidad,descripcion)
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
-- Insertar datos huellitas.disenos
-- --------------------------------------
INSERT INTO huellitas.disenos (nombre,talla_min,talla_max,cantidad_trozos,cantidad_accesorios,descripcion)
	VALUES ('Tenis confort',35,40,4,1,'Tenis ergonómico negro y azul para hombre');

-- --------------------------------------
-- Insertar datos huellitas.grupo_diseno
-- --------------------------------------
INSERT INTO huellitas.grupo_diseno (id_diseno,id_maestro)
	VALUES (1,1);
INSERT INTO huellitas.grupo_diseno (id_diseno,id_maestro)
	VALUES (1,2);
INSERT INTO huellitas.grupo_diseno (id_diseno,id_maestro)
	VALUES (1,3);

-- ------------------------------------------
-- Insertar datos huellitas.materiales_diseno
-- ------------------------------------------
INSERT INTO huellitas.materiales_diseno (id_lote_material,id_diseno)
	VALUES (4,1);
INSERT INTO huellitas.materiales_diseno (id_lote_material,id_diseno)
	VALUES (5,1);

-- ------------------------------------------
-- Insertar datos huellitas.accesorios_diseno
-- ------------------------------------------
INSERT INTO huellitas.accesorios_diseno (id_lote,id_diseno,cantidad)
	VALUES (14,1,1);

/* 
 * INSERTAR UN NUEVO LOTE DE 10 ZAPATOS GENERADOS A PARTIR DE ESTE DISEÑO Y
 * CON LOS EMPLEADOS YA CREADOS
 */

-- --------------------------------------------
-- Insertar datos huellitas.referencias_zapatos
-- --------------------------------------------
INSERT INTO huellitas.referencias_zapatos (talla,id_diseno)
	VALUES (40,1);

-- --------------------------------------------
-- Insertar datos huellitas.lotes_zapatos
-- --------------------------------------------
INSERT INTO huellitas.lotes_zapatos (cantidad,ref_zapato,ayudante)
	VALUES (10,1,6);

-- ---------------------------------------------
-- Insertar datos huellitas.detalles_fabricacion
-- ---------------------------------------------
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,1,1);
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,2,1);
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,3,1);
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,4,1);
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,5,1);
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,6,1);
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,7,1);
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,8,1);
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,9,1);
INSERT INTO huellitas.detalles_fabricacion (id_maestro,id_ayudante,id_molde,id_suela,ref_zapato)
	VALUES (1,6,1,10,1);

-- ---------------------------------------------
-- Insertar datos huellitas.zapatos
-- ---------------------------------------------
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,1);
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,2);
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,3);
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,4);
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,5);
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,6);
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,7);
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,8);
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,9);
INSERT INTO huellitas.zapatos (id_lote,id_detalle)
	VALUES (1,10);

-- ---------------------------------------------
-- Insertar datos huellitas.trozos_material
-- ---------------------------------------------
INSERT INTO huellitas.trozos_material (id_lote_material,cortador,cantidad,descripcion)
	VALUES (4,4,60,'empeine tenis');
INSERT INTO huellitas.trozos_material (id_lote_material,cortador,cantidad,descripcion)
	VALUES (5,4,80,'orejas tenis');
INSERT INTO huellitas.trozos_material (id_lote_material,cortador,cantidad,descripcion)
	VALUES (4,5,40,'legueta tenis');
INSERT INTO huellitas.trozos_material (id_lote_material,cortador,cantidad,descripcion)
	VALUES (5,5,40,'talón tenis');

-- ---------------------------------------------
-- Insertar datos huellitas.trozos_fabricacion
-- ---------------------------------------------
INSERT INTO huellitas.trozos_fabricacion (ref_trozo,id_detalle_fabricacion,cantidad)
	VALUES (1,1,1);
INSERT INTO huellitas.trozos_fabricacion (ref_trozo,id_detalle_fabricacion,cantidad)
	VALUES (2,1,2);
INSERT INTO huellitas.trozos_fabricacion (ref_trozo,id_detalle_fabricacion,cantidad)
	VALUES (3,1,1);
	
/* 
 * MODIFICAR EL ROL DE UN EMPLEADO DE AYUDANTE MAESTRO ZAPATERO
 */

-- --------------------------------------------
-- Actualizar cargo tabla huellitas.empleados
-- --------------------------------------------
UPDATE huellitas.empleados 
	SET id_cargo = 1
	WHERE id_empleado = 6;
	
/* 
 * ACTUALIZAR EL DISEÑO DE UN ZAPATO AGREGANDO UN ACCESORIO NUEVO
 */

-- --------------------------------------------------------
-- Actualizar cantidad_accesorios tabla huellitas.empleados 
-- --------------------------------------------------------
UPDATE huellitas.disenos 
	SET cantidad_accesorios = 2
	WHERE id_diseno = 1;

-- --------------------------------------------------------
-- Insertar accesorio tabla huellitas.accesorios_diseno 
-- --------------------------------------------------------
INSERT INTO huellitas.accesorios_diseno (id_lote,id_diseno,cantidad)
	VALUES (13,1,1);

/* 
 * ACTUALIZAR EL DISEÑO DE UN ZAPATO AGREGANDO UN TROZO DE UN MATERIAL DIFERENTE
 */

-- --------------------------------------------------------
-- Actualizar cantidad_trozos tabla huellitas.empleados 
-- --------------------------------------------------------
UPDATE huellitas.disenos 
	SET cantidad_trozos = 5
	WHERE id_diseno = 1;

-- --------------------------------------------------------
-- Insertar trozo tabla huellitas.trozos_fabricacion 
-- --------------------------------------------------------
INSERT INTO huellitas.trozos_fabricacion (ref_trozo,id_detalle_fabricacion,cantidad)
	VALUES (4,1,1);

/* 
 * ELIMINAR UN ZAPATO DE UN LOTE
 */
-- --------------------------------------------------------
-- Actualizar id_lote tabla huellitas.zapatos
-- --------------------------------------------------------