create table usuario (id serial not null primary key, nome varchar(255) not null, email varchar(255) not null, senha varchar(255) not null);

create table esporte (id serial not null primary key, nome varchar(255) not null, jogadores_por_time int);

create table torneio (id serial not null primary key, nome varchar(255) not null, data_inicio date not null, data_fim date not null, esporte_id int not null, foreign key (esporte_id) references esporte(id));

create table time (id serial not null primary key, nome varchar(255) not null, cidade varchar(255) not null, esporte_id int, foreign key (esporte_id) references esporte(id));

create table partida (id serial not null primary key, time_a_id int, time_b_id int, placar_time_a int, placar_time_b int, torneio_id int,
foreign key (time_a_id) references time(id), foreign key (time_b_id) references time(id), foreign key (torneio_id) references torneio(id));


-- Inserindo dados de exemplo
INSERT INTO usuario (nome, email, senha) VALUES ('Admin', 'admin@admin.com', 'admin');

INSERT INTO esporte (nome, jogadores_por_time) VALUES 
('Futebol', 11),
('Basquete', 5),
('Vôlei', 6),
('Futsal', 5),
('Handebol', 7);

INSERT INTO torneio (nome, data_inicio, data_fim, esporte_id) VALUES 
('Campeonato de Futebol 2025', '2025-03-01', '2025-03-31', 1),
('Torneio de Basquete Universitário', '2025-04-15', '2025-05-15', 2),
('Copa de Vôlei Regional', '2025-06-01', '2025-06-30', 3);

INSERT INTO time (nome, cidade, esporte_id) VALUES 
('Flamengo', 'Rio de Janeiro', 1),
('São Paulo', 'São Paulo', 1),
('Palmeiras', 'São Paulo', 1),
('Grêmio', 'Porto Alegre', 1),
('Internacional', 'Porto Alegre', 1),
('Lakers', 'Los Angeles', 2),
('Warriors', 'San Francisco', 2),
('Celtics', 'Boston', 2);


-- Inserindo partidas de exemplo para o Campeonato de Futebol
INSERT INTO partida (time_a_id, time_b_id, placar_time_a, placar_time_b, torneio_id) VALUES 
-- Fase de Grupos
(1, 2, 2, 1, 1),  -- Flamengo x São Paulo
(3, 4, 1, 0, 1),  -- Palmeiras x Grêmio
(5, 1, 0, 3, 1),  -- Internacional x Flamengo
(2, 3, 1, 1, 1),  -- São Paulo x Palmeiras
-- Oitavas de Final
(1, 4, 2, 0, 1),  -- Flamengo x Grêmio
(3, 5, 3, 1, 1),  -- Palmeiras x Internacional
(2, 1, null, null, 1),  -- São Paulo x Flamengo (a jogar)
(4, 5, null, null, 1),  -- Grêmio x Internacional (a jogar)
-- Quartas de Final
(1, 3, null, null, 1),  -- Flamengo x Palmeiras (a jogar)
(2, 4, null, null, 1),  -- São Paulo x Grêmio (a jogar)
-- Semifinal
(1, 2, null, null, 1),  -- Semifinal 1 (a jogar)
(3, 4, null, null, 1),  -- Semifinal 2 (a jogar)
-- Final
(1, 3, null, null, 1);  -- Final (a jogar)

-- Inserindo partidas para o Torneio de Basquete
INSERT INTO partida (time_a_id, time_b_id, placar_time_a, placar_time_b, torneio_id) VALUES 
(6, 7, 98, 102, 2),  -- Lakers x Warriors
(8, 6, 89, 95, 2),   -- Celtics x Lakers
(7, 8, null, null, 2); -- Warriors x Celtics (a jogar)

