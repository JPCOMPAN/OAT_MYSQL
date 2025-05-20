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

INSERT INTO Aluno (nome, data_nascimento, endereco, telefone) VALUES
('João Silva', '2005-03-15', 'Rua A, 123', '(11) 98765-4321'),
('Ana Costa', '2006-05-20', 'Rua C, 789', '(11) 98765-5678'),
('Pedro Santos', '2005-08-12', 'Rua D, 101', '(11) 98765-8765'),
('Carla Mendes', '2007-02-28', 'Rua E, 202', '(11) 98765-4322'),
('Lucas Oliveira', '2005-11-05', 'Rua F, 303', '(11) 98765-1235'),
('Mariana Rocha', '2006-07-19', 'Rua G, 404', '(11) 98765-1111'),
('Rafael Lima', '2005-04-22', 'Rua H, 505', '(11) 98765-2222'),
('Juliana Alves', '2006-09-30', 'Rua I, 606', '(11) 98765-3333'),
('Bruno Carvalho', '2005-12-10', 'Rua J, 707', '(11) 98765-4444'),
('Patrícia Nunes', '2007-01-25', 'Rua K, 808', '(11) 98765-5555');

INSERT INTO Professor (nome, data_nascimento, endereco, telefone) VALUES
('Maria Oliveira', '1980-07-22', 'Rua B, 456', '(11) 98765-1234'),
('Carlos Souza', '1975-09-18', 'Rua G, 404', '(11) 98765-9876'),
('Fernanda Lima', '1985-04-30', 'Rua H, 505', '(11) 98765-6543'),
('Roberto Santos', '1978-03-15', 'Rua L, 909', '(11) 98765-6666'),
('Amanda Costa', '1982-11-20', 'Rua M, 1010', '(11) 98765-7777'),
('Paulo Rocha', '1970-08-05', 'Rua N, 1111', '(11) 98765-8888'),
('Lucia Ferreira', '1983-06-12', 'Rua O, 1212', '(11) 98765-9999'),
('Marcos Almeida', '1977-02-28', 'Rua P, 1313', '(11) 98765-0000'),
('Sandra Martins', '1981-10-10', 'Rua Q, 1414', '(11) 98765-1212'),
('Gustavo Henrique', '1976-05-25', 'Rua R, 1515', '(11) 98765-2323');

INSERT INTO Disciplina (nome, carga_horaria) VALUES
('Matemática', 60),
('Português', 50),
('História', 40),
('Geografia', 40),
('Ciências', 50),
('Física', 60),
('Química', 50),
('Biologia', 50),
('Inglês', 40),
('Artes', 30);

INSERT INTO Turma (nome, ano, id_professor, id_disciplina) VALUES
('Turma A', 2023, 1, 1),
('Turma B', 2023, 2, 2),
('Turma C', 2023, 3, 3),
('Turma D', 2023, 4, 4),
('Turma E', 2023, 5, 5),
('Turma F', 2023, 6, 6),
('Turma G', 2023, 7, 7),
('Turma H', 2023, 8, 8),
('Turma I', 2023, 9, 9),
('Turma J', 2023, 10, 10);

INSERT INTO Matricula (id_aluno, id_turma, data_matricula) VALUES
(1, 1, '2023-01-10'),
(2, 1, '2023-01-10'),
(3, 2, '2023-01-10'),
(4, 3, '2023-01-10'),
(5, 1, '2023-01-10'),
(6, 4, '2023-01-10'),
(7, 5, '2023-01-10'),
(8, 6, '2023-01-10'),
(9, 7, '2023-01-10'),
(10, 8, '2023-01-10'),
(1, 2, '2023-01-10'),
(2, 3, '2023-01-10'),
(3, 4, '2023-01-10'),
(4, 5, '2023-01-10'),
(5, 6, '2023-01-10'),
(6, 7, '2023-01-10'),
(7, 8, '2023-01-10'),
(8, 9, '2023-01-10'),
(9, 10, '2023-01-10'),
(10, 1, '2023-01-10');

SELECT A.nome AS Aluno, T.nome AS Turma, D.nome AS Disciplina FROM Matricula M
JOIN Aluno A ON M.id_aluno = A.id_aluno
JOIN Turma T ON M.id_turma = T.id_turma
JOIN Disciplina D ON T.id_disciplina = D.id_disciplina;

SELECT P.nome AS Professor, D.nome AS Disciplina FROM Turma T
JOIN Professor P ON T.id_professor = P.id_professor
JOIN Disciplina D ON T.id_disciplina = D.id_disciplina;

SELECT T.nome AS Turma, COUNT(M.id_aluno) AS Total_Alunos FROM Turma T
LEFT JOIN Matricula M ON T.id_turma = M.id_turma
GROUP BY T.nome;

SELECT D.nome AS Disciplina, COUNT(T.id_turma) AS Total_Turmas FROM Disciplina D
LEFT JOIN Turma T ON D.id_disciplina = T.id_disciplina
GROUP BY D.nome;

SELECT P.nome AS Professor, COUNT(T.id_turma) AS Total_Turmas FROM Professor P
LEFT JOIN Turma T ON P.id_professor = T.id_professor
GROUP BY P.nome;

SELECT A.nome AS Aluno, COUNT(M.id_turma) AS Total_Matriculas FROM Aluno A
LEFT JOIN Matricula M ON A.id_aluno = M.id_aluno
GROUP BY A.nome;

SELECT YEAR(A.data_nascimento) AS Ano_Nascimento, COUNT(*) AS Total_Alunos FROM Aluno A
GROUP BY YEAR(A.data_nascimento);

SELECT D.nome AS Disciplina, AVG(D.carga_horaria) AS Media_Carga_Horaria FROM Disciplina D
GROUP BY D.nome;

SELECT T.ano AS Ano, COUNT(*) AS Total_Turmas FROM Turma T
GROUP BY T.ano;

SELECT T.nome AS Turma, P.nome AS Professor FROM Turma T
JOIN Professor P ON T.id_professor = P.id_professor;

SELECT A.nome AS Aluno, T.nome AS Turma FROM Matricula M
JOIN Aluno A ON M.id_aluno = A.id_aluno
JOIN Turma T ON M.id_turma = T.id_turma
WHERE T.nome = 'Turma A';

SELECT D.nome AS Disciplina, T.nome AS Turma FROM Turma T
JOIN Disciplina D ON T.id_disciplina = D.id_disciplina
WHERE D.carga_horaria > 50;

SELECT A.nome AS Aluno, D.nome AS Disciplina FROM Matricula M
JOIN Aluno A ON M.id_aluno = A.id_aluno
JOIN Turma T ON M.id_turma = T.id_turma
JOIN Disciplina D ON T.id_disciplina = D.id_disciplina
WHERE A.nome LIKE 'J%';

SELECT P.nome AS Professor, D.nome AS Disciplina FROM Turma T
JOIN Professor P ON T.id_professor = P.id_professor
JOIN Disciplina D ON T.id_disciplina = D.id_disciplina
WHERE P.nome LIKE '%a%';

SELECT A.nome AS Aluno, T.nome AS Turma, D.nome AS Disciplina FROM Matricula M
JOIN Aluno A ON M.id_aluno = A.id_aluno
JOIN Turma T ON M.id_turma = T.id_turma
JOIN Disciplina D ON T.id_disciplina = D.id_disciplina
ORDER BY A.nome;