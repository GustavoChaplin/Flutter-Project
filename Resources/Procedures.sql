create procedure pCreateUser
	@fname varchar(20),
	@lname varchar(30),
	@email varchar(100),
	@cpf char(11),
	@gender char(1),
	@password varchar(100)
as
begin
	set nocount ON;
	begin try
		begin tran
			insert into users (user_name, sur_name, email, user_password, gender, cpf, created_at)
				values (@fname, @lname, @email, @password, @gender, @cpf, GETDATE());
			
			commit tran;

	end try
	begin catch 
		rollback tran;
		throw;
	end catch
end
GO

create procedure pLoginUser 
	@CPF char(11),
	@Password varchar(100)
as
begin
	if exists(
		select top 1 1 from users u
		where u.cpf = @CPF
		and u.user_password = @Password
	)
	begin
		return 1;	
	end

	else
	begin
		return 0;
	end
end

GO

CREATE procedure pDeleteUser
	@id int
as
begin
	set nocount ON;
	begin try
		begin tran
			delete
			from users 
			where id = @id
			DBCC CHECKIDENT ('users', RESEED, 0);
			commit tran;

	end try
	begin catch 
		rollback tran;
		throw;
	end catch
end
GO
create procedure pGetUser
	@id int
as
begin
	set nocount ON;
	begin try
		begin tran
			select
				*
			from users
			where id = @id;
			commit tran;

	end try
	begin catch 
		rollback tran;
		throw;
	end catch
end
GO
create procedure pCreatePot
	@title varchar(50),
	@t_value decimal(10,2),
	@id_user int
as
begin
	set nocount ON;
	begin try
		begin tran

			declare 
			@c_value decimal(10,2) = 0;

			insert into pots(title, target_value, current_value, id_user, created_at)
				values(@title, @t_value, @c_value, @id_user, GETDATE())
			commit
	end try
	begin catch
		rollback;
		throw;
	end catch
end;
GO
create procedure pGetPot
	@id int,
	@id_user int
as 
begin
	set nocount ON;
	begin try	
		select * from pots where id = @id and id_user = @id_user
	end try
	begin catch
		throw;
	end catch
end;
GO
create procedure pGetPots
	@id_user int
as 
begin
	set nocount on;
	begin try
		select * from pots where id_user = @id_user
	end try
	begin catch
		throw;
	end catch
end;
GO
create procedure pUpdatePot
	@id int,
	@title varchar(50),
	@t_value decimal(10,2),
	@c_value decimal(10,2),
	@id_user int
as 
begin
	set nocount on;
	begin try
		begin tran
			update pots
				set title = isnull(@title, title),
					target_value = isnull(@t_value, target_value),
					current_value = isnull(@c_value, current_value)
			where id = @id
				and id_user = @id_user
		commit
	end try
	begin catch
		rollback;
		throw;
	end catch
end;
GO
create procedure pDeletePot
	@id int,
	@id_user int
as 
begin
	set nocount on;
	begin try
		begin tran
			delete from pots
			where id = @id 
				and id_user = @id_user
		commit
	end try
	begin catch
		rollback;
		throw;
	end catch
end;