USE planejamento_colheita;

-- fazendas
INSERT INTO fazenda (nome, regiao, area_total_ha) VALUES
('Fazenda Boa Vista', 'Mato Grosso', 2500.00),
('Fazenda São Pedro', 'Paraná', 1200.50);

-- talhoes
INSERT INTO talhao (id_fazenda, codigo, area_ha, status) VALUES
(1,'TV-01', 35.50,  'ativo'),
(1,'TV-02', 42.00,  'ativo'),
(1,'TV-03', 18.75,  'em_renovacao'),
(2,'SP-01', 60.00,  'ativo'),
(2,'SP-02', 27.30,  'ativo');

-- especies
INSERT INTO especie (nome_comum, nome_cientifico, ciclo_anos) VALUES
('Eucalipto', 'Eucalyptus sp.', 7),
('Pinus', 'Pinus sp.', 18),
('Mogno', 'Swietenia macrophylla', 25);

-- plantios
INSERT INTO plantio (id_talhao, id_especie, data_plantio, densidade_plants_ha, obs) VALUES
(1,1,'2018-05-10', 1100, 'Plantio comercial - rotação 7 anos'),
(2,1,'2016-06-15', 1000, 'Plantio denso'),
(3,2,'2010-07-20', 850, 'Plantio prévio - será renovado'),
(4,1,'2019-09-01', 1200, 'Plantio com fertilização leve'),
(5,2,'2008-03-12', 900, 'Pinus com baixo rendimento');

-- inventarios
INSERT INTO inventario (id_talhao, data_inventario, volume_m3, densidade_plants_ha, obs) VALUES
(1,'2024-06-30', 520.50, 1050, 'Inventário estoque comercial'),
(2,'2024-06-30', 750.00, 980, 'Inventário'),
(3,'2023-11-10', 90.00, 800, 'Talhão em renovação'),
(4,'2024-08-15', 1120.25, 1180, 'Inventário pós-fertilização'),
(5,'2022-05-20', 420.00, 880, 'Inventário antigo');

-- contratantes
INSERT INTO contratante (razao_social, contato, telefone) VALUES
('ColheitaMax Ltda', 'João Silva', '11 9999-0001'),
('Madeireira Sul', 'Carlos Souza', '41 9888-1111');

-- ordens de colheita
INSERT INTO colheita_ordem (id_talhao, id_contratante, data_inicio_prev, data_fim_prev, status, volume_previsto_m3, rendimento_m3_ha, obs) VALUES
(2,1,'2025-03-01','2025-03-20','planejada', 700.00, 16.67, 'Colheita de Eucalipto, logística rodoviária'),
(1,2,'2024-11-05','2024-11-25','concluida', 500.00, 14.08, 'Colheita concluída sem incidentes'),
(4,1,'2025-06-10','2025-06-30','planejada', 1100.00, 18.33, 'Alta produtividade'),
(5,2,'2024-12-01','2024-12-15','concluida', 400.00, 14.67, 'Pinus - parte da área');

-- equipamentos
INSERT INTO equipamento (tipo, modelo, identificacao) VALUES
('harvester','H-3000','HARV-01'),
('forwarder','F-1200','FORW-01'),
('skidder','SK-800','SKID-02'),
('truck','TR-10','TRUCK-01');

-- alocacao equipamentos
INSERT INTO alocacao_equip (id_ordem, id_equip, data_aloc, horas_previstas) VALUES
(1,1,'2025-03-01', 200.0),
(1,2,'2025-03-02', 180.0),
(3,1,'2025-06-10', 220.0),
(2,4,'2024-11-05', 100.0);

-- custos estimados
INSERT INTO custo_estimado (id_ordem, tipo_custo, valor) VALUES
(1,'mao_de_obra', 15000.00),
(1,'combustivel', 4200.00),
(1,'transporte', 6000.00),
(2,'mao_de_obra', 12000.00),
(3,'mao_de_obra', 16000.00),
(3,'combustivel', 5000.00),
(3,'manutencao', 2000.00),
(4,'transporte', 3500.00);
