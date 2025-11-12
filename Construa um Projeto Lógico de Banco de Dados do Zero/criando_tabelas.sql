-- -----------------------------
-- Projeto: Planejamento de Colheita Florestal (MySQL)
-- Cria DB e estrutura básica
-- -----------------------------

CREATE DATABASE IF NOT EXISTS planejamento_colheita;
USE planejamento_colheita;

-- tabela fazenda
CREATE TABLE fazenda (
  id_fazenda INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  regiao VARCHAR(45),
  area_total_ha DECIMAL(10,2)
) ENGINE=InnoDB;

-- tabela talhao (compartimento)
CREATE TABLE talhao (
  id_talhao INT AUTO_INCREMENT PRIMARY KEY,
  id_fazenda INT NOT NULL,
  area_ha DECIMAL(8,3) NOT NULL,
  status ENUM('ativo','em_renovacao','conservacao') DEFAULT 'ativo',
  geom_ref VARCHAR(45), -- referência a shapefile/kml
  CONSTRAINT fk_talhao_fazenda FOREIGN KEY (id_fazenda) REFERENCES fazenda(id_fazenda)
) ENGINE=InnoDB;

-- especies
CREATE TABLE especie (
  id_especie INT AUTO_INCREMENT PRIMARY KEY,
  nome_comum VARCHAR(45) NOT NULL,
  nome_cientifico VARCHAR(80),
  ciclo_anos INT -- tempo até maturidade
) ENGINE=InnoDB;

-- plantio
CREATE TABLE plantio (
  id_plantio INT AUTO_INCREMENT PRIMARY KEY,
  id_talhao INT NOT NULL,
  id_especie INT NOT NULL,
  data_plantio DATE NOT NULL,
  densidade_plants_ha INT,
  obs TEXT,
  CONSTRAINT fk_plantio_talhao FOREIGN KEY (id_talhao) REFERENCES talhao(id_talhao),
  CONSTRAINT fk_plantio_especie FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
) ENGINE=InnoDB;

-- inventario (medições/estimativas periódicas)
CREATE TABLE inventario (
  id_inventario INT AUTO_INCREMENT PRIMARY KEY,
  id_talhao INT NOT NULL,
  data_inventario DATE NOT NULL,
  volume_m3 DECIMAL(10,2) NOT NULL, -- volume comercial estimado
  densidade_plants_ha INT,
  obs TEXT,
  CONSTRAINT fk_inventario_talhao FOREIGN KEY (id_talhao) REFERENCES talhao(id_talhao)
) ENGINE=InnoDB;

-- contratante (empresas que executam a colheita)
CREATE TABLE contratante (
  id_contratante INT AUTO_INCREMENT PRIMARY KEY,
  razao_social VARCHAR(14) NOT NULL,
  contato VARCHAR(45),
  telefone VARCHAR(10)
) ENGINE=InnoDB;

-- ordens de colheita (planejamento)
CREATE TABLE colheita_ordem (
  id_ordem INT AUTO_INCREMENT PRIMARY KEY,
  id_talhao INT NOT NULL,
  id_contratante INT,
  data_inicio_prev DATE,
  data_fim_prev DATE,
  status ENUM('planejada','em_execucao','concluida','cancelada') DEFAULT 'planejada',
  volume_previsto_m3 DECIMAL(10,2),
  rendimento_m3_ha DECIMAL(8,3),
  obs TEXT,
  CONSTRAINT fk_ordem_talhao FOREIGN KEY (id_talhao) REFERENCES talhao(id_talhao),
  CONSTRAINT fk_ordem_contratante FOREIGN KEY (id_contratante) REFERENCES contratante(id_contratante)
) ENGINE=InnoDB;

-- equipamentos
CREATE TABLE equipamento (
  id_equip INT AUTO_INCREMENT PRIMARY KEY,
  tipo ENUM('harvester','forwarder','skidder','truck','grua') NOT NULL,
  modelo VARCHAR(45),
  identificacao VARCHAR(45) UNIQUE
) ENGINE=InnoDB;

-- alocacao de equipamentos para ordens
CREATE TABLE alocacao_equip (
  id_aloc INT AUTO_INCREMENT PRIMARY KEY,
  id_ordem INT NOT NULL,
  id_equip INT NOT NULL,
  data_aloc DATE,
  horas_previstas DECIMAL(6,2),
  CONSTRAINT fk_aloc_ordem FOREIGN KEY (id_ordem) REFERENCES colheita_ordem(id_ordem),
  CONSTRAINT fk_aloc_equip FOREIGN KEY (id_equip) REFERENCES equipamento(id_equip)
) ENGINE=InnoDB;

-- custos estimados por ordem (simplificado)
CREATE TABLE custo_estimado (
  id_custo INT AUTO_INCREMENT PRIMARY KEY,
  id_ordem INT NOT NULL,
  tipo_custo ENUM('mao_de_obra','combustivel','transporte','manutencao','outros') NOT NULL,
  valor DECIMAL(12,2) NOT NULL,
  CONSTRAINT fk_custo_ordem FOREIGN KEY (id_ordem) REFERENCES colheita_ordem(id_ordem)
) ENGINE=InnoDB;

-- índices úteis
CREATE INDEX idx_talhao_codigo ON talhao(codigo);
CREATE INDEX idx_ordem_status ON colheita_ordem(status);
CREATE INDEX idx_inventario_data ON inventario(data_inventario);
