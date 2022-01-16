-- *************** PUNTO 4 ****************

/*
 * REALIZAR UNA CONSULTA QUE PERMITA CONOCER EN QUE ZAPATOS FUE USADO
 * DETERMINADO MOLDE.
 */

-- MOLDE A CONSULTAR -> 11

SELECT m.id_molde, z.id_zapato
FROM huellitas.zapatos z, huellitas.moldes m, huellitas.detalles_fabricacion df 
WHERE m.id_molde = 11
AND df.id_molde = m.id_molde 
AND z.id_detalle = df.id_detalle;  

/*
 * REALIZAR UNA CONSULTA QUE PERMITA CONOCER QUE LOTES DE MATERIAL
 * FUERON USADOS EN LA CONSTRUCCIÓN DE UN ZAPATO.
 */

-- ZAPATO A CONSULTAR -> ID: 14

SELECT DISTINCT z.id_zapato, li.id_lote , li.descripcion as material
FROM huellitas.zapatos z, huellitas.detalles_fabricacion df, huellitas.trozos_fabricacion tf, 
	 huellitas.trozos_material tm, huellitas.lotes_importe li 
WHERE z.id_zapato = 14
AND df.id_detalle = (select id_detalle from huellitas.zapatos where id_zapato = z.id_zapato) 
AND tf.id_detalle_fabricacion = df.id_detalle
AND tm.ref_trozo = tf.ref_trozo
AND li.id_lote =tm.id_lote_material;

/*
 * REALIZAR UNA CONSULTA QUE PERMITA CONOCER CUANTOS ZAPATOS
 * SE CREARON PARA UN DISEÑO DETERMINADO.
 */

-- DISENO A CONSULTAR ->  2

SELECT COUNT(z.id_zapato) AS numero_zapatos
FROM huellitas.zapatos z, huellitas.detalles_fabricacion df, huellitas.referencias_zapatos rz, huellitas.disenos d 
WHERE d.id_diseno = 2
AND rz.id_diseno = d.id_diseno 
AND df.ref_zapato = rz.ref_zapato
AND z.id_detalle = df.id_detalle;
