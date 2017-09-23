CREATE TABLE Alumno (
  ID_ALUMNO VARCHAR NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR NULL,
  Apellido VARCHAR NULL,
  Fecha_nacimiento VARCHAR NULL,
  Dirección VARCHAR NULL,
  Matricula INT NULL,
  Materias VARCHAR NULL,
  Maestros VARCHAR NULL,
  Carrera VARCHAR NULL,
  Edad INT NULL,
  Horario VARCHAR NULL,
  Correo electronico VARCHAR NULL,
  Facultad VARCHAR NULL,
  PRIMARY KEY(ID_ALUMNO)
);

CREATE TABLE Clientes (
  idClientes INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR NULL,
  Apellidos VARCHAR NULL,
  Dirección VARCHAR NULL,
  Telefono INT NULL,
  PRIMARY KEY(idClientes)
);

CREATE TABLE Clientes_has_Facturas (
  Clientes_idClientes INT NOT NULL,
  Facturas_idFacturas VARCHAR NOT NULL,
  PRIMARY KEY(Clientes_idClientes, Facturas_idFacturas),
  INDEX Clientes_has_Facturas_FKIndex1(Clientes_idClientes),
  INDEX Clientes_has_Facturas_FKIndex2(Facturas_idFacturas)
);

CREATE TABLE Facturas (
  idFacturas VARCHAR NOT NULL AUTO_INCREMENT,
  Fecha VARCHAR NULL,
  id_clientes INT NULL,
  PRIMARY KEY(idFacturas)
);

CREATE TABLE Facturas_has_Ventas (
  Facturas_idFacturas VARCHAR NOT NULL,
  Ventas_idVentas INT NOT NULL,
  PRIMARY KEY(Facturas_idFacturas, Ventas_idVentas),
  INDEX Facturas_has_Ventas_FKIndex1(Facturas_idFacturas),
  INDEX Facturas_has_Ventas_FKIndex2(Ventas_idVentas)
);

CREATE TABLE Facultad (
  idFacultad VARCHAR NOT NULL AUTO_INCREMENT,
  Alumno_ID_ALUMNO VARCHAR NOT NULL,
  Biblioteca VARCHAR NULL,
  Edificios VARCHAR NULL,
  Dirección VARCHAR NULL,
  Maestros VARCHAR NULL,
  Carreras VARCHAR NULL,
  Semestres INT NULL,
  PRIMARY KEY(idFacultad, Alumno_ID_ALUMNO),
  INDEX Facultad_FKIndex1(Alumno_ID_ALUMNO)
);

CREATE TABLE Horario (
  Matutino VARCHAR NOT NULL AUTO_INCREMENT,
  Alumno_ID_ALUMNO VARCHAR NOT NULL,
  Vespertino VARCHAR NULL,
  Nocturna VARCHAR NULL,
  PRIMARY KEY(Matutino),
  INDEX Horario_FKIndex1(Alumno_ID_ALUMNO)
);

CREATE TABLE Matricula (
  Usuario INT NOT NULL AUTO_INCREMENT,
  Alumno_ID_ALUMNO VARCHAR NOT NULL,
  Contraseña VARCHAR NULL,
  Nombre VARCHAR NULL,
  Apellidos VARCHAR NULL,
  PRIMARY KEY(Usuario, Alumno_ID_ALUMNO),
  INDEX Matricula_FKIndex1(Alumno_ID_ALUMNO)
);

CREATE TABLE Ventas (
  idVentas INT NOT NULL AUTO_INCREMENT,
  id_facturas INT NULL,
  id_producto VARCHAR NULL,
  cantidad INTEGER UNSIGNED NULL,
  PRIMARY KEY(idVentas)
);


