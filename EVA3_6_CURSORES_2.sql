delimiter $$
create procedure contar_paises(out cont int)
	begin
		declare terminar int default false; -- salir del ciclo
        declare id varchar(2); -- 
		
        declare cuenta_paises cursor for 
        select country_id from countries; -- almacernar el cursos
        
		declare continue handler for not found -- excepcion
			
            begin
				set terminar = true;
            end;
        
        open cuenta_paises; -- abrir cursor
		set cont = 0; -- inicializar conteo
        contar_p: loop
			fetch cuenta_paises into id;
            set cont = cont + 1;
            if terminar then
				leave contar_p;
			end if;
		end loop;
        
    end$$
delimiter ;