CREATE DATABASE escola;
USE escola;

CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15)
);


CREATE TABLE Professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15)
);


CREATE TABLE Disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);


CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    id_professor INT,
    id_disciplina INT,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);


CREATE TABLE Matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);


INSERT INTO Aluno (nome, data_nascimento, endereco, telefone)
VALUES 
('João Silva', '2005-03-15', 'Rua A, 123', '(11) 98765-4321'),
('Ana Costa', '2006-05-20', 'Rua C, 789', '(11) 98765-5678'),
('Pedro Santos', '2005-08-12', 'Rua D, 101', '(11) 98765-8765'),
('Carla Mendes', '2007-02-28', 'Rua E, 202', '(11) 98765-4322'),
('Lucas Oliveira', '2005-11-05', 'Rua F, 303', '(11) 98765-1235');


INSERT INTO Professor (nome, data_nascimento, endereco, telefone)
VALUES 
('Maria Oliveira', '1980-07-22', 'Rua B, 456', '(11) 98765-1234'),
('Carlos Souza', '1975-09-18', 'Rua G, 404', '(11) 98765-9876'),
('Fernanda Lima', '1985-04-30', 'Rua H, 505', '(11) 98765-6543');


INSERT INTO Disciplina (nome, carga_horaria)
VALUES 
('Matemática', 60),
('Português', 50),
('História', 40),
('Geografia', 40),
('Ciências', 50);


INSERT INTO Turma (nome, ano, id_professor, id_disciplina)
VALUES 
('Turma A', 2023, 1, 1),  -- Matemática com Maria Oliveira
('Turma B', 2023, 2, 2),  -- Português com Carlos Souza
('Turma C', 2023, 3, 3);  -- História com Fernanda Lima


INSERT INTO Matricula (id_aluno, id_turma, data_matricula)
VALUES 
(1, 1, '2023-01-10'),  -- João Silva na Turma A
(2, 1, '2023-01-10'),  -- Ana Costa na Turma A
(3, 2, '2023-01-10'),  -- Pedro Santos na Turma B
(4, 3, '2023-01-10'),  -- Carla Mendes na Turma C
(5, 1, '2023-01-10');  -- Lucas Oliveira na Turma A


SELECT 
    A.nome AS Aluno,
    T.nome AS Turma,
    P.nome AS Professor,
    D.nome AS Disciplina,
    M.data_matricula
FROM 
    Matricula M
JOIN Aluno A ON M.id_aluno = A.id_aluno
JOIN Turma T ON M.id_turma = T.id_turma
JOIN Professor P ON T.id_professor = P.id_professor
JOIN Disciplina D ON T.id_disciplina = D.id_disciplina;


SELECT 
    T.nome AS Turma,
    P.nome AS Professor,
    D.nome AS Disciplina
FROM 
    Turma T
JOIN Professor P ON T.id_professor = P.id_professor
JOIN Disciplina D ON T.id_disciplina = D.id_disciplina;


SELECT 
    T.nome AS Turma,
    COUNT(M.id_aluno) AS Total_Alunos
FROM 
    Turma T
LEFT JOIN Matricula M ON T.id_turma = M.id_turma
GROUP BY T.nome;


SELECT 
    A.nome AS Aluno,
    T.nome AS Turma
FROM 
    Aluno A
JOIN Matricula M ON A.id_aluno = M.id_aluno
JOIN Turma T ON M.id_turma = T.id_turma;


