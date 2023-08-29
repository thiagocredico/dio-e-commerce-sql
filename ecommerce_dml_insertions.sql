-- Populando Banco de Dados 'ecommerce'

-- DADOS FICTÍCIOS GERADOS POR IA

-- Inserir dados fictícios na tabela clients
INSERT INTO clients (FName, MInit, LName, CPF, Address, DateOfBirth)
VALUES
    ('João', 'A.', 'Silva', '12345678901', 'Rua A, 123', '1990-05-15'),
    ('Maria', 'B.', 'Santos', '23456789012', 'Avenida B, 456', '1985-09-20'),
    ('Pedro', 'C.', 'Oliveira', '34567890123', 'Travessa C, 789', '1995-02-10'),
    ('Ana', 'D.', 'Pereira', '45678901234', 'Praça D, 987', '2000-11-30'),
    ('Lucas', 'E.', 'Rodrigues', '56789012345', 'Estrada E, 654', '1992-07-25');

-- Inserir dados fictícios na tabela product
INSERT INTO product (PName, Classification_kids, Category, Rating, Size, Price)
VALUES
    ('Celular', false, 'Eletrônico', 4.5, '15x7x0.8 cm', 899.99),
    ('Camiseta', true, 'Vestimenta', 3.8, 'M', 29.99),
    ('Carrinho', true, 'Brinquedos', 4.2, '20x15x10 cm', 19.99),
    ('Chocolate', true, 'Alimentos', 4.0, '12x5x1 cm', 2.99),
    ('Sofá', false, 'Móveis', 4.7, '180x80x70 cm', 499.99),
    ('Notebook', false, 'Eletrônico', 4.8, '35x25x2 cm', 1299.99),
    ('Vestido', true, 'Vestimenta', 4.5, 'L', 49.99),
    ('Quebra-Cabeça', true, 'Brinquedos', 4.6, '30x30 cm', 9.99),
    ('Arroz', true, 'Alimentos', 3.5, '20x10x5 cm', 1.99),
    ('Cadeira', false, 'Móveis', 4.3, '40x40x80 cm', 89.99),
    ('Fone de Ouvido', false, 'Eletrônico', 4.4, '20x15x6 cm', 59.99);

-- Inserir dados fictícios na tabela payments
INSERT INTO payments (IdClient, TypePayment, LimitAvailable)
VALUES
    (1, 'Boleto', 500),
    (2, 'Cartão', 1000),
    (3, 'Pix', 750),
    (4, 'Dois cartões', 1500),
    (5, 'Cartão', 200),
    (1, 'Boleto', 300),
    (3, 'Pix', 100),
    (2, 'Dois cartões', 600),
    (5, 'Boleto', 150),
    (4, 'Pix', 800);

-- Inserir dados fictícios na tabela orders
INSERT INTO orders (IdClient, IdPayment, OrderStatus, OrderDescription, Freight, PaymentCash)
VALUES
    (1, 1, 'Confirmado', 'Pedido de celular', 15, false),
    (2, 2, 'Em processamento', 'Pedido de camiseta e vestido', 20, false),
    (3, 3, 'Confirmado', 'Pedido de brinquedos', 10, false),
    (4, null, 'Em processamento', 'Pedido de chocolate e arroz', 10, true),
    (5, 5, 'Confirmado', 'Pedido de sofá', 30, false),
    (1, 6, 'Em processamento', 'Pedido de notebook', 25, false),
    (3, 7, 'Confirmado', 'Pedido de quebra-cabeça', 8, false),
    (2, 8, 'Em processamento', 'Pedido de fone de ouvido', 12, false),
    (5, 9, 'Confirmado', 'Pedido de cadeira', 20, false),
    (4, 10, 'Em processamento', 'Pedido de carrinho', 15, false);

-- Inserir dados fictícios na tabela stock
INSERT INTO stock (Location)
VALUES
    ('Depósito A'),
    ('Depósito B'),
    ('Depósito C'),
    ('Estoque Principal'),
    ('Depósito D'),
    ('Depósito E'),
    ('Estoque Secundário'),
    ('Depósito F'),
    ('Estoque Central'),
    ('Depósito G');

-- Inserir dados fictícios na tabela suplier
INSERT INTO suplier (CorporateName, CNPJ, Contact)
VALUES
    ('Fornecedor A', '12345678901234', '98765432101'),
    ('Fornecedor B', '23456789012345', '87654321012'),
    ('Fornecedor C', '34567890123456', '76543210923'),
    ('Fornecedor D', '45678901234567', '65432109834'),
    ('Fornecedor E', '56789012345678', '54321098745'),
    ('Fornecedor F', '67890123456789', '43210987656'),
    ('Fornecedor G', '78901234567890', '32109876567'),
    ('Fornecedor H', '89012345678901', '21098765478'),
    ('Fornecedor I', '90123456789012', '10987654389'),
    ('Fornecedor J', '01234567890123', '09876543290');

-- Inserir dados fictícios na tabela seller
INSERT INTO seller (CorporateName, TradeName, CNPJ, CPF, Location, Contact)
VALUES
    ('Vendedor A', 'VendA', '12345678901234', '98765432101', 'Rua A, 123, Bairro A, Cidade A', '87654321012'),
    ('Vendedor B', 'VendB', '23456789012345', '87654321012', 'Rua B, 368, Bairro B, Cidade B', '76543210923'),
    ('Vendedor C', 'VendC', '34567890123456', '76543210923', 'Rua C, 635, Bairro C, Cidade C', '65432109834'),
    ('Vendedor D', 'VendD', '45678901234567', '65432109834', 'Rua D, 365, Bairro D, Cidade D', '54321098745'),
    ('Vendedor E', 'VendE', '56789012345678', '54321098745', 'Rua E, 354, Bairro E, Cidade E', '43210987656'),
    ('Vendedor F', 'VendF', '67890123456789', '43210987656', 'Rua F, 368, Bairro F, Cidade F', '32109876567'),
    ('Vendedor G', 'VendG', '78901234567890', '32109876567', 'Rua G, 299, Bairro G, Cidade G', '21098765478'),
    ('Vendedor H', 'VendH', '89012345678901', '21098765478', 'Rua H, 684, Bairro H, Cidade H', '10987654389'),
    ('Vendedor I', 'VendI', '90123456789012', '10987654389', 'Rua I, 951, Bairro I, Cidade I', '09876543290'),
    ('Vendedor J', 'VendJ', '01234567890123', '09876543290', 'Rua J, 356, Bairro J, Cidade J', '98765432101');

-- Inserir dados fictícios na tabela productSeller
INSERT INTO productSeller (IdProduct, IdSeller, Quantity)
VALUES
    (1, 1, 10),
    (2, 2, 20),
    (3, 3, 15),
    (4, 4, 30),
    (5, 5, 25),
    (6, 6, 12),
    (7, 7, 18),
    (8, 8, 8),
    (9, 9, 5),
    (10, 10, 40),
    (1, 2, 5),
    (2, 3, 8),
    (3, 4, 3),
    (4, 5, 15),
    (5, 6, 10),
    (6, 7, 6),
    (7, 8, 10),
    (8, 9, 4),
    (9, 10, 2),
    (10, 1, 25);

-- Inserir dados fictícios na tabela productOrder
INSERT INTO productOrder (IdProduct, IdOrder, Quantity, POStatus)
VALUES
    (1, 1, 2, 'Disponível'),
    (2, 1, 1, 'Disponível'),
    (3, 1, 5, 'Disponível'),
    (4, 2, 3, 'Sem estoque'),
    (5, 2, 4, 'Disponível'),
    (6, 3, 1, 'Disponível'),
    (7, 3, 2, 'Disponível'),
    (8, 4, 2, 'Disponível'),
    (9, 4, 1, 'Disponível'),
    (10, 5, 3, 'Disponível'),
    (1, 5, 2, 'Disponível'),
    (2, 6, 1, 'Disponível'),
    (3, 6, 4, 'Disponível'),
    (4, 6, 1, 'Sem estoque'),
    (5, 7, 2, 'Disponível'),
    (6, 7, 3, 'Disponível'),
    (7, 7, 1, 'Disponível'),
    (8, 8, 2, 'Disponível'),
    (9, 8, 2, 'Disponível'),
    (10, 9, 1, 'Disponível');

-- Inserir dados fictícios na tabela productSuplier
INSERT INTO productSuplier (IdProduct, IdSuplier, Quantity)
VALUES
    (1, 1, 50),
    (2, 2, 30),
    (3, 3, 40),
    (4, 4, 25),
    (5, 5, 15),
    (6, 6, 20),
    (7, 7, 10),
    (8, 8, 35),
    (9, 9, 5),
    (10, 10, 60),
    (1, 2, 20),
    (2, 3, 10),
    (3, 4, 15),
    (4, 5, 5),
    (5, 6, 8),
    (6, 7, 15),
    (7, 8, 5),
    (8, 9, 25),
    (9, 10, 3),
    (10, 1, 30);

-- Inserir dados fictícios na tabela productStock
INSERT INTO productStock (IdProduct, IdStock, Quantity)
VALUES
    (1, 1, 20),
    (2, 2, 15),
    (3, 3, 25),
    (4, 4, 10),
    (5, 5, 5),
    (6, 6, 18),
    (7, 7, 8),
    (8, 8, 30),
    (9, 9, 3),
    (10, 10, 40),
    (1, 2, 10),
    (2, 3, 8),
    (3, 4, 12),
    (4, 5, 3),
    (5, 6, 4),
    (6, 7, 9),
    (7, 8, 2),
    (8, 9, 20),
    (9, 10, 1),
    (10, 1, 25);
