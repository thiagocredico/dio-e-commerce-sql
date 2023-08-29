-- Criação de banco de dados para cenário de E-commerce
-- drop database ecommerce;

create database ecommerce;
use ecommerce;

-- Criar tabela de cliente
create table clients(
	IdClient int auto_increment primary key,
    FName varchar(10),
    MInit char(3),
    LName varchar(20),
    CPF char(11) not null,
    Address varchar(45),
    DateOfBirth date not null,
    constraint unique_cpf_client unique(CPF)
);
alter table clients auto_increment = 1;

-- Criar tabela de produto
create table product(
	IdProduct int auto_increment primary key,
    PName varchar(20) not null,
    Classification_kids bool default false,
    Category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    Rating float default 0,
    Size varchar(10),  -- Dimenssão do produto
    Price float not null
);
alter table product auto_increment = 1;

-- Alteração do size
desc product;
alter table product
	modify column Size varchar(15);

-- Criar tabela de pagamentos
create table payments(
    IdPayment int auto_increment primary key,
	IdClient int,
    TypePayment enum('Boleto', 'Cartão', 'Dois cartões', 'Pix'),
    LimitAvailable float,
    constraint fk_payments_clients
		foreign key (IdClient) references clients(IdClient)
);
alter table payments auto_increment = 1;

-- Criar tabela de pedido
create table orders(
	IdOrder int auto_increment primary key,
    IdClient int,
    IdPayment int,
    OrderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    OrderDescription varchar(255),
    Freight float default 10,  -- Frete
    PaymentCash bool default false,  -- Caso não precise registrar a forma de pagamento
    constraint fk_orders_clients
		foreign key (IdClient) references clients(IdClient),
    constraint fk_orders_payments
		foreign key (IdPayment) references payments(IdPayment)
);
alter table orders auto_increment = 1;

-- Criar tabela de estoque
create table stock(
	IdStock int auto_increment primary key,
    Location varchar(255)
);
alter table stock auto_increment = 1;

-- Criar tabela de fornecedor
create table suplier(
	IdSuplier int auto_increment primary key,
    CorporateName varchar(255) not null,
    CNPJ char(15) not null,
    Contact char(11) not null,
    constraint unique_cnpj_suplier unique(CNPJ),
    constraint unique_corp_name_suplier unique(CorporateName)
);
alter table suplier auto_increment = 1;

-- Criar tabela de vendedor
create table seller(
	IdSeller int auto_increment primary key,
    CorporateName varchar(255) not null,
    TradeName varchar(255) not null,
    CNPJ char(15),
    CPF char(11),
    Location varchar(255),
    Contact char(11) not null,
    constraint unique_cnpj_seller unique(CNPJ),
    constraint unique_cpf_seller unique(CPF),
	constraint unique_corp_name_seller unique(CorporateName)
);
alter table seller auto_increment = 1;

-- Criar tabela da relação entre produto e vendedor
create table productSeller (
	IdProductSeller int auto_increment primary key,  -- Usando um ID para PK pois o vendedor pode vender o mesmo produto várias vezes (PK composta complicaria essa possibilidade)
    IdProduct int,
    IdSeller int,
    Quantity int not null,
    constraint fk_productSeller_product
		foreign key (IdProduct) references product(IdProduct),
	constraint fk_productSeller_seller
		foreign key (IdSeller) references seller(IdSeller)
);
alter table productSeller auto_increment = 1;

-- Criar tabela da relação entre produto e pedido
create table productOrder (
    IdProduct int,
    IdOrder int,
    Quantity int not null,
    POStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (IdProduct, IdOrder),
    constraint fk_productOrder_product
		foreign key (IdProduct) references product(IdProduct),
	constraint fk_productOrder_order
		foreign key (IdOrder) references orders(IdOrder)
);

-- Criar tabela da relação entre produto e fornecedor
create table productSuplier (
	IdProductSuplier int auto_increment primary key,
    IdProduct int,
    IdSuplier int,
    Quantity int not null,
    constraint fk_productSuplier_product
		foreign key (IdProduct) references product(IdProduct),
	constraint fk_productSuplier_suplier
		foreign key (IdSuplier) references suplier(IdSuplier)
);
alter table productSuplier auto_increment = 1;

-- Criar tabela da relação entre produto e estoque
create table productStock (
    IdProduct int,
    IdStock int,
	Quantity int default 0,
    primary key (IdProduct, IdStock),
    constraint fk_productStock_product
		foreign key (IdProduct) references product(IdProduct),
	constraint fk_productStock_stock
		foreign key (IdStock) references stock(IdStock)
);
