-- Lista 1 - Banco de Dados MySQL

-- Exercício 1 - BD World

-- 1. Liste o **código** e o **nome** dos 10 primeiros países, ordenados alfabeticamente pelo código.
SELECT code, name FROM Country ORDER BY code ASC LIMIT 10;

-- 2. Liste o **código** e o **nome** dos 10 últimos países, ordenados alfabeticamente pelo código.
SELECT code, name FROM Country ORDER BY code DESC LIMIT 10;

-- 3. Liste o **nome** e **código** dos países que começam seu nome com "United".
SELECT code, name FROM Country WHERE name like "United%"

-- 4. Informe o número de países registrados na tabela `Country`.
SELECT COUNT(name) FROM Country;

-- 5. Listar os **códigos dos países** e o **número de línguas** que eles possuem (ordene **ASCENDENTE** pelo código do país e limite sua apresentação aos 10 primeiros países).
SELECT CountryCode, COUNT(Language) FROM CountryLanguage GROUP BY CountryCode ORDER BY CountryCode ASC LIMIT 10;

-- 6. Liste o **código do país** e as **línguas** que ele possui. Limite sua lista aos 20 primeiros países, ordenados em ordem **ASCENDENTE** do Código do país. 
SELECT CountryCode, Language FROM CountryLanguage ORDER BY CountryCode ASC LIMIT 90;

-- 7. Liste o **código do país** e as **línguas OFICIAIS** que ele possui. Limite sua lista aos 20 primeiros países, ordenados em ordem **ASCENDENTE** do Código do país.
SELECT CountryCode, Language, IsOfficial FROM CountryLanguage WHERE IsOfficial = 'T' ORDER BY CountryCode ASC LIMIT 20;

-- 8. Liste os **códigos dos países** e o **número de línguas oficiais** que eles possuem, ordenado pelo código do país ascendente, para os países com **2 ou mais línguas oficiais**
SELECT CountryCode, COUNT(Language) FROM CountryLanguage WHERE IsOfficial = 'T' GROUP BY CountryCode HAVING COUNT(Language) >= 2 ORDER BY CountryCode;

-- 9. Liste todas as **Regiões** definidas na Tabela `Country`.
SELECT DISTINCT Region FROM Country;

-- 10. Liste os países que estão na **Região Nórdica** informando o **Código**, o **Nome** e a **Expectativa de Vida**.
SELECT Code, Name, LifeExpectancy FROM Country WHERE Region = 'Nordic Countries';

-- 11. Mostre os **10 maiores países** do mundo. Apresente o **nome** e a **área**.
SELECT name, SurfaceArea FROM Country ORDER BY SurfaceArea DESC LIMIT 10;

-- 12. Quais os **5 menores países** do mundo? Mostre o **código** e a **área**.
SELECT Code, SurfaceArea FROM Country ORDER BY SurfaceArea ASC LIMIT 5;

-- 13. Quais os **5 menores países da Europa**? Mostre o **código** e a **área**.
SELECT Code, SurfaceArea FROM Country WHERE Continent = 'Europe' ORDER BY SurfaceArea ASC LIMIT 5;

-- 14. Quais os **5 países mais populosos** do mundo? Mostre o **código** e a **população**.
SELECT Code, Population FROM Country ORDER BY Population DESC LIMIT 5;

-- 15. Quais as **áreas** dos países: Alemanha, França, Inglaterra, Portugal, Espanha, Itália? Mostre o **nome** e a **área**, ordenado por área.
SELECT Name, SurfaceArea FROM Country WHERE Name IN ('Germany', 'France', 'United Kingdom', 'Portugal', 'Spain', 'Italy') ORDER BY SurfaceArea ASC;

-- 16. Mostre o **número de países** de cada continente
SELECT COUNT(Name), Continent FROM Country GROUP BY Continent;

-- 17. Diga quantas **cidades** existem lançadas no banco de dados.
SELECT COUNT(Name) FROM City;

-- 18. Selecione **nome** e **população** das cidades cujo código do país é 'bra'.
SELECT Name, Population FROM City WHERE CountryCode = 'BRA';

-- 19. Mostre quantas cidades são cadastradas para o país **Brasil**.
SELECT COUNT(Name) FROM City WHERE CountryCode = 'BRA';

-- 20. Mostre quantas cidades existem para cada país. Mostre o **código do país** e o **número de cidades** lançadas no BD.
SELECT COUNT(Name), CountryCode FROM City GROUP BY CountryCode;

--
-- Exercício 2 -  Criação de um Banco de Dados

-- 1. Criar o banco de dados Agenda
CREATE DATABASE minha_agenda;

-- 2. Inserir Dados
USE minha_agenda;
-- Criando tabelas de Contatos
CREATE TABLE contatos (
    id_contato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50),
    apelido VARCHAR(50),
    relacao VARCHAR(30),
    status VARCHAR(10),
    frequencia VARCHAR(20),
    data_ultima_conversa DATE,
    observacao TEXT
);

-- Inserindo Dados na Tabela de Contatos
-- Fernando Pessoa (Amigo)
INSERT INTO contatos (nome, sobrenome, apelido, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('Fernando', 'Pessoa', 'Heterônimo', 'Amigo', 'Ativo', 'Raramente', '2025-09-01', 'Sempre tem um olhar diferente para as coisas.');
-- Carlos Drummond (Parente)
INSERT INTO contatos (nome, sobrenome, apelado, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('Carlos', 'Drummond', 'Mundo', 'Parente', 'Ativo', 'Semanal', '2025-10-05', 'Diz que no meio do caminho tinha uma pedra.');
-- Cecília Meireles (Comercial)
INSERT INTO contatos (nome, sobrenome, apelido, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('Cecília', 'Meireles', 'Espectral', 'Comercial', 'Ativo', 'Mensal', '2025-08-15', 'Contato para projetos delicados e líricos.');
-- Vinicius de Moraes (Amigo)
INSERT INTO contatos (nome, sobrenome, apelido, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('Vinicius', 'Moraes', 'Poetinha', 'Amigo', 'Ativo', 'Diário', '2025-10-09', 'Adora falar sobre o amor e a tristeza.');
-- Manuel Bandeira (Vizinho)
INSERT INTO contatos (nome, sobrenome, apelido, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('Manuel', 'Bandeira', 'Estrela', 'Vizinho', 'Ativo', 'Anual', '2024-12-25', 'Pessoa muito simples e direta.');
-- Olavo Bilac (Empresarial)
INSERT INTO contatos (nome, sobrenome, apelido, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('Olavo', 'Bilac', 'Parnaso', 'Empresarial', 'Ativo', 'Quinzenal', '2025-09-20', 'Formal e sempre preocupado com a métrica.');
-- Cora Coralina (Parente)
INSERT INTO contatos (nome, sobrenome, apelido, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('Cora', 'Coralina', 'Doceira', 'Parente', 'Ativo', 'Semanal', '2025-10-01', 'Sempre manda receitas novas e conselhos simples.');
-- João Cabral de Melo Neto (Colega)
INSERT INTO contatos (nome, sobrenome, apelido, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('João', 'Cabral', 'Engenheiro', 'Colega', 'Ativo', 'Mensal', '2025-07-30', 'Fala muito sobre o sertão e a dureza da vida.');
-- Alphonsus de Guimaraens (Ex-Colega)
INSERT INTO contatos (nome, sobrenome, apelido, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('Alphonsus', 'Guimaraens', 'Sombrio', 'Ex-Colega', 'Desativado', 'Raramente', '2023-01-01', 'Está desativado, contato apenas em caso de emergência.');
-- Castro Alves (Comercial)
INSERT INTO contatos (nome, sobrenome, apelido, relacao, status, frequencia, data_ultima_conversa, observacao)
VALUES ('Castro', 'Alves', 'Navio', 'Comercial', 'Ativo', 'Diário', '2025-10-08', 'Sempre muito eloquente, pode ser útil em debates.');

-- 3. Consultas Básicas

-- BUSCA DE CONTATOS ATIVOS
SELECT nome, sobrenome, apelido, relacao, frequencia
FROM contatos
WHERE status = 'Ativo';

-- BUSCA PELO APELIDO

SELECT nome, sobrenome, relacao, observacao
FROM contatos
WHERE apelido = 'Heterônimo';

SELECT nome, sobrenome, apelido
FROM contatos
WHERE relacao = 'Parente';

-- BUSCA POR RELAÇÃO
SELECT nome, sobrenome, apelido
FROM contatos
WHERE relacao = 'Parente';

-- BUSCA POR CONTATOS COM BAIXA FREQUÊNCIA DE CONVERSA
SELECT nome, apelido, data_ultima_conversa
FROM contatos
WHERE frequencia IN ('Raramente', 'Anual')
ORDER BY data_ultima_conversa DESC;

-- BUSCA PARA CONTAR CONTATOS POR RELAÇÃO
SELECT relacao, COUNT(id_contato) AS Total
FROM contatos
GROUP BY relacao
ORDER BY Total DESC; 