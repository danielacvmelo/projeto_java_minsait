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

INSERT INTO tb_users (id, name, email, password, role)
VALUES (4, 'Cliente Gabriel', 'gabriel@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'USER')
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_users (id, name, email, password, role)
VALUES (5, 'Cliente Ana', 'ana@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'USER')
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_users (id, name, email, password, role)
VALUES (6, 'Cliente Paula', 'paula@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'USER')
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

-- Promoções globais
INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (1, 'PROMO10', 'GLOBAL', NULL, 'PERCENTAGE', 100, 15, '2025-01-01 00:00:00', '2025-12-31 23:59:59', 10.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (2, 'BLACKFRIDAY', 'GLOBAL', NULL, 'PERCENTAGE', 500, 120, '2025-11-20 00:00:00', '2025-11-30 23:59:59', 25.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (3, 'NATAL2025', 'GLOBAL', NULL, 'FIXED_VALUE', 200, 45, '2025-12-01 00:00:00', '2025-12-25 23:59:59', 50.00)
ON CONFLICT (id) DO NOTHING;

-- Promoções por categoria
INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (4, 'ELETRO15', 'CATEGORY', 1, 'PERCENTAGE', 100, 30, '2025-06-01 00:00:00', '2025-06-30 23:59:59', 15.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (5, 'LIVROS20', 'CATEGORY', 2, 'PERCENTAGE', 80, 12, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 20.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (6, 'CASA100', 'CATEGORY', 3, 'FIXED_VALUE', 50, 8, '2025-07-01 00:00:00', '2025-07-31 23:59:59', 100.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (7, 'MODA30', 'CATEGORY', 4, 'PERCENTAGE', 150, 25, '2025-05-01 00:00:00', '2025-05-31 23:59:59', 30.00)
ON CONFLICT (id) DO NOTHING;

-- Promoções por produto específico
INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (8, 'SAMSUNG500', 'PRODUCT', 1, 'FIXED_VALUE', 20, 5, '2025-08-01 00:00:00', '2025-08-31 23:59:59', 500.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (9, 'PS5DESC', 'PRODUCT', 21, 'PERCENTAGE', 30, 10, '2025-09-01 00:00:00', '2025-09-30 23:59:59', 10.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (10, 'AIRFRYER50', 'PRODUCT', 8, 'FIXED_VALUE', 40, 15, '2025-04-01 00:00:00', '2025-04-30 23:59:59', 50.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_promotions (id, code, scope, target_id, type, usage_limit, used_count, valid_from, valid_to, value)
VALUES (11, 'NIKE50', 'PRODUCT', 13, 'FIXED_VALUE', 60, 22, '2025-02-01 00:00:00', '2025-02-28 23:59:59', 50.00)
ON CONFLICT (id) DO NOTHING;

-- Carrinho
-- Carrinho 1 com promoção PROMO10
INSERT INTO tb_carts (id, discount_value, total_price, applied_promotion_id)
VALUES (1, 450.00, 4050.00, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_carts (id, discount_value, total_price, applied_promotion_id)
VALUES (2, 00, 399.00, NULL)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_carts (id, discount_value, total_price, applied_promotion_id)
VALUES (3, 375, 1125.00, 2)
ON CONFLICT (id) DO NOTHING;

-- Itens Carrinho
-- Carrinho 1: Smartphone Samsung S24
INSERT INTO tb_cart_items (id, quantity, cart_id, product_id)
VALUES (1, 2, 1, 3)
ON CONFLICT (id) DO NOTHING;

-- Carrinho 2: Tênis Nike
INSERT INTO tb_cart_items (id, quantity, cart_id, product_id)
VALUES (2, 1, 2, 13)
ON CONFLICT (id) DO NOTHING;

-- Carrinho 3: Robô Aspirador
INSERT INTO tb_cart_items (id, quantity, cart_id, product_id)
VALUES (3, 1, 3, 10)
ON CONFLICT (id) DO NOTHING;

-- Product Stats
-- Stats do Smartphone Samsung (produto mais vendido)
INSERT INTO tb_product_stats (product_id, average_rating, review_count, rating_1, rating_2, rating_3, rating_4, rating_5)
VALUES (1, 5.0, 1, 0, 0, 0, 0, 1);

-- Stats do Robô Aspirador
INSERT INTO tb_product_stats (product_id, average_rating, review_count, rating_1, rating_2, rating_3, rating_4, rating_5)
VALUES (10, 3.0, 1, 0, 0, 1, 0, 0);

-- Stats do Tênis Nike
INSERT INTO tb_product_stats (product_id, average_rating, review_count, rating_1, rating_2, rating_3, rating_4, rating_5)
VALUES (13, 5.0, 1, 0, 0, 0, 0, 1);

-- Order
INSERT INTO tb_orders (id, created_at, discount, status, total_price)
VALUES (1, '2025-11-01 10:30:00', 450.00, 'CONFIRMED', 4050.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_orders (id, created_at, discount, status, total_price)
VALUES (2, '2025-11-02 14:20:00', 0.00, 'CONFIRMED', 399.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_orders (id, created_at, discount, status, total_price)
VALUES (3, '2025-11-23 09:15:00', 375.00, 'CONFIRMED', 1125.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_orders (id, created_at, discount, status, total_price)
VALUES (4, '2025-11-24 11:00:00', 0.00, 'CONFIRMED', 4500.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_orders (id, created_at, discount, status, total_price)
VALUES (5, '2025-11-25 15:30:00', 0.00, 'CANCELED', 800.00)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tb_orders (id, created_at, discount, status, total_price)
VALUES (6, '2025-11-26 16:45:00', 0.00, 'CANCELED', 1200.00)
ON CONFLICT (id) DO NOTHING;

-- Itens Order
-- Itens Order 1: Smartphone Samsung
INSERT INTO tb_order_items (id, price_at_purchase, quantity, order_id, product_id)
VALUES (1, 4500.00, 1, 1, 1)
ON CONFLICT (id) DO NOTHING;

-- Itens Order 2: Tênis Nike
INSERT INTO tb_order_items (id, price_at_purchase, quantity, order_id, product_id)
VALUES (2, 399.00, 1, 2, 13)
ON CONFLICT (id) DO NOTHING;

-- Itens Order 3: Robô Aspirador
INSERT INTO tb_order_items (id, price_at_purchase, quantity, order_id, product_id)
VALUES (3, 1500.00, 1, 3, 10)
ON CONFLICT (id) DO NOTHING;

-- Itens Order 4: Smartphone Samsung
INSERT INTO tb_order_items (id, price_at_purchase, quantity, order_id, product_id)
VALUES (4, 4500.00, 1, 4, 1)
ON CONFLICT (id) DO NOTHING;

-- Itens Order 5: Perfume Chanel
INSERT INTO tb_order_items (id, price_at_purchase, quantity, order_id, product_id)
VALUES (5, 800.00, 1, 5, 18)
ON CONFLICT (id) DO NOTHING;

-- Itens Order 6: Cadeira Gamer
INSERT INTO tb_order_items (id, price_at_purchase, quantity, order_id, product_id)
VALUES (6, 1200.00, 1, 6, 25)
ON CONFLICT (id) DO NOTHING;

-- Reviews
-- Review produto 1 (Smartphone Samsung)
INSERT INTO tb_reviews (id, comment, created_at, order_id, rating, product_id, user_id)
VALUES (1, 'Excelente smartphone! Melhor que esperava.', '2025-11-02 18:00:00', 1, 5, 1, 2)
ON CONFLICT (id) DO NOTHING;

-- Reviews produto 13 (Tênis Nike)
INSERT INTO tb_reviews (id, comment, created_at, order_id, rating, product_id, user_id)
VALUES (2, 'Muito confortável e bonito', '2025-11-03 12:00:00', 2, 5, 13, 2)
ON CONFLICT (id) DO NOTHING;

-- Reviews produto 10 (Robô Aspirador)
INSERT INTO tb_reviews (id, comment, created_at, order_id, rating, product_id, user_id)
VALUES (3, 'Bom mas barulhento', '2025-11-25 09:45:00', 3, 3, 10, 4)
ON CONFLICT (id) DO NOTHING;

-- Usos de cupom
-- PROMO10 no pedido 1
INSERT INTO tb_coupon_usages (id, used_at, order_id, promotion_id, user_id)
VALUES (1, '2025-11-01 10:30:00', 1, 1, 2)
ON CONFLICT (id) DO NOTHING;

-- BLACKFRIDAY no pedido 3
INSERT INTO tb_coupon_usages (id, used_at, order_id, promotion_id, user_id)
VALUES (2, '2025-11-23 09:15:00', 3, 2, 4)
ON CONFLICT (id) DO NOTHING;

-- Audit Logs
-- Categories (CREATE)
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (1, 'category', 1, 'CREATE', NULL, '{"id":1,"name":"Eletrônicos"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (2, 'category', 2, 'CREATE', NULL, '{"id":2,"name":"Livros e Educação"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (3, 'category', 3, 'CREATE', NULL, '{"id":3,"name":"Casa e Cozinha"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (4, 'category', 4, 'CREATE', NULL, '{"id":4,"name":"Moda e Acessórios"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (5, 'category', 5, 'CREATE', NULL, '{"id":5,"name":"Esportes e Lazer"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (6, 'category', 6, 'CREATE', NULL, '{"id":6,"name":"Beleza e Perfumaria"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (7, 'category', 7, 'CREATE', NULL, '{"id":7,"name":"Games e Consoles"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (8, 'category', 8, 'CREATE', NULL, '{"id":8,"name":"Alimentos e Bebidas"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;

-- Users (CREATE)
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (9, 'user', 1, 'CREATE', NULL, '{"id":1,"name":"Admin","email":"admin@loja.com","role":"ADMIN"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (10, 'user', 2, 'CREATE', NULL, '{"id":2,"name":"Cliente João","email":"joao@gmail.com","role":"USER"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (11, 'user', 3, 'CREATE', NULL, '{"id":3,"name":"Vendedor Carlos","email":"vendedor@loja.com","role":"SELLER"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (12, 'user', 4, 'CREATE', NULL, '{"id":4,"name":"Cliente Gabriel","email":"gabriel@gmail.com","role":"USER"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (13, 'user', 5, 'CREATE', NULL, '{"id":5,"name":"Cliente Ana","email":"ana@gmail.com","role":"USER"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (14, 'user', 6, 'CREATE', NULL, '{"id":6,"name":"Cliente Paula","email":"paula@gmail.com","role":"USER"}', NULL, NULL, '2025-01-01 00:00:00') ON CONFLICT (id) DO NOTHING;

-- Products (CREATE) - ids 1..30
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (15, 'product', 1, 'CREATE', NULL, '{"id":1,"barcode":"ELET-001","name":"Smartphone Samsung S24","price":4500.00,"category_id":1}', 3, 'vendedor@loja.com', '2025-01-02 09:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (16, 'product', 2, 'CREATE', NULL, '{"id":2,"barcode":"ELET-002","name":"Notebook Dell Inspiron","price":3200.00,"category_id":1}', 3, 'vendedor@loja.com', '2025-01-02 09:01:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (17, 'product', 3, 'CREATE', NULL, '{"id":3,"barcode":"ELET-003","name":"Monitor LG Ultrawide","price":1200.00,"category_id":1}', 3, 'vendedor@loja.com', '2025-01-02 09:02:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (18, 'product', 4, 'CREATE', NULL, '{"id":4,"barcode":"ELET-004","name":"Mouse Logitech MX","price":350.00,"category_id":1}', 3, 'vendedor@loja.com', '2025-01-02 09:03:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (19, 'product', 5, 'CREATE', NULL, '{"id":5,"barcode":"BOOK-001","name":"Código Limpo","price":90.00,"category_id":2}', 3, 'vendedor@loja.com', '2025-01-02 09:04:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (20, 'product', 6, 'CREATE', NULL, '{"id":6,"barcode":"BOOK-002","name":"Arquitetura Limpa","price":85.00,"category_id":2}', 3, 'vendedor@loja.com', '2025-01-02 09:05:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (21, 'product', 7, 'CREATE', NULL, '{"id":7,"barcode":"BOOK-003","name":"Domain Driven Design","price":120.00,"category_id":2}', 3, 'vendedor@loja.com', '2025-01-02 09:06:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (22, 'product', 8, 'CREATE', NULL, '{"id":8,"barcode":"CASA-001","name":"AirFryer Mondial","price":400.00,"category_id":3}', 3, 'vendedor@loja.com', '2025-01-02 09:07:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (23, 'product', 9, 'CREATE', NULL, '{"id":9,"barcode":"CASA-002","name":"Cafeteira Nespresso","price":600.00,"category_id":3}', 3, 'vendedor@loja.com', '2025-01-02 09:08:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (24, 'product', 10, 'CREATE', NULL, '{"id":10,"barcode":"CASA-003","name":"Robô Aspirador","price":1500.00,"category_id":3}', 3, 'vendedor@loja.com', '2025-01-02 09:09:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (25, 'product', 11, 'CREATE', NULL, '{"id":11,"barcode":"CASA-004","name":"Jogo de Panelas","price":250.00,"category_id":3}', 3, 'vendedor@loja.com', '2025-01-02 09:10:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (26, 'product', 12, 'CREATE', NULL, '{"id":12,"barcode":"MODA-001","name":"Camiseta Básica Preta","price":49.90,"category_id":4}', 3, 'vendedor@loja.com', '2025-01-02 09:11:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (27, 'product', 13, 'CREATE', NULL, '{"id":13,"barcode":"MODA-002","name":"Tênis Nike Revolution","price":399.00,"category_id":4}', 3, 'vendedor@loja.com', '2025-01-02 09:12:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (28, 'product', 14, 'CREATE', NULL, '{"id":14,"barcode":"MODA-003","name":"Calça Jeans Levis","price":250.00,"category_id":4}', 3, 'vendedor@loja.com', '2025-01-02 09:13:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (29, 'product', 15, 'CREATE', NULL, '{"id":15,"barcode":"SPORT-001","name":"Bola de Futebol","price":80.00,"category_id":5}', 3, 'vendedor@loja.com', '2025-01-02 09:14:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (30, 'product', 16, 'CREATE', NULL, '{"id":16,"barcode":"SPORT-002","name":"Raquete de Tênis","price":450.00,"category_id":5}', 3, 'vendedor@loja.com', '2025-01-02 09:15:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (31, 'product', 17, 'CREATE', NULL, '{"id":17,"barcode":"SPORT-003","name":"Halteres 5kg","price":120.00,"category_id":5}', 3, 'vendedor@loja.com', '2025-01-02 09:16:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (32, 'product', 18, 'CREATE', NULL, '{"id":18,"barcode":"BELE-001","name":"Perfume Chanel","price":800.00,"category_id":6}', 3, 'vendedor@loja.com', '2025-01-02 09:17:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (33, 'product', 19, 'CREATE', NULL, '{"id":19,"barcode":"BELE-002","name":"Kit Skincare","price":150.00,"category_id":6}', 3, 'vendedor@loja.com', '2025-01-02 09:18:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (34, 'product', 20, 'CREATE', NULL, '{"id":20,"barcode":"BELE-003","name":"Secador de Cabelo","price":220.00,"category_id":6}', 3, 'vendedor@loja.com', '2025-01-02 09:19:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (35, 'product', 21, 'CREATE', NULL, '{"id":21,"barcode":"GAME-001","name":"PlayStation 5","price":3800.00,"category_id":7}', 3, 'vendedor@loja.com', '2025-01-02 09:20:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (36, 'product', 22, 'CREATE', NULL, '{"id":22,"barcode":"GAME-002","name":"Nintendo Switch","price":2100.00,"category_id":7}', 3, 'vendedor@loja.com', '2025-01-02 09:21:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (37, 'product', 23, 'CREATE', NULL, '{"id":23,"barcode":"GAME-003","name":"Jogo Zelda","price":300.00,"category_id":7}', 3, 'vendedor@loja.com', '2025-01-02 09:22:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (38, 'product', 24, 'CREATE', NULL, '{"id":24,"barcode":"GAME-004","name":"Controle Xbox","price":450.00,"category_id":7}', 3, 'vendedor@loja.com', '2025-01-02 09:23:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (39, 'product', 25, 'CREATE', NULL, '{"id":25,"barcode":"GAME-005","name":"Cadeira Gamer","price":1200.00,"category_id":7}', 3, 'vendedor@loja.com', '2025-01-02 09:24:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (40, 'product', 26, 'CREATE', NULL, '{"id":26,"barcode":"FOOD-001","name":"Chocolate Importado","price":25.00,"category_id":8}', 3, 'vendedor@loja.com', '2025-01-02 09:25:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (41, 'product', 27, 'CREATE', NULL, '{"id":27,"barcode":"FOOD-002","name":"Café Gourmet","price":40.00,"category_id":8}', 3, 'vendedor@loja.com', '2025-01-02 09:26:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (42, 'product', 28, 'CREATE', NULL, '{"id":28,"barcode":"FOOD-003","name":"Azeite de Oliva","price":35.00,"category_id":8}', 3, 'vendedor@loja.com', '2025-01-02 09:27:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (43, 'product', 29, 'CREATE', NULL, '{"id":29,"barcode":"FOOD-004","name":"Vinho Tinto","price":80.00,"category_id":8}', 3, 'vendedor@loja.com', '2025-01-02 09:28:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (44, 'product', 30, 'CREATE', NULL, '{"id":30,"barcode":"FOOD-005","name":"Whey Protein","price":150.00,"category_id":8}', 3, 'vendedor@loja.com', '2025-01-02 09:29:00') ON CONFLICT (id) DO NOTHING;

-- Stock (CREATE) ids 1..30
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (45, 'stock', 1, 'CREATE', NULL, '{"id":1,"product_id":1,"quantity":20}', 3, 'vendedor@loja.com', '2025-01-03 08:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (46, 'stock', 2, 'CREATE', NULL, '{"id":2,"product_id":2,"quantity":15}', 3, 'vendedor@loja.com', '2025-01-03 08:01:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (47, 'stock', 3, 'CREATE', NULL, '{"id":3,"product_id":3,"quantity":10}', 3, 'vendedor@loja.com', '2025-01-03 08:02:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (48, 'stock', 4, 'CREATE', NULL, '{"id":4,"product_id":4,"quantity":50}', 3, 'vendedor@loja.com', '2025-01-03 08:03:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (49, 'stock', 5, 'CREATE', NULL, '{"id":5,"product_id":5,"quantity":100}', 3, 'vendedor@loja.com', '2025-01-03 08:04:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (50, 'stock', 6, 'CREATE', NULL, '{"id":6,"product_id":6,"quantity":80}', 3, 'vendedor@loja.com', '2025-01-03 08:05:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (51, 'stock', 7, 'CREATE', NULL, '{"id":7,"product_id":7,"quantity":30}', 3, 'vendedor@loja.com', '2025-01-03 08:06:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (52, 'stock', 8, 'CREATE', NULL, '{"id":8,"product_id":8,"quantity":12}', 3, 'vendedor@loja.com', '2025-01-03 08:07:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (53, 'stock', 9, 'CREATE', NULL, '{"id":9,"product_id":9,"quantity":18}', 3, 'vendedor@loja.com', '2025-01-03 08:08:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (54, 'stock', 10, 'CREATE', NULL, '{"id":10,"product_id":10,"quantity":7}', 3, 'vendedor@loja.com', '2025-01-03 08:09:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (55, 'stock', 11, 'CREATE', NULL, '{"id":11,"product_id":11,"quantity":25}', 3, 'vendedor@loja.com', '2025-01-03 08:10:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (56, 'stock', 12, 'CREATE', NULL, '{"id":12,"product_id":12,"quantity":200}', 3, 'vendedor@loja.com', '2025-01-03 08:11:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (57, 'stock', 13, 'CREATE', NULL, '{"id":13,"product_id":13,"quantity":40}', 3, 'vendedor@loja.com', '2025-01-03 08:12:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (58, 'stock', 14, 'CREATE', NULL, '{"id":14,"product_id":14,"quantity":60}', 3, 'vendedor@loja.com', '2025-01-03 08:13:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (59, 'stock', 15, 'CREATE', NULL, '{"id":15,"product_id":15,"quantity":50}', 3, 'vendedor@loja.com', '2025-01-03 08:14:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (60, 'stock', 16, 'CREATE', NULL, '{"id":16,"product_id":16,"quantity":10}', 3, 'vendedor@loja.com', '2025-01-03 08:15:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (61, 'stock', 17, 'CREATE', NULL, '{"id":17,"product_id":17,"quantity":15}', 3, 'vendedor@loja.com', '2025-01-03 08:16:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (62, 'stock', 18, 'CREATE', NULL, '{"id":18,"product_id":18,"quantity":8}', 3, 'vendedor@loja.com', '2025-01-03 08:17:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (63, 'stock', 19, 'CREATE', NULL, '{"id":19,"product_id":19,"quantity":20}', 3, 'vendedor@loja.com', '2025-01-03 08:18:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (64, 'stock', 20, 'CREATE', NULL, '{"id":20,"product_id":20,"quantity":10}', 3, 'vendedor@loja.com', '2025-01-03 08:19:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (65, 'stock', 21, 'CREATE', NULL, '{"id":21,"product_id":21,"quantity":2}', 3, 'vendedor@loja.com', '2025-01-03 08:20:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (66, 'stock', 22, 'CREATE', NULL, '{"id":22,"product_id":22,"quantity":3}', 3, 'vendedor@loja.com', '2025-01-03 08:21:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (67, 'stock', 23, 'CREATE', NULL, '{"id":23,"product_id":23,"quantity":1}', 3, 'vendedor@loja.com', '2025-01-03 08:22:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (68, 'stock', 24, 'CREATE', NULL, '{"id":24,"product_id":24,"quantity":4}', 3, 'vendedor@loja.com', '2025-01-03 08:23:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (69, 'stock', 25, 'CREATE', NULL, '{"id":25,"product_id":25,"quantity":2}', 3, 'vendedor@loja.com', '2025-01-03 08:24:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (70, 'stock', 26, 'CREATE', NULL, '{"id":26,"product_id":26,"quantity":3}', 3, 'vendedor@loja.com', '2025-01-03 08:25:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (71, 'stock', 27, 'CREATE', NULL, '{"id":27,"product_id":27,"quantity":1}', 3, 'vendedor@loja.com', '2025-01-03 08:26:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (72, 'stock', 28, 'CREATE', NULL, '{"id":28,"product_id":28,"quantity":0}', 3, 'vendedor@loja.com', '2025-01-03 08:27:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (73, 'stock', 29, 'CREATE', NULL, '{"id":29,"product_id":29,"quantity":2}', 3, 'vendedor@loja.com', '2025-01-03 08:28:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (74, 'stock', 30, 'CREATE', NULL, '{"id":30,"product_id":30,"quantity":4}', 3, 'vendedor@loja.com', '2025-01-03 08:29:00') ON CONFLICT (id) DO NOTHING;

-- Promotions (CREATE) ids 1..11
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (75, 'promotion', 1, 'CREATE', NULL, '{"id":1,"code":"PROMO10","scope":"GLOBAL","target_id":null,"type":"PERCENTAGE","usage_limit":100,"used_count":15,"valid_from":"2025-01-01 00:00:00","valid_to":"2025-12-31 23:59:59","value":10.00}', 3, 'vendedor@loja.com', '2025-02-01 10:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (76, 'promotion', 2, 'CREATE', NULL, '{"id":2,"code":"BLACKFRIDAY","scope":"GLOBAL","target_id":null,"type":"PERCENTAGE","usage_limit":500,"used_count":120,"valid_from":"2025-11-20 00:00:00","valid_to":"2025-11-30 23:59:59","value":25.00}', 3, 'vendedor@loja.com', '2025-11-20 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (77, 'promotion', 3, 'CREATE', NULL, '{"id":3,"code":"NATAL2025","scope":"GLOBAL","target_id":null,"type":"FIXED_VALUE","usage_limit":200,"used_count":45,"valid_from":"2025-12-01 00:00:00","valid_to":"2025-12-25 23:59:59","value":50.00}', 3, 'vendedor@loja.com', '2025-12-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (78, 'promotion', 4, 'CREATE', NULL, '{"id":4,"code":"ELETRO15","scope":"CATEGORY","target_id":1,"type":"PERCENTAGE","usage_limit":100,"used_count":30,"valid_from":"2025-06-01 00:00:00","valid_to":"2025-06-30 23:59:59","value":15.00}', 3, 'vendedor@loja.com', '2025-06-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (79, 'promotion', 5, 'CREATE', NULL, '{"id":5,"code":"LIVROS20","scope":"CATEGORY","target_id":2,"type":"PERCENTAGE","usage_limit":80,"used_count":12,"valid_from":"2025-03-01 00:00:00","valid_to":"2025-03-31 23:59:59","value":20.00}', 3, 'vendedor@loja.com', '2025-03-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (80, 'promotion', 6, 'CREATE', NULL, '{"id":6,"code":"CASA100","scope":"CATEGORY","target_id":3,"type":"FIXED_VALUE","usage_limit":50,"used_count":8,"valid_from":"2025-07-01 00:00:00","valid_to":"2025-07-31 23:59:59","value":100.00}', 3, 'vendedor@loja.com', '2025-07-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (81, 'promotion', 7, 'CREATE', NULL, '{"id":7,"code":"MODA30","scope":"CATEGORY","target_id":4,"type":"PERCENTAGE","usage_limit":150,"used_count":25,"valid_from":"2025-05-01 00:00:00","valid_to":"2025-05-31 23:59:59","value":30.00}', 3, 'vendedor@loja.com', '2025-05-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (82, 'promotion', 8, 'CREATE', NULL, '{"id":8,"code":"SAMSUNG500","scope":"PRODUCT","target_id":1,"type":"FIXED_VALUE","usage_limit":20,"used_count":5,"valid_from":"2025-08-01 00:00:00","valid_to":"2025-08-31 23:59:59","value":500.00}', 3, 'vendedor@loja.com', '2025-08-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (83, 'promotion', 9, 'CREATE', NULL, '{"id":9,"code":"PS5DESC","scope":"PRODUCT","target_id":21,"type":"PERCENTAGE","usage_limit":30,"used_count":10,"valid_from":"2025-09-01 00:00:00","valid_to":"2025-09-30 23:59:59","value":10.00}', 3, 'vendedor@loja.com', '2025-09-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (84, 'promotion', 10, 'CREATE', NULL, '{"id":10,"code":"AIRFRYER50","scope":"PRODUCT","target_id":8,"type":"FIXED_VALUE","usage_limit":40,"used_count":15,"valid_from":"2025-04-01 00:00:00","valid_to":"2025-04-30 23:59:59","value":50.00}', 3, 'vendedor@loja.com', '2025-04-01 00:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (85, 'promotion', 11, 'CREATE', NULL, '{"id":11,"code":"NIKE50","scope":"PRODUCT","target_id":13,"type":"FIXED_VALUE","usage_limit":60,"used_count":22,"valid_from":"2025-02-01 00:00:00","valid_to":"2025-02-28 23:59:59","value":50.00}', 3, 'vendedor@loja.com', '2025-02-01 00:00:00') ON CONFLICT (id) DO NOTHING;

-- Carts (CREATE) ids 1..3
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (86, 'cart', 1, 'CREATE', NULL, '{"id":1,"discount_value":450.00,"total_price":4050.00,"applied_promotion_id":1}', 2, 'joao@gmail.com', '2025-11-01 10:29:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (87, 'cart', 2, 'CREATE', NULL, '{"id":2,"discount_value":0,"total_price":399.00,"applied_promotion_id":null}', 4, 'gabriel@gmail.com', '2025-11-02 14:19:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (88, 'cart', 3, 'CREATE', NULL, '{"id":3,"discount_value":375,"total_price":1125.00,"applied_promotion_id":2}', 4, 'gabriel@gmail.com', '2025-11-23 09:14:00') ON CONFLICT (id) DO NOTHING;

-- Cart Items (CREATE) ids 1..3
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (89, 'cart_item', 1, 'CREATE', NULL, '{"id":1,"quantity":2,"cart_id":1,"product_id":3}', 2, 'joao@gmail.com', '2025-11-01 10:29:30') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (90, 'cart_item', 2, 'CREATE', NULL, '{"id":2,"quantity":1,"cart_id":2,"product_id":13}', 4, 'gabriel@gmail.com', '2025-11-02 14:19:30') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (91, 'cart_item', 3, 'CREATE', NULL, '{"id":3,"quantity":1,"cart_id":3,"product_id":10}', 4, 'gabriel@gmail.com', '2025-11-23 09:14:30') ON CONFLICT (id) DO NOTHING;

-- Product Stats (CREATE) ids 1..8
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (92, 'product_stats', 1, 'CREATE', NULL, '{"id":1,"average_rating":5.0,"last_updated":"2025-11-02 18:00:00","review_count":1,"total_sales":1,"view_count":150,"product_id":1}', 3, 'vendedor@loja.com', '2025-11-02 18:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (93, 'product_stats', 2, 'CREATE', NULL, '{"id":2,"average_rating":0.0,"last_updated":"2025-11-24 12:00:00","review_count":0,"total_sales":0,"view_count":85,"product_id":2}', 3, 'vendedor@loja.com', '2025-11-24 12:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (94, 'product_stats', 3, 'CREATE', NULL, '{"id":3,"average_rating":0.0,"last_updated":"2025-11-24 12:00:00","review_count":0,"total_sales":0,"view_count":45,"product_id":3}', 3, 'vendedor@loja.com', '2025-11-24 12:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (95, 'product_stats', 4, 'CREATE', NULL, '{"id":4,"average_rating":3.0,"last_updated":"2025-11-25 09:45:00","review_count":1,"total_sales":1,"view_count":78,"product_id":10}', 3, 'vendedor@loja.com', '2025-11-25 09:45:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (96, 'product_stats', 5, 'CREATE', NULL, '{"id":5,"average_rating":5.0,"last_updated":"2025-11-03 12:00:00","review_count":1,"total_sales":1,"view_count":120,"product_id":13}', 3, 'vendedor@loja.com', '2025-11-03 12:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (97, 'product_stats', 6, 'CREATE', NULL, '{"id":6,"average_rating":0.0,"last_updated":"2025-11-24 12:00:00","review_count":0,"total_sales":0,"view_count":320,"product_id":21}', 3, 'vendedor@loja.com', '2025-11-24 12:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (98, 'product_stats', 7, 'CREATE', NULL, '{"id":7,"average_rating":0.0,"last_updated":"2025-11-24 12:00:00","review_count":0,"total_sales":0,"view_count":180,"product_id":22}', 3, 'vendedor@loja.com', '2025-11-24 12:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (99, 'product_stats', 8, 'CREATE', NULL, '{"id":8,"average_rating":0.0,"last_updated":"2025-11-24 12:00:00","review_count":0,"total_sales":0,"view_count":95,"product_id":8}', 3, 'vendedor@loja.com', '2025-11-24 12:00:00') ON CONFLICT (id) DO NOTHING;

-- Orders (CREATE) ids 1..6
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (100, 'order', 1, 'CREATE', NULL, '{"id":1,"created_at":"2025-11-01 10:30:00","discount":450.00,"status":"CONFIRMED","total_price":4050.00}', 2, 'joao@gmail.com', '2025-11-01 10:30:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (101, 'order', 2, 'CREATE', NULL, '{"id":2,"created_at":"2025-11-02 14:20:00","discount":0.00,"status":"CONFIRMED","total_price":399.00}', 2, 'joao@gmail.com', '2025-11-02 14:20:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (102, 'order', 3, 'CREATE', NULL, '{"id":3,"created_at":"2025-11-23 09:15:00","discount":375.00,"status":"CONFIRMED","total_price":1125.00}', 4, 'gabriel@gmail.com', '2025-11-23 09:15:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (103, 'order', 4, 'CREATE', NULL, '{"id":4,"created_at":"2025-11-24 11:00:00","discount":0.00,"status":"CONFIRMED","total_price":4500.00}', 2, 'joao@gmail.com', '2025-11-24 11:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (104, 'order', 5, 'CREATE', NULL, '{"id":5,"created_at":"2025-11-25 15:30:00","discount":0.00,"status":"PENDING","total_price":800.00}', 5, 'ana@gmail.com', '2025-11-25 15:30:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (105, 'order', 6, 'CREATE', NULL, '{"id":6,"created_at":"2025-11-26 16:45:00","discount":0.00,"status":"PENDING","total_price":1200.00}', 6, 'paula@gmail.com', '2025-11-26 16:45:00') ON CONFLICT (id) DO NOTHING;

-- Order Items (CREATE) ids 1..6
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (106, 'order_item', 1, 'CREATE', NULL, '{"id":1,"price_at_purchase":4500.00,"quantity":1,"order_id":1,"product_id":1}', 2, 'joao@gmail.com', '2025-11-01 10:30:10') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (107, 'order_item', 2, 'CREATE', NULL, '{"id":2,"price_at_purchase":399.00,"quantity":1,"order_id":2,"product_id":13}', 2, 'joao@gmail.com', '2025-11-02 14:20:10') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (108, 'order_item', 3, 'CREATE', NULL, '{"id":3,"price_at_purchase":1500.00,"quantity":1,"order_id":3,"product_id":10}', 4, 'gabriel@gmail.com', '2025-11-23 09:15:10') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (109, 'order_item', 4, 'CREATE', NULL, '{"id":4,"price_at_purchase":4500.00,"quantity":1,"order_id":4,"product_id":1}', 2, 'joao@gmail.com', '2025-11-24 11:00:10') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (110, 'order_item', 5, 'CREATE', NULL, '{"id":5,"price_at_purchase":800.00,"quantity":1,"order_id":5,"product_id":18}', 5, 'ana@gmail.com', '2025-11-25 15:30:10') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (111, 'order_item', 6, 'CREATE', NULL, '{"id":6,"price_at_purchase":1200.00,"quantity":1,"order_id":6,"product_id":25}', 6, 'paula@gmail.com', '2025-11-26 16:45:10') ON CONFLICT (id) DO NOTHING;

-- Reviews (CREATE) ids 1..3
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (112, 'review', 1, 'CREATE', NULL, '{"id":1,"comment":"Excelente smartphone! Melhor que esperava.","created_at":"2025-11-02 18:00:00","order_id":1,"rating":5,"product_id":1,"user_id":2}', 2, 'joao@gmail.com', '2025-11-02 18:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (113, 'review', 2, 'CREATE', NULL, '{"id":2,"comment":"Muito confortável e bonito","created_at":"2025-11-03 12:00:00","order_id":2,"rating":5,"product_id":13,"user_id":2}', 2, 'joao@gmail.com', '2025-11-03 12:00:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (114, 'review', 3, 'CREATE', NULL, '{"id":3,"comment":"Bom mas barulhento","created_at":"2025-11-25 09:45:00","order_id":3,"rating":3,"product_id":10,"user_id":4}', 4, 'gabriel@gmail.com', '2025-11-25 09:45:00') ON CONFLICT (id) DO NOTHING;

-- Coupon Usages (CREATE) ids 1..2
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (115, 'coupon_usage', 1, 'CREATE', NULL, '{"id":1,"used_at":"2025-11-01 10:30:00","order_id":1,"promotion_id":1,"user_id":2}', 2, 'joao@gmail.com', '2025-11-01 10:30:00') ON CONFLICT (id) DO NOTHING;
INSERT INTO tb_audit_log (id, entity_type, entity_id, action, before_json, after_json, user_id, user_email, created_at)
VALUES (116, 'coupon_usage', 2, 'CREATE', NULL, '{"id":2,"used_at":"2025-11-23 09:15:00","order_id":3,"promotion_id":2,"user_id":4}', 4, 'gabriel@gmail.com', '2025-11-23 09:15:00') ON CONFLICT (id) DO NOTHING;

SELECT setval(pg_get_serial_sequence('tb_promotions', 'id'), (SELECT MAX(id) FROM tb_promotions));
SELECT setval(pg_get_serial_sequence('tb_product_stats', 'id'), (SELECT MAX(id) FROM tb_product_stats));
SELECT setval(pg_get_serial_sequence('tb_orders', 'id'), (SELECT MAX(id) FROM tb_orders));
SELECT setval(pg_get_serial_sequence('tb_order_items', 'id'), (SELECT MAX(id) FROM tb_order_items));
SELECT setval(pg_get_serial_sequence('tb_reviews', 'id'), (SELECT MAX(id) FROM tb_reviews));
SELECT setval(pg_get_serial_sequence('tb_carts', 'id'), (SELECT MAX(id) FROM tb_carts));
SELECT setval(pg_get_serial_sequence('tb_cart_items', 'id'), (SELECT MAX(id) FROM tb_cart_items));
SELECT setval(pg_get_serial_sequence('tb_coupon_usages', 'id'), (SELECT MAX(id) FROM tb_coupon_usages));
SELECT setval(pg_get_serial_sequence('tb_audit_log', 'id'), (SELECT MAX(id) FROM tb_audit_log));