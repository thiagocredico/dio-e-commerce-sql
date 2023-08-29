-- Visualizando informações do Banco de dados 'ecommerce'

-- Visualização simples e direta para verificar se as tabelas foram criadas e populadas corretamente

SELECT * FROM clients;
SELECT * FROM product;
SELECT * FROM payments;
SELECT * FROM orders;
SELECT * FROM stock;
SELECT * FROM suplier;
SELECT * FROM productSeller;
SELECT * FROM productOrder;
SELECT * FROM productSuplier;
SELECT * FROM productStock;


-- CLIENTES

-- Quantos clientes temos?
select count(*) as Quantity from clients;

-- Quais pedidos foram feitos por quais clientes?
select concat(FName, ' ', MInit, ' ', LName) as ClientName, CPF, Address, OrderStatus, OrderDescription, Freight
	from clients c, orders o 
	where c.IdClient = o.IdClient
    order by OrderStatus, ClientName;  -- Separar por Status e visualizar ordenado por nome
    
-- Quanto cada cliente gastou com frete?
select concat(FName, ' ', MInit, ' ', LName) as ClientName, CPF, sum(Freight) as FreightSum
	from clients c
    left outer join orders o
		on c.IdClient = o.IdClient
	group by c.IdClient
    order by ClientName;

-- PEDIDOS

-- Quantos pedidos foram realizados?
select count(*) as OrderCount
	from orders;

-- Qual a quantidade de pedidos 'Em processamento' em contrapartida aos 'Confirmado's?
select OrderStatus, count(OrderStatus) as StatusCount
	from clients c, orders o 
	where c.IdClient = o.IdClient
    group by OrderStatus;
    
-- Qual a quantidade de pedidos por Categoria de produto?
select Category, count(IdOrder) as OrderCount
	from productOrder po
	inner join product p
		on po.IdProduct = p.IdProduct
	group by Category
    order by OrderCount desc;

-- PAGAMENTO

-- Qual a(s) forma(s) de pagamento mais usada(s)?
select TypePayment, count(*) as TypeCount
    from payments p
    group by TypePayment
    order by TypeCount desc;

-- Que tipo de pagamento cada cliente tem?
select concat(FName, ' ', MInit, ' ', LName) as ClientName, CPF, TypePayment, LimitAvailable
	from payments p
    inner join clients c
		on p.IdClient = c.IdClient;
        
-- Qual o Limite médio que cada cliente tem?
select concat(FName, ' ', MInit, ' ', LName) as ClientName, CPF, avg(LimitAvailable) as AverageBalanceLimit
	from payments p
    inner join clients c
		on p.IdClient = c.IdClient
	group by c.IdClient
    order by AverageBalanceLimit desc;

-- PRODUTOS

-- Qual é o produto mais vendido?
select PName, Category, count(*) as SoldAmount
	from product p
    inner join productOrder po
		on p.IdProduct = po.IdProduct
	group by p.IdProduct
    order by SoldAmount desc;

-- Qual o produto com menor quantidade nos estoques?
select PName, Category, sum(Quantity) as QuantitySumByProduct
	from product p
    inner join productStock ps
		on p.IdProduct = ps.IdProduct
	group by p.IdProduct
	order by QuantitySumByProduct;
    
-- Qual o produto com menor quantidade em determinado estoque?
select Location, PName, Category, sum(Quantity) as QuantitySumByProduct
	from product p
    inner join productStock ps
		on p.IdProduct = ps.IdProduct
	inner join stock s
		on s.IdStock = ps.IdStock
	where Location = 'Estoque Central' or Location = 'Estoque Principal'
	group by s.IdStock, p.IdProduct
	order by QuantitySumByProduct;
    
-- Qual a categoria de produto que cada fornecedo oferece?
select CorporateName, Category
	from product p
    inner join productSuplier ps
		on p.IdProduct = ps.IdProduct
	inner join suplier s
		on s.IdSuplier = ps.IdSuplier
	group by Category, CorporateName;
    
-- Quais os fornecedores de 'Eletrônico's?
select CorporateName, Category
	from product p
    inner join productSuplier ps
		on p.IdProduct = ps.IdProduct
	inner join suplier s
		on s.IdSuplier = ps.IdSuplier
	where Category = 'Eletrônico'
	group by Category, CorporateName;

-- RECEITA

-- Quanto foi gasto com frete?
select sum(Freight) as FreightSum from orders;

-- Qual a receita total gerada?
select round(sum(Category * Price), 2) as PriceSum
	from product p
    inner join productOrder po
		on p.IdProduct = po.IdProduct;

-- Qual a receita gerada por cada produto?
select PName, Category, round(sum(Category * Price), 2) as PriceSum
	from product p
    inner join productOrder po
		on p.IdProduct = po.IdProduct
	group by p.IdProduct
    order by PriceSum desc;
