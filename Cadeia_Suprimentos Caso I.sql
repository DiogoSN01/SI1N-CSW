create schema cadeia_suprimentos;

use cadeia_suprimentos;

create table if not exists fornecedores(
forn_cod  int primary key,
forn_nome varchar(45) not null,
forn_end varchar(45) not null,
forn_pais varchar(45) not null,
forn_tel int(15) not null,
forne_cont int
);


create table if not exists produtos(
prod_cod int primary key,
prod_nome varchar(45) not null,
prod_desc varchar(45) not null,
prod_esptec varchar(45) not null,
prod_unimed varchar(45) not null,
prod_procou varchar(45) not null,
prod_quant int,
prod_estoquemin int,
prod_local varchar(45) not null
);


create table if not exists pedidos(
ped_cod int primary key,
ped_data date not null,
ped_hora time not null,
ped_prev time not null,
ped_stat varchar(45),
ped_forn_cod int not null,
constraint fk_forn foreign key(ped_forn_cod)
references ped_forn_Cod(forn_cod)
);


create table if not exists recebimentos(
receb_data date not null,
receb_hora time not null,
receb_quant_prod int not null,
receb_condicao_mat varchar(45),
constraint fk_ped foreign key(pedidos)
references pedidos(ped_cod)
);


create table if not exists filiais(
fili_cod int primary key,
fili_nome varchar(45),
fili_end varchar(45),
fili_capac_arm int not null
);

create table if not exists fornecedores_produtos(
constraint fk_forn foreign key(fornecedores)
references fornecedores(forn_cod),
Constraint fk_prod foreign key(produtos)
references produtos(prod_cod)
);


create table if not exists pedidos_produtos(
Constraint fk_prod foreign key(produto)
references produtos(prod_cod),
constraint fk_ped foreign key(pedidos)
references pedidos(ped_cod)
);


create table if not exists produtos_filiais(
Constraint fk_prod foreign key(produto)
references produtos(prod_cod),
constraint fk_fili foreign key(filial)
references filial(fili_cod)
);




	