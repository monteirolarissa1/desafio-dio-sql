-- CRIAÇÃO DO BANCO
CREATE DATABASE IF NOT EXISTS cenario_vendas;
USE cenario_vendas;

-- cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Pnome VARCHAR(10),
    Nome_do_meio VARCHAR(3),
    Sobrenome VARCHAR(45),
    CPF CHAR(11),
    endereco VARCHAR(45),
    Data_de_Nascimento DATE,
    Municipio VARCHAR(45),
    Estado VARCHAR(45)
);

-- pedido
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    Status_do_pedido ENUM('Pendente','Concluído','Cancelado'),
    descricao VARCHAR(100),
    Frete FLOAT,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- produto
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    Categoria VARCHAR(45),
    Descrição VARCHAR(100),
    Valor FLOAT
);

-- produto e pedido
CREATE TABLE Produto_pedido (
    Produto_idProduto INT,
    Pedido_idPedido INT,
    Quantidade INT,
    Status ENUM('Ativo','Pendente','Entregue','Cancelado'),
    PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- terceiro e vendedor
CREATE TABLE `Terceiro_Vendedor` (
    idTerceiro INT PRIMARY KEY,
    Razao_Social VARCHAR(45),
    Local VARCHAR(45),
    Nome_Fantasia VARCHAR(45),
    CNPJ CHAR(14),
    CPF CHAR(11)
);

-- produtos e vendedor
CREATE TABLE Produtos_vendedor (
    idSeller INT PRIMARY KEY,
    Produto_idProduto INT,
    Quantidade INT,
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    Razao_Social VARCHAR(45),
    CNPJ CHAR(14),
    Contato VARCHAR(45)
);

-- produto fornecedor
CREATE TABLE Produto_fornecedor (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    Local VARCHAR(45),
    Quantidade INT
);

-- produto em estoque
CREATE TABLE Produto_em_Estoque (
    Produto_idProduto INT,
    Estoque_idEstoque INT,
    Localizacao INT,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

-- Avaliações
CREATE TABLE Avaliacoes (
    idAvaliacao INT AUTO_INCREMENT PRIMARY KEY,
    Pedido VARCHAR(45),
    Produto VARCHAR(45),
    Nota INT,
    Pedido_Cliente_idCliente INT,
    FOREIGN KEY (Pedido_Cliente_idCliente) REFERENCES Cliente(idCliente)
);


-- CLIENTE
INSERT INTO Cliente VALUES
(1,'Ana','M','Souza','11111111111','Rua A, 123','1990-01-10','São Paulo','SP'),
(2,'Bruno','C','Silva','22222222222','Av B, 456','1988-03-25','Campinas','SP'),
(3,'Carlos','R','Oliveira','33333333333','Rua C, 789','1995-06-12','Sorocaba','SP'),
(4,'Daniela','P','Santos','44444444444','Rua D, 101','1992-09-15','Londrina','PR'),
(5,'Eduardo','G','Lima','55555555555','Rua E, 202','1999-11-01','Curitiba','PR'),
(6,'Fernanda','L','Costa','66666666666','Av F, 303','1987-07-23','Joinville','SC'),
(7,'Gabriel','T','Pereira','77777777777','Rua G, 404','1993-02-08','Florianópolis','SC'),
(8,'Helena','B','Rodrigues','88888888888','Av H, 505','1991-12-19','Pelotas','RS'),
(9,'Igor','M','Souza','99999999999','Rua I, 606','1997-08-09','Porto Alegre','RS'),
(10,'Juliana','S','Ferreira','10101010101','Rua J, 707','1990-04-14','Blumenau','SC');

-- PEDIDO
INSERT INTO Pedido VALUES
(1,'Pendente','Pedido de 2 produtos',25.50,1),
(2,'Concluído','Compra via site',30.00,2),
(3,'Concluído','Compra via app',22.90,3),
(4,'Pendente','Pedido promocional',40.10,4),
(5,'Cancelado','Compra cancelada',0.00,5),
(6,'Concluído','Pedido fidelidade',35.50,6),
(7,'Pendente','Compra de reposição',28.75,7),
(8,'Concluído','Pedido rápido',19.90,8),
(9,'Pendente','Compra agendada',42.00,9),
(10,'Concluído','Pedido express',33.80,10);

-- PRODUTO
INSERT INTO Produto VALUES
(1,'Alimento','Pacote de arroz 5kg',20.00),
(2,'Bebida','Garrafa de suco 1L',8.50),
(3,'Limpeza','Sabão em pó 2kg',15.00),
(4,'Higiene','Shampoo 400ml',12.90),
(5,'Alimento','Feijão carioca 1kg',7.50),
(6,'Bebida','Refrigerante 2L',9.00),
(7,'Higiene','Creme dental 90g',4.90),
(8,'Limpeza','Detergente líquido',3.50),
(9,'Alimento','Macarrão 500g',5.80),
(10,'Bebida','Café torrado 500g',18.00);

-- PRODUTO/PEDIDO
INSERT INTO Produto_pedido VALUES
(1,1,2,'Ativo'),
(2,1,1,'Ativo'),
(3,2,1,'Entregue'),
(4,3,2,'Entregue'),
(5,4,1,'Pendente'),
(6,5,1,'Cancelado'),
(7,6,3,'Entregue'),
(8,7,2,'Pendente'),
(9,8,1,'Entregue'),
(10,9,4,'Pendente');

-- TERCEIRO / VENDEDOR
INSERT INTO `Terceiro_Vendedor` VALUES
(1,'Distribuidora Alfa','São Paulo','Alfa LTDA','12345678000111',''),
(2,'Atacadista Beta','Campinas','Beta Atacado','23456789000122',''),
(3,'Comercial Gama','Sorocaba','Gama Comercial','34567890000133',''),
(4,'Distribuidora Delta','Curitiba','Delta LTDA','45678900000144',''),
(5,'Vendas Épsilon','Londrina','Épsilon Vendas','56789000000155',''),
(6,'Comércio Zeta','Florianópolis','Zeta Comércio','67890000000166',''),
(7,'Distribuidora Eta','Pelotas','Eta LTDA','78900000000177',''),
(8,'Atacado Teta','Porto Alegre','Teta Atacado','89000000000188',''),
(9,'Distribuidora Iota','Joinville','Iota Distribuidora','90000000000199',''),
(10,'Varejo Kappa','Blumenau','Kappa Varejo','01000000000100','');

-- PRODUTOS_VENDEDOR
INSERT INTO Produtos_vendedor VALUES
(1,1,200),
(2,2,300),
(3,3,150),
(4,4,220),
(5,5,500),
(6,6,250),
(7,7,180),
(8,8,210),
(9,9,160),
(10,10,190);

-- FORNECEDOR
INSERT INTO Fornecedor VALUES
(1,'Fornecedor Alfa','11111111000111','(11) 99999-1111'),
(2,'Fornecedor Beta','22222222000122','(11) 99999-2222'),
(3,'Fornecedor Gama','33333333000133','(11) 99999-3333'),
(4,'Fornecedor Delta','44444444000144','(11) 99999-4444'),
(5,'Fornecedor Épsilon','55555555000155','(11) 99999-5555'),
(6,'Fornecedor Zeta','66666666000166','(11) 99999-6666'),
(7,'Fornecedor Eta','77777777000177','(11) 99999-7777'),
(8,'Fornecedor Teta','88888888000188','(11) 99999-8888'),
(9,'Fornecedor Iota','99999999000199','(11) 99999-9999'),
(10,'Fornecedor Kappa','10101010000100','(11) 99999-0000');

-- PRODUTO_FORNECEDOR
INSERT INTO Produto_fornecedor VALUES
(1,1,1000),
(2,2,800),
(3,3,600),
(4,4,700),
(5,5,900),
(6,6,750),
(7,7,500),
(8,8,950),
(9,9,850),
(10,10,650);

-- ESTOQUE
INSERT INTO Estoque VALUES
(1,'Centro SP',500),
(2,'Campinas',400),
(3,'Curitiba',600),
(4,'Florianópolis',300),
(5,'Porto Alegre',550),
(6,'Londrina',350),
(7,'Joinville',450),
(8,'Pelotas',200),
(9,'Blumenau',370),
(10,'Sorocaba',250);

-- PRODUTO_EM_ESTOQUE
INSERT INTO Produto_em_Estoque VALUES
(1,1,100),
(2,2,200),
(3,3,300),
(4,4,400),
(5,5,500),
(6,6,600),
(7,7,700),
(8,8,800),
(9,9,900),
(10,10,1000);

-- AVALIAÇÕES
INSERT INTO Avaliacoes (Pedido, Produto, Nota, Pedido_Cliente_idCliente) VALUES
('1','1',9,1),
('2','2',10,2),
('3','3',8,3),
('4','4',7,4),
('5','5',6,5),
('6','6',9,6),
('7','7',8,7),
('8','8',10,8),
('9','9',7,9),
('10','10',9,10);


show tables;

