delimiter $$
create procedure actualizar_rfc()
	
    begin
		declare done int default false;
		declare _id int;
		declare _nombre varchar(255);
		declare _apellido_pat varchar(255);
		declare _apellido_mat varchar(255);
		declare cur cursor for select id, nombre, apellido_pat, apellido_mat from personas where clave_rfc is null;
		declare continue handler for not found set done = true;

		open cur;

		read_loop: loop
			fetch cur into _id, _nombre, _apellido_pat, _apellido_mat;
			if done then
				leave read_loop;
			end if;

			update personas set clave_rfc = generar_rfc(_nombre, _apellido_pat, _apellido_mat) where id = _id;
		end loop;

		close cur;
	end $$

delimiter ;