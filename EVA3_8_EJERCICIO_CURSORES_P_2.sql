delimiter $$
create function generar_rfc(nombre varchar(255), apellido_pat varchar(255), apellido_mat varchar(255))
returns varchar(13)
deterministic
	begin
		declare rfc varchar(13);
		
		set apellido_pat = UPPER(apellido_pat);
		set apellido_mat = UPPER(coalesce(apellido_mat, 'X'));
		set nombre = UPPER(nombre);

		set rfc = CONCAT(
			SUBSTRING(apellido_pat, 1, 2),
			SUBSTRING(apellido_mat, 1, 1),
			SUBSTRING(nombre, 1, 1),
			DATE_FORMAT(CURDATE(), '%Y%m%d')
		);

		return rfc;
	end$$

delimiter ;