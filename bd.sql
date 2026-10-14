
CREATE DATABASE IF NOT EXISTS projetofuturo;

USE projetofuturo;

-- Tabela de utilizadores
CREATE TABLE usuarios (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    senha VARCHAR(255),
    telefone VARCHAR(20),
    foto VARCHAR(255),
    moeda VARCHAR(10),
    idioma VARCHAR(10),
    tema ENUM('claro', 'escuro'),
    mes_inicial_painel ENUM('atual', 'anterior'),
    notificacoes_email TINYINT(1),
    lembretes_metas TINYINT(1),
    dois_fatores TINYINT(1),
    meta_economia_mensal DECIMAL(10,2),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de categorias
CREATE TABLE categorias (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT(11),
    nome VARCHAR(50),
    tipo ENUM('receita', 'despesa'),
    icone VARCHAR(50),
    cor VARCHAR(7),
    descricao VARCHAR(255),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabela de transações
CREATE TABLE transacoes (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT(11),
    categoria_id INT(11),
    descricao VARCHAR(150),
    valor DECIMAL(10,2),
    data DATE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabela de metas
CREATE TABLE metas (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT(11),
    nome VARCHAR(100),
    descricao VARCHAR(255),
    icone VARCHAR(50),
    cor VARCHAR(7),
    valor_meta DECIMAL(10,2),
    prazo DATE,
    status ENUM('em_andamento', 'concluida'),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabela de contribuições
CREATE TABLE contribuicoes (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    meta_id INT(11),
    descricao VARCHAR(150),
    valor DECIMAL(10,2),
    data DATE,

    FOREIGN KEY (meta_id) REFERENCES metas(id)
);
