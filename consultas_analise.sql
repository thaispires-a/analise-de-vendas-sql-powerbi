-- FATURAMENTO TOTAL
SELECT SUM(p.preco * v.quantidade) AS faturamento_total
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto;

-- TICKET MÉDIO POR VENDA
SELECT AVG(total_venda) AS ticket_medio
FROM (
    SELECT (p.preco * v.quantidade) AS total_venda
    FROM vendas v
    JOIN produtos p ON v.id_produto = p.id_produto
) AS sub;

-- PRODUTO MAIS VENDIDO (QUANTIDADE)
SELECT p.nome_produto, SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY total_vendido DESC
LIMIT 1;

-- VENDEDOR COM MAIOR FATURAMENTO
SELECT vd.nome_vendedor, SUM(p.preco * v.quantidade) AS faturamento
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
JOIN vendedores vd ON v.id_vendedor = vd.id_vendedor
GROUP BY vd.nome_vendedor
ORDER BY faturamento DESC
LIMIT 1;

-- FATURAMENTO POR MÊS
SELECT DATE_FORMAT(data_venda, '%Y-%m') AS mes, SUM(p.preco * v.quantidade) AS faturamento
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY mes
ORDER BY mes;