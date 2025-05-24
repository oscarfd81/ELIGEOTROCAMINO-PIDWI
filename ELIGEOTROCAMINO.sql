CREATE TABLE empresa (
    idEmpresa CHAR(12) PRIMARY KEY
);


CREATE TABLE cliente (
    idContacto CHAR(12) PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(50),
    email VARCHAR(40),
    mensaje VARCHAR(200),
    fechaEnvio DATE
);


CREATE TABLE noticia (
    idNoticia CHAR(12) PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(20),
    categoria VARCHAR(100),
    fechaPubli DATE,
    contenido VARCHAR(100)
);

CREATE TABLE reportero (
    idMiembro CHAR(12) PRIMARY KEY,
    DNI CHAR(8),
    nombre VARCHAR(20),
    apellido VARCHAR(50),
    telefono CHAR(9),
    idEmpresa CHAR(12),
    FOREIGN KEY (idEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE especialista (
    idEspec CHAR(12) PRIMARY KEY,
    DNI CHAR(8),
    nombre VARCHAR(20),
    apellido VARCHAR(50),
    telefono CHAR(9),
    idEmpresa CHAR(12),
    FOREIGN KEY (idEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE atencion_cliente (
    idRelac CHAR(12) PRIMARY KEY,
    DNI CHAR(8),
    nombre VARCHAR(20),
    apellido VARCHAR(50),
    telefono CHAR(9),
    idEmpresa CHAR(12),
    FOREIGN KEY (idEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE colaborador (
    idColab CHAR(12) PRIMARY KEY,
    nomEmpresa VARCHAR(100),
    direccion VARCHAR(100),
    sector VARCHAR(100),
    idEmpresa CHAR(12),
    FOREIGN KEY (idEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE cliente_contacta_atencion (
    idContacto CHAR(12),
    idRelac CHAR(12),
    PRIMARY KEY (idContacto, idRelac),
    FOREIGN KEY (idContacto) REFERENCES cliente(idContacto),
    FOREIGN KEY (idRelac) REFERENCES atencion_cliente(idRelac)
);

CREATE TABLE cliente_tratado_especialista (
    idContacto CHAR(12),
    idEspec CHAR(12),
    PRIMARY KEY (idContacto, idEspec),
    FOREIGN KEY (idContacto) REFERENCES cliente(idContacto),
    FOREIGN KEY (idEspec) REFERENCES especialista(idEspec)
);

CREATE TABLE reportero_escribe_noticia (
    idMiembro CHAR(12),
    idNoticia CHAR(12),
    PRIMARY KEY (idMiembro, idNoticia),
    FOREIGN KEY (idMiembro) REFERENCES reportero(idMiembro),
    FOREIGN KEY (idNoticia) REFERENCES noticia(idNoticia)
);
