delimiter $$
create function potencia_while(base int, expo int)
returns int deterministic
	begin
		declare potencia int default 1;
        declare cont int default 1;
        
        while cont <= expo do
			set potencia = potencia * base;
			set cont = cont + 1;
		end while;
        
        return potencia;
	end $$
delimiter ;