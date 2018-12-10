/*================================================================================*/
/* DDL SCRIPT                                                                     */
/*================================================================================*/
/*  Title    :                                                                    */
/*  FileName : databaseIPCAR.ecm                                                  */
/*  Platform : MySQL 5                                                            */
/*  Version  : Concept                                                            */
/*  Date     : sábado, 8 de diciembre de 2018                                     */
/*================================================================================*/
/*================================================================================*/
/* CREATE TABLES                                                                  */
/*================================================================================*/

CREATE TABLE cat_card_brands (
  id INTEGER AUTO_INCREMENT NOT NULL,
  description VARCHAR(100) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_cat_card_brands PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN cat_card_brands.id
id marca de la tarjeta
*/

/*
COMMENT ON COLUMN cat_card_brands.description
visa/mastercard/american express
*/

CREATE TABLE drivers (
  id INTEGER AUTO_INCREMENT NOT NULL,
  CONSTRAINT PK_drivers PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN drivers.id
id del conductor
*/

CREATE TABLE states (
  id INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_states PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN states.name
Nombre de la entidad
*/

CREATE TABLE municipalities (
  id INTEGER NOT NULL,
  id_state INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_municipalities PRIMARY KEY (id)
);

CREATE TABLE paymnet_methods (
  id INTEGER AUTO_INCREMENT NOT NULL,
  description VARCHAR(100) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_paymnet_methods PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN paymnet_methods.description
tarjeta credito/debito/paypal
*/

CREATE TABLE users (
  id INTEGER AUTO_INCREMENT NOT NULL,
  names VARCHAR(100) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  ine VARCHAR(20) NOT NULL,
  rfc VARCHAR(15),
  email VARCHAR(100) NOT NULL,
  cellphone VARCHAR(20) NOT NULL,
  password VARCHAR(100) NOT NULL,
  registration_date TIMESTAMP NOT NULL,
  photo VARCHAR(255),
  is_online BOOL NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_users PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN users.names
nombres
*/

/*
COMMENT ON COLUMN users.first_name
apellido paterno
*/

/*
COMMENT ON COLUMN users.last_name
apellido materno
*/

/*
COMMENT ON COLUMN users.ine
INE
*/

/*
COMMENT ON COLUMN users.rfc
Tiene que ser con homoclave
*/

/*
COMMENT ON COLUMN users.cellphone
numero de telefono como login
*/

/*
COMMENT ON COLUMN users.photo
codebase64
*/

/*
COMMENT ON COLUMN users.is_online
el modo online/offline del usuario
*/

/*
COMMENT ON COLUMN users.fdl
Flag delete
*/

/*
COMMENT ON COLUMN users.cbu
create by user
*/

/*
COMMENT ON COLUMN users.cat
create at timestamp
*/

/*
COMMENT ON COLUMN users.luu
last update user
*/

/*
COMMENT ON COLUMN users.uat
update at timestamp
*/

CREATE TABLE user_payment_method (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_user INTEGER NOT NULL,
  id_payment_method INTEGER NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_user_payment_method PRIMARY KEY (id)
);

CREATE TABLE user_data_cards (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_user_payment_method INTEGER NOT NULL,
  id_card_brand INTEGER NOT NULL,
  owner VARCHAR(200) NOT NULL,
  card_number VARCHAR(16) NOT NULL,
  expire_date DATE NOT NULL,
  cvc VARCHAR(3),
  address VARCHAR(200),
  postal_code VARCHAR(5),
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_user_data_cards PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN user_data_cards.owner
tutular
*/

/*
COMMENT ON COLUMN user_data_cards.card_number
numero de tarjeta de credito
*/

/*
COMMENT ON COLUMN user_data_cards.expire_date
fecha de expiracion  mes/año
*/

/*
COMMENT ON COLUMN user_data_cards.cvc
codigo cvc
*/

CREATE TABLE zones (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_state INTEGER NOT NULL,
  id_municipality INTEGER NOT NULL,
  id_postal_code INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  postal_code VARCHAR(5) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_zones PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN zones.id
id de la colonia
*/

CREATE TABLE user_invoices (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_payment_method INTEGER NOT NULL,
  company VARCHAR(200) NOT NULL,
  street VARCHAR(200) NOT NULL,
  outdoor_number VARCHAR(200) NOT NULL,
  indoor_number VARCHAR(200),
  zone VARCHAR(200) NOT NULL,
  postal_code VARCHAR(5) NOT NULL,
  rfc VARCHAR(200) NOT NULL,
  id_zone INTEGER NOT NULL,
  is_automatic_invoice BOOL,
  email VARCHAR(150),
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_user_invoices PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN user_invoices.company
compañia/nombre legal
*/

/*
COMMENT ON COLUMN user_invoices.street
calle
*/

/*
COMMENT ON COLUMN user_invoices.outdoor_number
numero exterior
*/

/*
COMMENT ON COLUMN user_invoices.indoor_number
numero interior
*/

/*
COMMENT ON COLUMN user_invoices.zone
colonia
*/

/*
COMMENT ON COLUMN user_invoices.postal_code
codigo postal
*/

/*
COMMENT ON COLUMN user_invoices.is_automatic_invoice
si requiere la facturación automatica
*/

/*================================================================================*/
/* CREATE FOREIGN KEYS                                                            */
/*================================================================================*/

ALTER TABLE municipalities
  ADD CONSTRAINT FK_municipalities_states
  FOREIGN KEY (id_state) REFERENCES states (id);

ALTER TABLE user_payment_method
  ADD CONSTRAINT FK_user_payment_method_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE user_payment_method
  ADD CONSTRAINT FK_user_payment_method_paymnet_methods
  FOREIGN KEY (id_payment_method) REFERENCES paymnet_methods (id);

ALTER TABLE user_data_cards
  ADD CONSTRAINT FK_user_data_cards_user_payment_method
  FOREIGN KEY (id_user_payment_method) REFERENCES user_payment_method (id);

ALTER TABLE user_data_cards
  ADD CONSTRAINT FK_user_data_cards_catalog_card_brands
  FOREIGN KEY (id_card_brand) REFERENCES cat_card_brands (id);

ALTER TABLE zones
  ADD CONSTRAINT FK_zones_states
  FOREIGN KEY (id_state) REFERENCES states (id);

ALTER TABLE zones
  ADD CONSTRAINT FK_zones_municipalities
  FOREIGN KEY (id_municipality) REFERENCES municipalities (id);

ALTER TABLE user_invoices
  ADD CONSTRAINT FK_user_invoices_paymnet_methods
  FOREIGN KEY (id_payment_method) REFERENCES paymnet_methods (id);

ALTER TABLE user_invoices
  ADD CONSTRAINT FK_user_invoices_zones
  FOREIGN KEY (id_zone) REFERENCES zones (id);
