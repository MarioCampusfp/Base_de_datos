create user amelia identified by "1234";

drop user amelia;

create user "amelia"@"localhost" identified by "1234";

grant select
on animales.animal
to "amelia"@"localhost";