-- TODO
-- ENUM
-- Claves externas
-- Clave Primaria
-- Se puede fusionar director?
-- Se puede usar int AUTO_INCREMENT?
CREATE TABLE clientes(
  cod_cliente INT PRIMARY_KEY AUTO_INCREMENT,
  DNI VARCHAR(9),
  nombre VARCHAR(100),
  telefono VARCHAR(9)
);
CREATE TABLE reserva(
  cod_cliente INT,
  cod_hotel INT,
  fecha_entrada DATE,
  fecha_salida DATE,
  habitacion INT,
  precio DECIMAL(8, 2),
  PRIMARY_KEY(
    cod_cliente,
    cod_hotel,
    fecha_entrada,
    fecha_salida
  ),
  FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente),
  FOREIGN KEY (cod_hotel) REFERENCES hotel(cod_hotel)
);
CREATE TABLE hotel(
  cod_hotel INT PRIMARY_KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  habitaciones_sencillas INT,
  habitaciones_dobles INT,
  ciudad VARCHAR(100),
  provincia ENUM()
);
CREATE TABLE empleado(
  cod_empleado INT PRIMARY_KEY AUTO_INCREMENT,
  cod_hotel INT,
  DNI VARCHAR(9),
  nombre VARCHAR(100),
  telefono VARCHAR(9),
  direccion_actual VARCHAR(255),
  fecha_comienzo DATE,
  salario DECIMAL(8, 2),
  FOREIGN KEY (cod_hotel) REFERENCES hotel(cod_hotel)
);
CREATE TABLE director(
  cod_hotel INT PRIMARY_KEY,
  cod_empleado INT,
  FOREIGN KEY (cod_hotel) REFERENCES hotel(cod_hotel),
  FOREIGN KEY (cod_empleado) REFERENCES empleado(cod_empleado)
);
CREATE TABLE articulo(
  cod_articulo INT PRIMARY_KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  tipo ENUM(),
);
CREATE TABLE proveedor(
  cod_prov INT PRIMARY_KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  provincia ENUM()
);
CREATE TABLE suministro(
  cod_articulo INT,
  cod_prov INT,
  cantidad INT,
  precio DECIMAL(8, 2),
  fecha DATE,
  FOREIGN KEY (cod_articulo) REFERENCES articulo(cod_articulo),
  FOREIGN KEY (cod_prov) REFERENCES proovedor(cod_prov)
);
CREATE TABLE pedido(
  cod_hotel INT,
  cod_articulo INT,
  cod_prov INT,
  PRIMARY_KEY(cod_hotel, cod_articulo, cod_prov),
  FOREIGN KEY (cod_hotel) REFERENCES hotel(cod_hotel),
  FOREIGN KEY (cod_articulo) REFERENCES articulo(cod_articulo),
  FOREIGN KEY (cod_prov) REFERENCES proovedor(cod_prov)
);