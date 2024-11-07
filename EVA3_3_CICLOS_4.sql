delimiter $$
create function potencia_loop(base int, expo int)
returns int deterministic
	begin
		declare potencia int default 1;
        declare cont int default 1;
        
        ciclo: loop
			set potencia = potencia * base;
			set cont = cont + 1;
        
			if cont > expo then
				leave ciclo;
			end if;
        end loop ciclo;
        
        return potencia;
	end$$
delimiter ;