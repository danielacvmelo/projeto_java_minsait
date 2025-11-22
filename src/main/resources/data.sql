-- Categorias
INSERT INTO tb_categories (id, name) VALUES (1, 'Eletrônicos') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_categories (id, name) VALUES (2, 'Livros e Educação') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_categories (id, name) VALUES (3, 'Casa e Cozinha') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_categories (id, name) VALUES (4, 'Moda e Acessórios') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_categories (id, name) VALUES (5, 'Esportes e Lazer') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_categories (id, name) VALUES (6, 'Beleza e Perfumaria') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_categories (id, name) VALUES (7, 'Games e Consoles') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_categories (id, name) VALUES (8, 'Alimentos e Bebidas') ON CONFLICT (id) DO NOTHING;

--Usuários
INSERT INTO tb_users (id, name, email, password, role)
VALUES (1, 'Admin', 'admin@loja.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN')
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_users (id, name, email, password, role)
VALUES (2, 'Cliente João', 'joao@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'USER')
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_users (id, name, email, password, role)
VALUES (3, 'Vendedor Carlos', 'vendedor@loja.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'SELLER')
ON CONFLICT (id) DO NOTHING;

-- Produtos Categoria 1: Eletrônicos
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (1, 'ELET-001', 'Smartphone Samsung S24', 4500.00, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (2, 'ELET-002', 'Notebook Dell Inspiron', 3200.00, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (3, 'ELET-003', 'Monitor LG Ultrawide', 1200.00, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (4, 'ELET-004', 'Mouse Logitech MX', 350.00, 1) ON CONFLICT (id) DO NOTHING;

-- Produtos Categoria 2: Livros e Educação
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (5, 'BOOK-001', 'Código Limpo', 90.00, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (6, 'BOOK-002', 'Arquitetura Limpa', 85.00, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (7, 'BOOK-003', 'Domain Driven Design', 120.00, 2) ON CONFLICT (id) DO NOTHING;

-- Produtos Categoria 3: Casa e Cozinha
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (8, 'CASA-001', 'AirFryer Mondial', 400.00, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (9, 'CASA-002', 'Cafeteira Nespresso', 600.00, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (10, 'CASA-003', 'Robô Aspirador', 1500.00, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (11, 'CASA-004', 'Jogo de Panelas', 250.00, 3) ON CONFLICT (id) DO NOTHING;

-- Produtos Categoria 4: Moda e Acessórios
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (12, 'MODA-001', 'Camiseta Básica Preta', 49.90, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (13, 'MODA-002', 'Tênis Nike Revolution', 399.00, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (14, 'MODA-003', 'Calça Jeans Levis', 250.00, 4) ON CONFLICT (id) DO NOTHING;

-- Produtos Categoria 5: Esportes e Lazer
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (15, 'SPORT-001', 'Bola de Futebol', 80.00, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (16, 'SPORT-002', 'Raquete de Tênis', 450.00, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (17, 'SPORT-003', 'Halteres 5kg', 120.00, 5) ON CONFLICT (id) DO NOTHING;

-- Produtos Categoria 6: Beleza e Perfumaria
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (18, 'BELE-001', 'Perfume Chanel', 800.00, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (19, 'BELE-002', 'Kit Skincare', 150.00, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (20, 'BELE-003', 'Secador de Cabelo', 220.00, 6) ON CONFLICT (id) DO NOTHING;

-- Produtos Categoria 7: Games e Consoles
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (21, 'GAME-001', 'PlayStation 5', 3800.00, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (22, 'GAME-002', 'Nintendo Switch', 2100.00, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (23, 'GAME-003', 'Jogo Zelda', 300.00, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (24, 'GAME-004', 'Controle Xbox', 450.00, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (25, 'GAME-005', 'Cadeira Gamer', 1200.00, 7) ON CONFLICT (id) DO NOTHING;

-- Produtos Categoria 8: Alimentos e Bebidas
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (26, 'FOOD-001', 'Chocolate Importado', 25.00, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (27, 'FOOD-002', 'Café Gourmet', 40.00, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (28, 'FOOD-003', 'Azeite de Oliva', 35.00, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (29, 'FOOD-004', 'Vinho Tinto', 80.00, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_products (id, barcode, name, price, category_id) VALUES (30, 'FOOD-005', 'Whey Protein', 150.00, 8) ON CONFLICT (id) DO NOTHING;

-- Estoque
INSERT INTO tb_stock (id, product_id, quantity) VALUES (1, 1, 20) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (2, 2, 15) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (3, 3, 10) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (4, 4, 50) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (5, 5, 100) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (6, 6, 80) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (7, 7, 30) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (8, 8, 12) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (9, 9, 18) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (10, 10, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (11, 11, 25) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (12, 12, 200) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (13, 13, 40) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (14, 14, 60) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (15, 15, 50) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (16, 16, 10) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (17, 17, 15) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (18, 18, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (19, 19, 20) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (20, 20, 10) ON CONFLICT (id) DO NOTHING;

-- Estoque baixo
INSERT INTO tb_stock (id, product_id, quantity) VALUES (21, 21, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (22, 22, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (23, 23, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (24, 24, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (25, 25, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (26, 26, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (27, 27, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (28, 28, 0) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (29, 29, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_stock (id, product_id, quantity) VALUES (30, 30, 4) ON CONFLICT (id) DO NOTHING;

SELECT setval(pg_get_serial_sequence('tb_categories', 'id'), (SELECT MAX(id) FROM tb_categories));
SELECT setval(pg_get_serial_sequence('tb_users', 'id'), (SELECT MAX(id) FROM tb_users));
SELECT setval(pg_get_serial_sequence('tb_products', 'id'), (SELECT MAX(id) FROM tb_products));
SELECT setval(pg_get_serial_sequence('tb_stock', 'id'), (SELECT MAX(id) FROM tb_stock));