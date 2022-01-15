-- -----------------------------------------------------
-- Schema Huellitas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Huellitas` DEFAULT CHARACTER SET utf8 ;
USE `Huellitas` ;

-- -----------------------------------------------------
-- Table `Huellitas`.`Cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Cargos` (
  `id_cargo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `id_cargo` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `FK_cargo_empleado` (`id_cargo` ASC) INVISIBLE,
  CONSTRAINT `PK_id_cargo_empleado`
    FOREIGN KEY (`id_cargo`)
    REFERENCES `Huellitas`.`Cargos` (`id_cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Tipos_Lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Tipos_Lote` (
  `id_tipo_lote` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_lote`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Lotes_Importe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Lotes_Importe` (
  `id_lote` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_lote` INT NOT NULL,
  `ref_producto` VARCHAR(20) NOT NULL,
  `cantidad` INT NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  `fec_recepcion` DATE NULL,
  `fec_agotado` DATE NULL,
  `ayudante` INT NULL,
  PRIMARY KEY (`id_lote`),
  INDEX `FK_id_tipo_lote_li` (`id_tipo_lote` ASC) VISIBLE,
  INDEX `FK_ayudante_li` (`ayudante` ASC) VISIBLE,
  UNIQUE INDEX `ref_producto_UNIQUE` (`ref_producto` ASC) VISIBLE,
  CONSTRAINT `FK_id_tipo_lote_li`
    FOREIGN KEY (`id_tipo_lote`)
    REFERENCES `Huellitas`.`Tipos_Lote` (`id_tipo_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ayudante_li`
    FOREIGN KEY (`ayudante`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Info_Suelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Info_Suelas` (
  `id_info_suela` INT NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `talla` FLOAT NOT NULL,
  PRIMARY KEY (`id_info_suela`),
  INDEX `FK_id_lote_info_su_idx` (`id_lote` ASC) VISIBLE,
  CONSTRAINT `FK_id_lote_info_su`
    FOREIGN KEY (`id_lote`)
    REFERENCES `Huellitas`.`Lotes_Importe` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Suelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Suelas` (
  `id_suela` INT NOT NULL AUTO_INCREMENT,
  `id_info_suela` INT NOT NULL,
  PRIMARY KEY (`id_suela`),
  INDEX `FK_id_info_suelas_idx` (`id_info_suela` ASC) VISIBLE,
  CONSTRAINT `FK_id_info_suelas`
    FOREIGN KEY (`id_info_suela`)
    REFERENCES `Huellitas`.`Info_Suelas` (`id_info_suela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Info_Moldes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Info_Moldes` (
  `id_info_molde` INT NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `talla` FLOAT NOT NULL,
  `forma` VARCHAR(45) NULL,
  PRIMARY KEY (`id_info_molde`),
  INDEX `FK_id_lote_info_idx` (`id_lote` ASC) VISIBLE,
  UNIQUE INDEX `id_lote_UNIQUE` (`id_lote` ASC) VISIBLE,
  CONSTRAINT `FK_id_lote_info_mo`
    FOREIGN KEY (`id_lote`)
    REFERENCES `Huellitas`.`Lotes_Importe` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Moldes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Moldes` (
  `id_molde` INT NOT NULL AUTO_INCREMENT,
  `id_info_molde` INT NOT NULL,
  PRIMARY KEY (`id_molde`),
  INDEX `FK_id_info_moldes_idx` (`id_info_molde` ASC) VISIBLE,
  CONSTRAINT `FK_id_info_moldes`
    FOREIGN KEY (`id_info_molde`)
    REFERENCES `Huellitas`.`Info_Moldes` (`id_info_molde`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Disenos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Disenos` (
  `id_diseno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL,
  `talla_min` FLOAT NOT NULL,
  `talla_max` FLOAT NOT NULL,
  `cantidad_trozos` INT NOT NULL,
  `cantidad_accesorios` INT NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`id_diseno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Referencias_Zapatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Referencias_Zapatos` (
  `ref_zapato` INT NOT NULL AUTO_INCREMENT,
  `talla` FLOAT NOT NULL,
  `id_diseno` INT NULL,
  PRIMARY KEY (`ref_zapato`),
  INDEX `FK_id_diseno_idx` (`id_diseno` ASC) VISIBLE,
  CONSTRAINT `FK_id_diseno`
    FOREIGN KEY (`id_diseno`)
    REFERENCES `Huellitas`.`Disenos` (`id_diseno`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Huellitas`.`Lotes_Zapatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Lotes_Zapatos` (
  `id_lote` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `fec_elaborado` DATE NULL,
  `fec_salida` DATE NULL,
  `ref_zapato` INT NOT NULL,
  `ayudante` INT NULL,
  PRIMARY KEY (`id_lote`),
  INDEX `FK_id_ayudante_lz_idx` (`ayudante` ASC) VISIBLE,
  INDEX `FK_ref_zapato_lz_idx` (`ref_zapato` ASC) VISIBLE,
  CONSTRAINT `FK_ref_zapato_lz`
    FOREIGN KEY (`ref_zapato`)
    REFERENCES `Huellitas`.`Referencias_Zapatos` (`ref_zapato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_ayudante_lz`
    FOREIGN KEY (`ayudante`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Grupo_Diseno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Grupo_Diseno` (
  `id_diseno` INT NOT NULL,
  `id_maestro` INT NOT NULL,
  PRIMARY KEY (`id_diseno`, `id_maestro`),
  INDEX `FK_id_maestro_gd` (`id_maestro` ASC) VISIBLE,
  INDEX `FK_id_diseno_gd` (`id_diseno` ASC) INVISIBLE,
  CONSTRAINT `FK_id_maestro_gd`
    FOREIGN KEY (`id_maestro`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_diseno_gd`
    FOREIGN KEY (`id_diseno`)
    REFERENCES `Huellitas`.`Disenos` (`id_diseno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Trozos_Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Trozos_Material` (
  `ref_trozo` INT NOT NULL AUTO_INCREMENT,
  `id_lote_material` INT NOT NULL,
  `cortador` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `descripcion` VARCHAR(150) NULL,
  INDEX `FK_id_material_tm` (`id_lote_material` ASC) VISIBLE,
  PRIMARY KEY (`ref_trozo`),
  INDEX `FK_id_cortador_idx` (`cortador` ASC) VISIBLE,
  CONSTRAINT `FK_id_cortador`
    FOREIGN KEY (`cortador`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_lote_material`
    FOREIGN KEY (`id_lote_material`)
    REFERENCES `Huellitas`.`Lotes_Importe` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Accesorios_diseno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Accesorios_diseno` (
  `id_lote` INT NOT NULL,
  `id_diseno` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id_lote`, `id_diseno`),
  INDEX `FK_id_accesorio_ad` (`id_lote` ASC) INVISIBLE,
  INDEX `FK_id_diseno_ad` (`id_diseno` ASC) VISIBLE,
  CONSTRAINT `FK_id_diseno_ad`
    FOREIGN KEY (`id_diseno`)
    REFERENCES `Huellitas`.`Disenos` (`id_diseno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_id_lote_accesorio_ad`
    FOREIGN KEY (`id_lote`)
    REFERENCES `Huellitas`.`Lotes_Importe` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Detalles_Fabricacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Detalles_Fabricacion` (
  `id_detalle` INT NOT NULL AUTO_INCREMENT,
  `id_maestro` INT NOT NULL,
  `id_ayudante` INT NOT NULL,
  `id_molde` INT NOT NULL,
  `id_suela` INT NOT NULL,
  `ref_zapato` INT NOT NULL,
  PRIMARY KEY (`id_detalle`),
  INDEX `FK_id_maestro_idx` (`id_maestro` ASC) VISIBLE,
  INDEX `FK_id_ayudante_df_idx` (`id_ayudante` ASC) VISIBLE,
  INDEX `FK_id_molde_df_idx` (`id_molde` ASC) VISIBLE,
  INDEX `FK_id_suela_df_idx` (`id_suela` ASC) VISIBLE,
  INDEX `FK_ref_zapato_df_idx` (`ref_zapato` ASC) VISIBLE,
  UNIQUE INDEX `id_suela_UNIQUE` (`id_suela` ASC) VISIBLE,
  CONSTRAINT `FK_id_maestro_df`
    FOREIGN KEY (`id_maestro`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_ayudante_df`
    FOREIGN KEY (`id_ayudante`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_molde_df`
    FOREIGN KEY (`id_molde`)
    REFERENCES `Huellitas`.`Moldes` (`id_molde`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_suela_df`
    FOREIGN KEY (`id_suela`)
    REFERENCES `Huellitas`.`Suelas` (`id_suela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ref_zapato_df`
    FOREIGN KEY (`ref_zapato`)
    REFERENCES `Huellitas`.`Referencias_Zapatos` (`ref_zapato`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Zapatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Zapatos` (
  `id_zapato` INT NOT NULL AUTO_INCREMENT,
  `id_lote` INT NULL,
  `id_detalle` INT NOT NULL,
  PRIMARY KEY (`id_zapato`),
  INDEX `FK_id_lote_zap` (`id_lote` ASC) VISIBLE,
  INDEX `FK_id_detalles_zap_idx` (`id_detalle` ASC) VISIBLE,
  CONSTRAINT `FK_id_lote_zap`
    FOREIGN KEY (`id_lote`)
    REFERENCES `Huellitas`.`Lotes_Zapatos` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_detalle_zap`
    FOREIGN KEY (`id_detalle`)
    REFERENCES `Huellitas`.`Detalles_Fabricacion` (`id_detalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Materiales_Diseno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Materiales_Diseno` (
  `id_lote_material` INT NOT NULL,
  `id_diseno` INT NOT NULL,
  INDEX `FK_id_diseno_md_idx` (`id_diseno` ASC) INVISIBLE,
  PRIMARY KEY (`id_lote_material`, `id_diseno`),
  CONSTRAINT `FK_id_lote_material_md`
    FOREIGN KEY (`id_lote_material`)
    REFERENCES `Huellitas`.`Lotes_Importe` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_diseno_md`
    FOREIGN KEY (`id_diseno`)
    REFERENCES `Huellitas`.`Disenos` (`id_diseno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Trozos_Fabricacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Trozos_Fabricacion` (
  `ref_trozo` INT NOT NULL,
  `id_detalle_fabricacion` INT NOT NULL,
  `cantidad` INT NULL,
  INDEX `FK_id_trozo_idx` (`ref_trozo` ASC) VISIBLE,
  INDEX `FK_id_detalle_tf_idx` (`id_detalle_fabricacion` ASC) VISIBLE,
  CONSTRAINT `FK_ref_trozo_tf`
    FOREIGN KEY (`ref_trozo`)
    REFERENCES `Huellitas`.`Trozos_Material` (`ref_trozo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_detalle_tf`
    FOREIGN KEY (`id_detalle_fabricacion`)
    REFERENCES `Huellitas`.`Detalles_Fabricacion` (`id_detalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Huellitas`;

DELIMITER $$
USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`validar_nombre_bi_tipos_rol` BEFORE INSERT ON `Cargos` FOR EACH ROW
BEGIN
	set new.nombre = trim(new.nombre);
	set new.nombre = lcase(new.nombre);
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`ayudante_lote_au_empleado` AFTER UPDATE ON `Empleados` FOR EACH ROW
BEGIN
	declare v_id_ayudante int;
    
    select id_cargo into v_id_ayudante
    from huellitas.cargos 
    where nombre like '%ayudante%';
    
	IF OLD.id_cargo = v_id_ayudante AND NEW.id_cargo <> OLD.id_cargo THEN
		UPDATE huellitas.lotes_importe set ayudante = null
        WHERE ayudante = OLD.id_empleado;
        
        UPDATE huellitas.lotes_zapatos set ayudante = null
        WHERE ayudante = OLD.id_empleado;
    END IF;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`validar_nombre_bi_tipos_lote` BEFORE INSERT ON `Tipos_Lote` FOR EACH ROW
BEGIN
	set new.nombre = trim(new.nombre);
	set new.nombre = lcase(new.nombre);
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_ayudante_bi_lotes_importe` BEFORE INSERT ON `Lotes_Importe` FOR EACH ROW
BEGIN
	declare v_cargo int;
    declare v_id_ayudante int;
    
    select id_cargo into v_id_ayudante
    from huellitas.cargos
    where nombre like '%ayudante%';
    
    select id_cargo into v_cargo
	from huellitas.empleados 
	where id_empleado = new.ayudante;
	
	if v_cargo <> v_id_ayudante or isnull(v_cargo) = 1 then
		set new.ayudante = null;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`validar_ref_producto_bi_lotes_importe` BEFORE INSERT ON `Lotes_Importe` FOR EACH ROW
BEGIN
	declare v_tipo_lote varchar(75);
    
    select trim(nombre) into v_tipo_lote
    from huellitas.tipos_lote
    where id_tipo_lote = new.id_tipo_lote;
    
    if v_tipo_lote like '%moldes%' then
		set new.ref_producto = concat('mol-', new.ref_producto);
    end if;
    
    if v_tipo_lote like '%materiales%' then
		set new.ref_producto = concat('mat-', new.ref_producto);
    end if;
    
    if v_tipo_lote like '%suelas%' then
		set new.ref_producto = concat('sue-', new.ref_producto);
    end if;
    
    if v_tipo_lote like '%accesorios%' then
		set new.ref_producto = concat('acc-', new.ref_producto);
    end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_info_suelas` BEFORE INSERT ON `Info_Suelas` FOR EACH ROW
BEGIN
	declare v_tipo_lote int;
    declare v_id_suela int;
    declare estado condition for sqlstate '45000';
    
    select id_tipo_lote into v_id_suela
    from huellitas.tipos_lote
    where nombre like '%suelas%';
    
    select id_tipo_lote into v_tipo_lote
	from huellitas.lotes_importe 
	where id_lote = new.id_lote;
	
	if v_tipo_lote <> v_id_suela then
		signal sqlstate '45000'
		set message_text = 'El lote debe ser de tipo suelas', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_info_moldes` BEFORE INSERT ON `Info_Moldes` FOR EACH ROW
BEGIN
	declare v_tipo_lote int;
    declare v_id_molde int;
    declare estado condition for sqlstate '45000';
    
    select id_tipo_lote into v_id_molde
    from huellitas.tipos_lote
    where nombre like '%moldes%';
    
    select id_tipo_lote into v_tipo_lote
	from huellitas.lotes_importe 
	where id_lote = new.id_lote;
	
	if v_tipo_lote <> v_id_molde then
		signal sqlstate '45000'
		set message_text = 'El lote debe ser de tipo moldes', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_tallas_bi_referencias_zapatos` BEFORE INSERT ON `Referencias_Zapatos` FOR EACH ROW
BEGIN
    declare v_talla_min float;
    declare v_talla_max float;
    declare estado condition for sqlstate '45000';
    
    select talla_min, talla_max into v_talla_min, v_talla_max
    from huellitas.disenos
    where id_diseno = new.id_diseno;
    
	if (new.talla between v_talla_min and v_talla_max) = 0 then
		signal sqlstate '45000'
		set message_text = 'La talla no está en el rango de tallas elegidas en el diseño', mysql_errno = 45000;
    end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_ayudante_bi_lotes_zapatos` BEFORE INSERT ON `Lotes_Zapatos` FOR EACH ROW
BEGIN
	declare v_cargo int;
    declare v_id_ayudante int;
    
    select id_cargo into v_cargo
	from huellitas.empleados 
	where id_empleado = new.ayudante;
	
    select id_cargo into v_id_ayudante
    from huellitas.cargos
    where nombre like '%ayudante%';
    
	if v_cargo <> v_id_ayudante or isnull(v_cargo) = 1 then
		set new.ayudante = null;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_maestro_bi_grupo_diseno` BEFORE INSERT ON `Grupo_Diseno` FOR EACH ROW
BEGIN
	declare v_cargo_empleado int;
    declare v_id_cargo int;
    declare estado condition for sqlstate '45000';
    
    select id_cargo into v_id_cargo
    from huellitas.cargos
    where nombre like '%maestro%';
    
    select id_cargo into v_cargo_empleado
	from huellitas.empleados 
	where id_empleado = new.id_maestro;
    
    if v_cargo_empleado <> v_id_cargo then
		signal sqlstate '45000'
		set message_text = 'El empleado con el ID registrado no tiene el cargo de maestro', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_cortador_bi_trozos_material` BEFORE INSERT ON `Trozos_Material` FOR EACH ROW
BEGIN
	declare v_cargo int;
    declare v_id_cortador int;
    declare estado condition for sqlstate '45000';
    
    select id_cargo into v_id_cortador
    from huellitas.cargos
    where nombre like '%cortador%';
    
    select id_cargo into v_cargo
	from huellitas.empleados 
	where id_empleado = new.cortador;
	
	if v_cargo <> v_id_cortador then
		signal sqlstate '45000'
		set message_text = 'El cargo del empleado no corresponde a cortador', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_trozos_material` BEFORE INSERT ON `Trozos_Material` FOR EACH ROW
BEGIN
	declare v_id_material int;
	declare v_id_tipo_lote int;
    declare estado condition for sqlstate '45000';
    
    select id_tipo_lote into v_id_material
    from huellitas.tipos_lote
    where nombre like '%materiales%';
    
    select id_tipo_lote into v_id_tipo_lote
    from huellitas.lotes_importe
    where id_lote = new.id_lote_material;
    
    if v_id_tipo_lote <> v_id_material then
		signal sqlstate '45000'
		set message_text = 'El lote debe ser de tipo materiales', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_accesorios_diseno` BEFORE INSERT ON `Accesorios_diseno` FOR EACH ROW
BEGIN
    declare v_tipo_lote int;
    declare v_id_accesorio int;
    declare estado condition for sqlstate '45000';
    
    select id_tipo_lote into v_id_accesorio
    from huellitas.tipos_lote
    where nombre like '%accesorios%';
    
    select id_tipo_lote into v_tipo_lote
	from huellitas.lotes_importe 
	where id_lote = new.id_lote;
    
	if v_tipo_lote <> v_id_accesorio then
		signal sqlstate '45000'
		set message_text = 'El lote debe ser de tipo accesorios', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_accesorios_bi_accesorios_diseno` BEFORE INSERT ON `Accesorios_diseno` FOR EACH ROW
BEGIN
	declare v_cantidad_disponible int;
    declare v_cantidad_diseno int;
    declare v_cantidad_utilizada int;
    declare estado condition for sqlstate '45000';
    
    select cantidad into v_cantidad_disponible
    from huellitas.lotes_importe
    where id_lote = new.id_lote;
    
    select cantidad_accesorios into v_cantidad_diseno
    from huellitas.disenos
    where id_diseno = new.id_diseno;
    
    select sum(cantidad) into v_cantidad_utilizada
    from huellitas.accesorios_diseno
    where id_diseno = new.id_diseno;
    
    if new.cantidad > v_cantidad_disponible then
		signal sqlstate '45000'
		set message_text = 'La cantidad a utilizar es mayor a la disponible', mysql_errno = 45000;
	end if;
    
    if new.cantidad > v_cantidad_diseno then
		signal sqlstate '45000'
		set message_text = 'La cantidad a utilizar es mayor a la especificada en el diseño', mysql_errno = 45000;
    end if;
    
    if v_cantidad_utilizada = v_cantidad_diseno then
		signal sqlstate '45000'
		set message_text = 'Cantidad total de accesorios alcanzada', mysql_errno = 45000;
    end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_empleados_bi_detalles_fabricacion` BEFORE INSERT ON `Detalles_Fabricacion` FOR EACH ROW
BEGIN
	declare v_maestro int;
    declare v_ayudante int;
    declare v_id_ayudante int;
    declare v_id_maestro int;
    declare estado condition for sqlstate '45000';
    
    select id_cargo into v_id_maestro
    from huellitas.cargos
    where nombre like '%maestro%';
    
    select id_cargo into v_id_ayudante
    from huellitas.cargos
    where nombre like '%ayudante%';
    
    select id_cargo into v_maestro
	from huellitas.empleados 
	where id_empleado = new.id_maestro;
	
    select id_cargo into v_ayudante
	from huellitas.empleados 
	where id_empleado = new.id_ayudante;
    
	if v_maestro <> v_id_maestro then
		signal sqlstate '45000'
		set message_text = 'El empleado del campo maestro no tiene el respectivo cargo', mysql_errno = 45000;
	end if;
    
    if v_ayudante <> v_id_ayudante then
		signal sqlstate '45000'
		set message_text = 'El empleado del campo ayudante no tiene el respectivo cargo', mysql_errno = 45000;
    end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_tallas_bi_detalles_fabricacion` BEFORE INSERT ON `Detalles_Fabricacion` FOR EACH ROW
BEGIN
	declare v_talla_zapato float;
	declare v_id_info_molde float;
    declare v_id_info_suela float;
	declare v_talla_molde float;
    declare v_talla_suela float;
    declare estado condition for sqlstate '45000';
    
    select talla into v_talla_zapato
    from huellitas.referencias_zapatos
    where ref_zapato = new.ref_zapato;
    
    select id_info_molde into v_id_info_molde
    from huellitas.moldes
    where id_molde = new.id_molde;
    
    select talla into v_talla_molde
    from huellitas.info_moldes 
    where id_info_molde = v_id_info_molde;
    
    select id_info_suela into v_id_info_suela
    from huellitas.suelas
    where id_suela = new.id_suela;
    
    select talla into v_talla_suela
    from huellitas.info_suelas
    where id_info_suela = v_id_info_suela;
    
	if (v_talla_molde <> v_talla_zapato) or (v_talla_suela <> v_talla_zapato) then
		signal sqlstate '45000'
		set message_text = 'La talla del molde y suela debe ser igual a la talla del zapato', mysql_errno = 45000;
    end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_zapatos` BEFORE INSERT ON `Zapatos` FOR EACH ROW
BEGIN
	declare v_ref_zapato int;
    declare v_ref_zapato_lote int;
    declare estado condition for sqlstate '45000';
	
    select ref_zapato into v_ref_zapato
    from huellitas.detalles_fabricacion
    where id_detalle = new.id_detalle;
    
    select ref_zapato into v_ref_zapato_lote
    from huellitas.lotes_zapatos
    where id_lote = new.id_lote;
    
    if v_ref_zapato <> v_ref_zapato_lote  then
		signal sqlstate '45000'
		set message_text = 'El lote no contiene zapatos de la respectiva referencia', mysql_errno = 45000;
    end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_materiales_diseno` BEFORE INSERT ON `Materiales_Diseno` FOR EACH ROW
BEGIN
	declare v_id_material int;
	declare v_id_tipo_lote int;
    declare estado condition for sqlstate '45000';
    
    select id_tipo_lote into v_id_material
    from huellitas.tipos_lote
    where nombre like '%materiales%';
    
    select id_tipo_lote into v_id_tipo_lote
    from huellitas.lotes_importe
    where id_lote = new.id_lote_material;
    
    if v_id_tipo_lote <> v_id_material then
		signal sqlstate '45000'
		set message_text = 'El lote debe ser de tipo materiales', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_material_bi_trozos_fabricacion` BEFORE INSERT ON `Trozos_Fabricacion` FOR EACH ROW
BEGIN
	declare v_material_trozo int;
    declare v_ref_zapato int;
    declare v_id_diseno int;
    declare estado condition for sqlstate '45000';
    
    select id_lote_material into v_material_trozo
    from huellitas.trozos_material
    where ref_trozo = new.ref_trozo;
    
    select ref_zapato into v_ref_zapato
    from huellitas.detalles_fabricacion
    where id_detalle = new.id_detalle_fabricacion;
    
    select id_diseno into v_id_diseno
    from huellitas.referencias_zapatos
    where ref_zapato = v_ref_zapato;
    
    if v_material_trozo not in (select id_lote_material
								from huellitas.materiales_diseno
                                where id_diseno = v_id_diseno)
		then
			signal sqlstate '45000'
			set message_text = 'El trozo no es de algún material elegido para el diseño', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_cantidad_trozos_bi_trozos_fabricacion` BEFORE INSERT ON `Trozos_Fabricacion` FOR EACH ROW
BEGIN
	declare v_cantidad_trozos int;
    declare v_cantidad_usada int;
    declare v_ref_zapato int;
    declare v_id_diseno int;
    declare estado condition for sqlstate '45000';
    
    select ref_zapato into v_ref_zapato
    from huellitas.detalles_fabricacion
    where id_detalle = new.id_detalle_fabricacion;
    
    select id_diseno into v_id_diseno
    from huellitas.referencias_zapatos
    where ref_zapato = v_ref_zapato;
    
    select cantidad_trozos into v_cantidad_trozos
    from huellitas.disenos
    where id_diseno = v_id_diseno;
	
    select sum(cantidad) into v_cantidad_usada
    from huellitas.trozos_fabricacion
    where id_detalle_fabricacion = new.id_detalle_fabricacion;
    
    if new.cantidad > v_cantidad_trozos then
		signal sqlstate '45000'
		set message_text = 'La cantidad a utilizar es mayor a la especificada en el diseño', mysql_errno = 45000;
    end if;
    
    if v_cantidad_usada = v_cantidad_trozos then
		signal sqlstate '45000'
		set message_text = 'Cantidad total de trozos alcanzada', mysql_errno = 45000;
    end if;
END$$

DELIMITER ;