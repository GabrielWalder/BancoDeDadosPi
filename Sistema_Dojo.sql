CREATE DATABASE Sistema_Dojo;

USE Sistema_Dojo;

CREATE TABLE tblProfessor(
	id_Professor INT PRIMARY KEY NOT NULL,
    nome_Professor VARCHAR(126) NOT NULL,
	email_Professor VARCHAR(75) NOT NULL,
    senha_Professor	VARCHAR(10) NOT NULL,
	cod_Professor VARCHAR(15) NOT NULL
);
CREATE TABLE tblAluno(
	id_Aluno INT PRIMARY KEY NOT NULL,
    nome_Aluno VARCHAR(126) NOT NULL,
    apelido_Aluno VARCHAR(126) NOT NULL,
    ra_Aluno VARCHAR(10) NOT NULL,
    a1_Aluno DOUBLE,
    a2_Aluno DOUBLE,
    codigo_Turma VARCHAR(15),
    FOREIGN KEY (codigo_Turma) REFERENCES tblTurma (codigo_Turma)
);
CREATE TABLE tblLogin(
	id_Professor INT PRIMARY KEY NOT NULL,
    email_Professor VARCHAR(75) NOT NULL,
    senha_Professor	VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_Professor) REFERENCES tblProfessor (id_Professor),
    FOREIGN KEY (email_Professor) REFERENCES tblProfessor (email_Professor),
    FOREIGN KEY (senha_Professor) REFERENCES tblProfessor (senha_Professor)
);
CREATE TABLE tblPergunta(
	id_Pergunta INT PRIMARY KEY NOT NULL,
    pergunta_Pergunta VARCHAR(150) NOT NULL,
    resposta_Pergunta VARCHAR(150),
    data_Pergunta DATE NOT NULL,
    status_Pergunta BIT
);
CREATE TABLE tblTurma(
	id_Turma INT PRIMARY KEY NOT NULL,
    codigo_Turma VARCHAR(15),
    curso_Turma VARCHAR(50)
);
CREATE TABLE tblNota(
	id_Nota INT PRIMARY KEY NOT NULL,
    prazo_NotaA1 DATE NOT NULL,
    prazo_NotaA2 DATE NOT NULL,
    nota_A1 DOUBLE NOT NULL,
    nota_A2 DOUBLE NOT NULL,
    numero_Vezes INT NOT NULL,
    id_Aluno INT PRIMARY KEY NOT NULL,
    nome_Aluno VARCHAR(126) NOT NULL,
    apelido_Aluno VARCHAR(126) NOT NULL,
    ra_Aluno VARCHAR(10) NOT NULL,
    a1_Aluno DOUBLE,
    a2_Aluno DOUBLE,
    FOREIGN KEY (id_Aluno) REFERENCES tblAluno (id_Aluno),
    FOREIGN KEY (nome_Aluno) REFERENCES tblAluno (nome_Aluno),
    FOREIGN KEY (apelido_Aluno) REFERENCES tblAluno (apelido_Aluno),
    FOREIGN KEY (ra_Aluno) REFERENCES tblAluno (ra_Aluno),
    FOREIGN KEY (a1_Aluno) REFERENCES tblAluno (a1_Aluno),
    FOREIGN KEY (a2_Aluno) REFERENCES tblAluno (a2_Aluno)
    /*O prazo nota será um percentual de nota, por exemplo, todas vezes que o aluno foi chamado ele tirou 90%, a nota final
    do aluno(a2_aluno) será a soma do percentual divido pelo numero de vezes que ele foi chamado(numero_Vezes)* 20, ou seja,
    ((0.9 + 0.9 + 0.9)/3) * 20 = 18. 18 será sua nota final de a1 ou a2.*/
);
CREATE TABLE tblDojo(
	id_Dojo INT PRIMARY KEY NOT NULL,
    data_Dojo DATE NOT NULL,
    id_Aluno INT NOT NULL,
    nome_Aluno VARCHAR(126) NOT NULL,
    apelido_Aluno VARCHAR(126) NOT NULL,
    ra_Aluno VARCHAR(10) NOT NULL,
    nota_A1 DOUBLE NOT NULL,
    nota_A2 DOUBLE NOT NULL,
    id_Pergunta INT PRIMARY KEY NOT NULL,
    pergunta_Pergunta VARCHAR(150) NOT NULL,
    resposta_Pergunta VARCHAR(150),
    status_Pergunta BIT,
    FOREIGN KEY (id_Aluno) REFERENCES tblAluno (id_Aluno),
    FOREIGN KEY (nome_Aluno) REFERENCES tblAluno (nome_Aluno),
    FOREIGN KEY (apelido_Aluno) REFERENCES tblAluno (apelido_Aluno),
    FOREIGN KEY (ra_Aluno) REFERENCES tblAluno (ra_Aluno),
    FOREIGN KEY (nota_A1) REFERENCES tblNota (nota_A1),
    FOREIGN KEY (nota_A2) REFERENCES tblNota (nota_A2),
    FOREIGN KEY (id_Pergunta) REFERENCES tblPergunta (id_Pergunta),
    FOREIGN KEY (pergunta_Pergunta) REFERENCES tblPergunta (pergunta_Pergunta),
    FOREIGN KEY (resposta_Pergunta) REFERENCES tblPergunta (resposta_Pergunta),
    FOREIGN KEY (status_Pergunta) REFERENCES tblPergunta (status_Pergunta)
);

/*SHOW TABLES;

DESCRIBE tblProfessor;*/
 
