-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Huellitas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Huellitas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Huellitas` DEFAULT CHARACTER SET utf8 ;
USE `Huellitas` ;

-- -----------------------------------------------------
-- Table `Huellitas`.`Tipos_Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Tipos_Rol` (
  `id_tipo_rol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `cargo` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `FK_cargo_empleado` (`cargo` ASC) INVISIBLE,
  CONSTRAINT `PK_cargo_empleado`
    FOREIGN KEY (`cargo`)
    REFERENCES `Huellitas`.`Tipos_Rol` (`id_tipo_rol`)
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
  `tipo_lote` INT NOT NULL,
  `ref_producto` VARCHAR(20) NOT NULL,
  `cantidad` INT NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  `fec_recepcion` DATE NULL,
  `fec_agotado` DATE NULL,
  `ayudante` INT NULL,
  PRIMARY KEY (`id_lote`),
  INDEX `FK_tipo_lote` (`tipo_lote` ASC) VISIBLE,
  INDEX `FK_ayudante` (`ayudante` ASC) VISIBLE,
  UNIQUE INDEX `ref_producto_UNIQUE` (`ref_producto` ASC) VISIBLE,
  CONSTRAINT `FK_tipo_lote`
    FOREIGN KEY (`tipo_lote`)
    REFERENCES `Huellitas`.`Tipos_Lote` (`id_tipo_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ayudante`
    FOREIGN KEY (`ayudante`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Materiales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Materiales` (
  `id_material` INT NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `cortador` INT NOT NULL,
  PRIMARY KEY (`id_material`),
  INDEX `FK_id_lote_mat` (`id_lote` ASC) VISIBLE,
  INDEX `FK_id_cortador_idx` (`cortador` ASC) VISIBLE,
  CONSTRAINT `FK_id_lote_mat`
    FOREIGN KEY (`id_lote`)
    REFERENCES `Huellitas`.`Lotes_Importe` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_cortador`
    FOREIGN KEY (`cortador`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Accesorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Accesorios` (
  `id_accesorio` INT NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  PRIMARY KEY (`id_accesorio`),
  INDEX `FK_id_lote_acc` (`id_lote` ASC) VISIBLE,
  CONSTRAINT `FK_id_lote_acc`
    FOREIGN KEY (`id_lote`)
    REFERENCES `Huellitas`.`Lotes_Importe` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Info_Suelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Info_Suelas` (
  `id_info_suelas` INT NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `talla` FLOAT NOT NULL,
  PRIMARY KEY (`id_info_suelas`),
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
    REFERENCES `Huellitas`.`Info_Suelas` (`id_info_suelas`)
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
  `nombre` VARCHAR(45) NULL,
  `id_molde` INT NOT NULL,
  `id_suela` INT NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_diseno`),
  INDEX `FK_id_molde_di` (`id_molde` ASC) VISIBLE,
  INDEX `FK_id_suela_di` (`id_suela` ASC) VISIBLE,
  CONSTRAINT `FK_id_molde`
    FOREIGN KEY (`id_molde`)
    REFERENCES `Huellitas`.`Moldes` (`id_molde`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_suela`
    FOREIGN KEY (`id_suela`)
    REFERENCES `Huellitas`.`Suelas` (`id_suela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Lotes_Zapatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Lotes_Zapatos` (
  `id_lote` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NULL,
  `fec_elaborado` DATE NULL,
  `fec_salida` DATE NULL,
  `ref_zapato` INT NOT NULL,
  `ayudante` INT NULL,
  PRIMARY KEY (`id_lote`),
  INDEX `FK_ref_diseno` (`ref_zapato` ASC) INVISIBLE,
  INDEX `FK_id_ayudante_idx` (`ayudante` ASC) VISIBLE,
  CONSTRAINT `FK_ref_lote_zapato`
    FOREIGN KEY (`ref_zapato`)
    REFERENCES `Huellitas`.`Disenos` (`id_diseno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_ayudante`
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
  `id_material` INT NOT NULL,
  `id_diseno` INT NOT NULL,
  `descripcion` VARCHAR(150) NULL,
  PRIMARY KEY (`id_material`, `id_diseno`),
  INDEX `FK_id_diseno_tm` (`id_diseno` ASC) VISIBLE,
  INDEX `FK_id_material_tm` (`id_material` ASC) VISIBLE,
  CONSTRAINT `FK_id_material_tm`
    FOREIGN KEY (`id_material`)
    REFERENCES `Huellitas`.`Materiales` (`id_material`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_diseno_tm`
    FOREIGN KEY (`id_diseno`)
    REFERENCES `Huellitas`.`Disenos` (`id_diseno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Accesorios_diseno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Accesorios_diseno` (
  `id_accesorio` INT NOT NULL,
  `id_diseno` INT NOT NULL,
  PRIMARY KEY (`id_accesorio`, `id_diseno`),
  INDEX `FK_id_accesorio_ad` (`id_accesorio` ASC) INVISIBLE,
  INDEX `FK_id_diseno_ad` (`id_diseno` ASC) VISIBLE,
  CONSTRAINT `Fk_id_accesorio_ad`
    FOREIGN KEY (`id_accesorio`)
    REFERENCES `Huellitas`.`Accesorios` (`id_accesorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_diseno_ad`
    FOREIGN KEY (`id_diseno`)
    REFERENCES `Huellitas`.`Disenos` (`id_diseno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Huellitas`.`Zapatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Huellitas`.`Zapatos` (
  `id_zapato` INT NOT NULL AUTO_INCREMENT,
  `id_maestro` INT NOT NULL,
  `id_ayudante` INT NOT NULL,
  `id_diseno` INT NOT NULL,
  `id_lote` INT NOT NULL,
  PRIMARY KEY (`id_zapato`),
  INDEX `FK_id_maestro_zap` (`id_maestro` ASC) VISIBLE,
  INDEX `FK_id_ayudante_zap` (`id_ayudante` ASC) VISIBLE,
  INDEX `FK_id_lote_zap` (`id_lote` ASC) VISIBLE,
  UNIQUE INDEX `id_maestro_UNIQUE` (`id_maestro` ASC) VISIBLE,
  UNIQUE INDEX `id_ayudante_UNIQUE` (`id_ayudante` ASC) VISIBLE,
  INDEX `FK_id_dise_zap` (`id_diseno` ASC) VISIBLE,
  CONSTRAINT `FK_id_maestro_zap`
    FOREIGN KEY (`id_maestro`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_ayudante_zap`
    FOREIGN KEY (`id_ayudante`)
    REFERENCES `Huellitas`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_lote_zap`
    FOREIGN KEY (`id_lote`)
    REFERENCES `Huellitas`.`Lotes_Zapatos` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_dise_zap`
    FOREIGN KEY (`id_diseno`)
    REFERENCES `Huellitas`.`Disenos` (`id_diseno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Huellitas`;

DELIMITER $$
USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`validar_nombre_bi_tipos_rol` BEFORE INSERT ON `Tipos_Rol` FOR EACH ROW
BEGIN
	set new.nombre = concat(ucase(left(new.nombre,1)),lcase(substring(new.nombre,2)));
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`ayudante_lote_au_empleado` AFTER UPDATE ON `Empleados` FOR EACH ROW
BEGIN
	DECLARE v_ayudante_tipos_lote INT;
	IF OLD.cargo = 3 AND NEW.cargo <> OLD.cargo THEN
		SELECT ayudante INTO v_ayudante_tipos_lote
        FROM huellitas.tipos_lote
        WHERE ayudante = OLD.id_empleado;
        
		UPDATE huellitas.tipos_lote set ayudante = null
        WHERE ayudante = v_ayudante_tipos_lote;
    END IF;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`validar_nombre_bi_tipos_lote` BEFORE INSERT ON `Tipos_Lote` FOR EACH ROW
BEGIN
	set new.nombre = concat(ucase(left(new.nombre,1)),lcase(substring(new.nombre,2)));
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_ayudante_bi_lotes_importe` BEFORE INSERT ON `Lotes_Importe` FOR EACH ROW
BEGIN
	declare v_cargo int;
    declare v_id_ayudante int;
    
    select id_tipo_rol into v_id_ayudante
    from huellitas.tipos_rol
    where nombre like 'Ayudante';
    
    select cargo into v_cargo
	from huellitas.empleados 
	where id_empleado = new.ayudante;
	
	if v_cargo <> v_id_ayudante or isnull(v_cargo) = 1 then
		set new.ayudante = null;
	end if;
    
    if new.tipo_lote = 1 then
		set new.ref_producto = concat('mol-', new.ref_producto);
    end if;
    
    if new.tipo_lote = 2 then
		set new.ref_producto = concat('mat-', new.ref_producto);
    end if;
    
    if new.tipo_lote = 3 then
		set new.ref_producto = concat('sue-', new.ref_producto);
    end if;
    
    if new.tipo_lote = 4 then
		set new.ref_producto = concat('acc-', new.ref_producto);
    end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_materiales` BEFORE INSERT ON `Materiales` FOR EACH ROW
BEGIN
	declare v_tipo_lote int;
    declare v_rol_empleado int;
    declare v_id_cortador int;
    declare v_id_material int;
    declare estado condition for sqlstate '45000';
    
	select id_tipo_rol into v_id_cortador
    from huellitas.tipos_rol 
    where nombre like 'Cortador'; 
    
    select id_tipo_lote into v_id_material
    from huellitas.tipos_lote
    where nombre like 'Materiales';
    
    select tipo_lote into v_tipo_lote
	from huellitas.lotes_importe 
	where id_lote = new.id_lote;
	
    select cargo into v_rol_empleado
    from huellitas.empleados
    where cargo = new.cortador;
    
	if v_tipo_lote <> v_id_material then
		signal sqlstate '45000'
		set message_text = 'El lote debe ser de tipo materiales', mysql_errno = 45000;
	end if;
    
    if v_rol_empleado <> v_id_cortador then
		signal sqlstate '45000'
		set message_text = 'El rol del empleado debe ser cortador', mysql_errno = 45000;
    end if; 
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_accesorios` BEFORE INSERT ON `Accesorios` FOR EACH ROW
BEGIN
	declare v_tipo_lote int;
    declare estado condition for sqlstate '45000';
    select tipo_lote into v_tipo_lote
	from huellitas.lotes_importe 
	where id_lote = new.id_lote;
	
	if v_tipo_lote <> 4 then
		signal sqlstate '45000'
		set message_text = 'El lote debe ser de tipo accesorios', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_info_su` BEFORE INSERT ON `Info_Suelas` FOR EACH ROW
BEGIN
	declare v_tipo_lote int;
    declare v_id_suela int;
    declare estado condition for sqlstate '45000';
    
    select id_tipo_lote into v_id_suela
    from huellitas.tipos_lote
    where nombre like 'Suelas';
    
    select tipo_lote into v_tipo_lote
	from huellitas.lotes_importe 
	where id_lote = new.id_lote;
	
	if v_tipo_lote <> v_id_suela then
		signal sqlstate '45000'
		set message_text = 'El lote debe ser de tipo suelas', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_lote_bi_info_mo` BEFORE INSERT ON `Info_Moldes` FOR EACH ROW
BEGIN
	declare v_tipo_lote int;
    declare v_id_molde int;
    
    select id_tipo_lote into v_id_molde
    from hullitas.tipos_lote
    where nombre like '%Moldes%';
    
    select tipo_lote into v_tipo_lote
	from huellitas.lotes_importe 
	where id_lote = new.id_lote;
	
	if v_tipo_lote <> v_id_molde then
		signal sqlstate '45000'
		set message_text = 'El lote debe ser de tipo moldes', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_tallas_bi_disenos` BEFORE INSERT ON `Disenos` FOR EACH ROW
BEGIN
    declare v_id_info_molde int;
    declare v_id_info_suela int;
	declare v_talla_molde float;
    declare v_talla_suela float;
    declare estado condition for sqlstate '45000';
    
    select id_info_molde into v_id_info_molde
    from huellitas.moldes
    where id_molde = new.id_molde;
    
    select id_info_suela into v_id_info_suela
    from huellitas.suelas
    where id_suela = new.id_suela;
    
    select talla into v_talla_molde
    from huellitas.info_moldes 
    where id_info_molde = v_id_info_moldes;
    
    select talla into v_talla_suela
    from huellitas.info_suelas
    where id_info_suela = v_id_info_suela;
    
	if v_talla_molde <> v_talla_suela then
		signal sqlstate '45000'
		set message_text = 'La talla entre molde y suela no coinciden', mysql_errno = 45000;
    end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_ayudante_bi_lotes_zapatos` BEFORE INSERT ON `Lotes_Importe` FOR EACH ROW
BEGIN
	declare v_cargo int;
    declare v_id_ayudante int;
    
    select cargo into v_cargo
	from huellitas.empleados 
	where id_empleado = new.ayudante;
	
    select id_tipo_rol into v_id_ayudante
    from huellitas.tipos_rol
    where nombre like 'Ayudante';
    
	if v_cargo <> v_id_ayudante or isnull(v_cargo) = 1 then
		set new.ayudante = null;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_maestro_bi_grudis` BEFORE INSERT ON `Grupo_Diseno` FOR EACH ROW
BEGIN
	declare v_maestro int;
    declare estado condition for sqlstate '45000';
    
    select cargo into v_maestro
	from huellitas.empleados 
	where id_empleado = new.id_maestro;
    
    if v_maestro <> 1 then
		signal sqlstate '45000'
		set message_text = 'El empleado con el ID registrado no tiene el cargo de maestro', mysql_errno = 45000;
	end if;
END$$

USE `Huellitas`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Huellitas`.`verificar_empleados_bi_zapatos` BEFORE INSERT ON `Zapatos` FOR EACH ROW
BEGIN
	declare v_maestro int;
    declare v_ayudante int;
    declare v_id_ayudante int;
    declare v_id_maestro int;
    declare v_ref_lote int;
    declare estado condition for sqlstate '45000';
    
    select id_tipo_rol into v_id_maestro
    from tipos_rol
    where nombre like 'Maestro';
    
    select id_tipo_rol into v_id_ayudante
    from tipos_rol
    where nombre like 'Ayudante';
    
    
    select cargo into v_maestro
	from huellitas.empleados 
	where id_empleado = new.id_maestro;
	
    select cargo into v_ayudante
	from huellitas.empleados 
	where id_empleado = new.id_ayudante;
    
    select ref_lote into v_ref_lote
	from huellitas.empleados 
	where id_lote = new.id_lote;
    
	if v_maestro <> v_id_maestro then
		signal sqlstate '45000'
		set message_text = 'El empleado con el ID del campo maestro no tiene el respectivo cargo', mysql_errno = 45000;
	end if;
    
    if v_ayudante <> v_id_ayudante then
		signal sqlstate '45000'
		set message_text = 'El empleado con el ID del campo ayudante no tiene el respectivo cargo', mysql_errno = 45000;
    end if;
    
    if v_ref_lote <> new.id_diseno  then
		signal sqlstate '45000'
		set message_text = 'El lote no contiene zapatos del respectivo diseño', mysql_errno = 45000;
    end if;
    
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
