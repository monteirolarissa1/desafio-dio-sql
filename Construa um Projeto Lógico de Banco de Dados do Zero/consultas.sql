-- Área e volume

SELECT t.codigo, t.area_ha,
       COALESCE(i.volume_m3,0) AS volume_m3,
       p.data_plantio, e.nome_comum AS especie
FROM talhao t
LEFT JOIN inventario i ON i.id_talhao = t.id_talhao
LEFT JOIN plantio p ON p.id_talhao = t.id_talhao
LEFT JOIN especie e ON p.id_especie = e.id_especie
ORDER BY t.codigo;

-- Vol por contratante
SELECT c.razao_social, SUM(o.volume_previsto_m3) AS total_volume_previsto
FROM colheita_ordem o
JOIN contratante c ON o.id_contratante = c.id_contratante
WHERE o.status IN ('planejada','em_execucao')
GROUP BY c.id_contratante
ORDER BY total_volume_previsto DESC;

-- Talhões com inventário antigo (último inventário há mais de 18 meses)

SELECT t.id_talhao, t.codigo, MAX(i.data_inventario) AS ultima_data
FROM talhao t
LEFT JOIN inventario i ON t.id_talhao = i.id_talhao
GROUP BY t.id_talhao
HAVING ultima_data IS NULL OR ultima_data < DATE_SUB(CURDATE(), INTERVAL 18 MONTH);

-- rendimento médio por espécie

SELECT e.nome_comum,
       SUM(i.volume_m3) / SUM(t.area_ha) AS rendimento_m3_ha
FROM plantio p
JOIN especie e ON p.id_especie = e.id_especie
JOIN talhao t ON p.id_talhao = t.id_talhao
LEFT JOIN inventario i ON i.id_talhao = t.id_talhao
GROUP BY e.id_especie;
