
CREATE TABLE Usuario (
Usu_Nome VARCHAR(10),
Usu_Email VARCHAR(50),
Usu_Senha VARCHAR(8),
Usu_Login VARCHAR(10),
Usu_Codigo NUMERIC(7) PRIMARY KEY
);

CREATE TABLE Site (
Site_Usuario VARCHAR(10),
Site_Codigo NUMERIC(7) PRIMARY KEY
);

CREATE TABLE Pagina_QuemSomos (
Quem_Codigo NUMERIC(10),
Quem_RedesSociais VARCHAR(300),
Quem_Missao VARCHAR(300),
Quem_Visao VARCHAR(300),
Quem_Valores VARCHAR(300),
Quem_Idealizadores VARCHAR(50),
PRIMARY KEY(Quem_Codigo,Quem_Valores)
);

CREATE TABLE Pagina_Cursos (
Curs_Codigo NUMERIC(10) PRIMARY KEY,
Curs_Recomendacao VARCHAR(100),
Curs_CursosSebrae VARCHAR(300),
Curs_Duracao VARCHAR(70),
Curs_Ramo VARCHAR(70)
);

CREATE TABLE Pagina_Divulgacao (
Divu_Site VARCHAR(60),
Divu_RedesSociais VARCHAR(25),
Divu_Descricao VARCHAR(100),
Divu_Endereco VARCHAR(100),
Divu_Empresa VARCHAR(100),
Divu_Codigo NUMERIC(10) PRIMARY KEY
);

CREATE TABLE Ranking (
Rank_Codigo NUMERIC(10) PRIMARY KEY,
Rank_Notas VARCHAR(5),
Rank_Data VARCHAR(10)
);

CREATE TABLE Pagina_Feed (
Feed_Codigo NUMERIC(10) PRIMARY KEY,
Feed_Dados VARCHAR(300),
Feed_Nome VARCHAR(50),
Feed_Senha VARCHAR(10),
Feed_Funcionalidades VARCHAR(300)
);

CREATE TABLE Conta (
Cont_Login VARCHAR(10),
Cont_Descricao VARCHAR(25),
Cont_Codigo NUMERIC(7) PRIMARY KEY,
Usu_Codigo NUMERIC(7),
FOREIGN KEY(Usu_Codigo) REFERENCES Usuario (Usu_Codigo)
);

CREATE TABLE Avaliacao (
Ava_Codigo NUMERIC(10) PRIMARY KEY,
Ava_Comentario VARCHAR(300),
Ava_Nota VARCHAR(5)
);

CREATE TABLE Pagina_Suporte (
Suporte_Chat VARCHAR(500),
Suporte_Codigo NUMERIC(10) PRIMARY KEY
);

CREATE TABLE Usu_Telefone (
Usu_Telefone_PK INTEGER PRIMARY KEY,
Usu_Telefone NUMERIC(14),
Usu_Codigo_FK NUMERIC(),
FOREIGN KEY(Usu_Codigo_FK) REFERENCES Usuario (Usu_Codigo)
);

CREATE TABLE Acessa (
Site_Codigo NUMERIC(7),
Cont_Codigo NUMERIC(7),
FOREIGN KEY(Site_Codigo) REFERENCES Site (Site_Codigo),
FOREIGN KEY(Cont_Codigo) REFERENCES Conta (Cont_Codigo)
);

CREATE TABLE Possui (
Site_Codigo NUMERIC(7),
Divu_Codigo NUMERIC(10),
FOREIGN KEY(Site_Codigo) REFERENCES Site (Site_Codigo),
FOREIGN KEY(Divu_Codigo) REFERENCES Pagina_Divulgacao (Divu_Codigo)
);

CREATE TABLE Tem (
Suporte_Codigo NUMERIC(10),
Quem_Codigo NUMERIC(10),
Quem_Valores VARCHAR(300),
Site_Codigo NUMERIC(7),
PRIMARY KEY(Suporte_Codigo,Quem_Codigo,Quem_Valores,Site_Codigo)
);

CREATE TABLE Recomenda (
Curs_Codigo NUMERIC(10),
Ava_Codigo NUMERIC(10),
FOREIGN KEY(Curs_Codigo) REFERENCES Pagina_Cursos (Curs_Codigo),
FOREIGN KEY(Ava_Codigo) REFERENCES Avaliacao (Ava_Codigo)
);

CREATE TABLE Contem (
Site_Codigo NUMERIC(7),
Curs_Codigo NUMERIC(10),
FOREIGN KEY(Site_Codigo) REFERENCES Site (Site_Codigo),
FOREIGN KEY(Curs_Codigo) REFERENCES Pagina_Cursos (Curs_Codigo)
);

CREATE TABLE Detem (
Divu_Codigo NUMERIC(10),
Feed_Codigo NUMERIC(10),
FOREIGN KEY(Divu_Codigo) REFERENCES Pagina_Divulgacao (Divu_Codigo),
FOREIGN KEY(Feed_Codigo) REFERENCES Pagina_Feed (Feed_Codigo)
);

CREATE TABLE Fornece (
Divu_Codigo NUMERIC(10),
Ava_Codigo NUMERIC(10),
FOREIGN KEY(Divu_Codigo) REFERENCES Pagina_Divulgacao (Divu_Codigo),
FOREIGN KEY(Ava_Codigo) REFERENCES Avaliacao (Ava_Codigo)
);

CREATE TABLE Gera (
Ava_Codigo NUMERIC(10),
Rank_Codigo NUMERIC(10),
FOREIGN KEY(Ava_Codigo) REFERENCES Avaliacao (Ava_Codigo),
FOREIGN KEY(Rank_Codigo) REFERENCES Ranking (Rank_Codigo)
);

