create table users 
(
	id int not null identity(1,1),
	user_name varchar(20) not null,
	sur_name varchar(30) not null, 
	email varchar(100) not null,
	user_password varchar(100) not null,
	cpf char(11) not null,
	income decimal(10,2),
	expenses decimal(10,2),
	balance decimal(10,2),
	gender char(1) not null,
	created_at datetime default getdate(),
	constraint PK_users primary key(id), 
	constraint U_email unique(email),
	constraint U_cpf unique(cpf),
	constraint CHK_gender check(gender in ('M', 'F'))
)
GO
create table recurrentBill (
    id int identity(1,1) primary key,
    id_user int not null,

    title varchar(80) not null,          -- Ex: Netflix / Financiamento Carro
    description varchar(120),

    amount decimal(10,2) not null,       -- valor da parcela
    recurrence_type char(1) not null,    -- 'M' mensal, 'Y' anual, 'I' parcelas

    total_installments int,              -- para parcelamentos
    paid_installments int default 0,

    start_date datetime not null,
    end_date datetime,                   -- null = recorrência infinita

    is_active bit not null default 1,

    constraint FK_rec_exp_user foreign key(id_user) references users(id),
    constraint CHK_recurrence_type check (recurrence_type in ('M','Y','I'))
);
GO
create table pots 
(
	id int not null identity(1,1),
	title varchar(50) not null,
	target_value decimal(10,2) not null,
	current_value decimal(10,2) not null,
	id_user int not null,
	created_at datetime default getdate(),
	constraint PK_pot primary key(id),
	constraint FK_user foreign key(id_user) references users(id)

)
create table userTransactions
(
	id int not null identity(1,1),
	id_user int not null,
	title varchar(50) not null,
	description_tran varchar(80) not null,
	value decimal(10,2) not null,
	creation_date datetime not null,
	pay_date datetime not null,
	is_recurrent bit not null,
	id_recbill int,
	is_pot_tran bit not null,
	id_pot int,
	constraint PK_tran primary key(id),
	constraint FK_recbill foreign key(id_recbill) references recurrentBill(id),
	constraint FK_userTran foreign key(id_user) references users(id),
	constraint FK_pot foreign key(id_pot) references pots(id)
)
GO
create table budgets
(
	id int not null identity(1,1),
	title varchar(20) not null,
	expendedValue decimal(10,2) not null,
	limit_Value decimal(10,2) not null,
	id_user int not null,
	created_at datetime default getdate(),
	constraint PK_budget primary key(id),
	constraint FK_user_bgt foreign key(id_user) references users(id)
)
GO
