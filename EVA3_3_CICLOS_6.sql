delimiter $$
create function potencia_repeat(base int, expo int)
returns int deterministic
	begin
		declare potencia int default 1;
        declare cont int default 1;
        
        repeat
			set potencia = potencia * base;
			set cont = cont + 1;
        until cont > expo end repeat;
    
		return potencia;
	end$$
delimiter ;