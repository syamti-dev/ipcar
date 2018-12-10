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
/* DROP FOREIGN KEYS                                                              */
/*================================================================================*/

ALTER TABLE municipalities DROP FOREIGN KEY FK_municipalities_states;

ALTER TABLE user_payment_method DROP FOREIGN KEY FK_user_payment_method_users;

ALTER TABLE user_payment_method DROP FOREIGN KEY FK_user_payment_method_paymnet_methods;

ALTER TABLE user_data_cards DROP FOREIGN KEY FK_user_data_cards_user_payment_method;

ALTER TABLE user_data_cards DROP FOREIGN KEY FK_user_data_cards_catalog_card_brands;

ALTER TABLE zones DROP FOREIGN KEY FK_zones_states;

ALTER TABLE zones DROP FOREIGN KEY FK_zones_municipalities;

ALTER TABLE user_invoices DROP FOREIGN KEY FK_user_invoices_paymnet_methods;

ALTER TABLE user_invoices DROP FOREIGN KEY FK_user_invoices_zones;

/*================================================================================*/
/* DROP TABLES                                                                    */
/*================================================================================*/

ALTER TABLE cat_card_brands DROP PRIMARY KEY;

DROP TABLE cat_card_brands;

ALTER TABLE drivers DROP PRIMARY KEY;

DROP TABLE drivers;

ALTER TABLE states DROP PRIMARY KEY;

DROP TABLE states;

ALTER TABLE municipalities DROP PRIMARY KEY;

DROP TABLE municipalities;

ALTER TABLE paymnet_methods DROP PRIMARY KEY;

DROP TABLE paymnet_methods;

ALTER TABLE users DROP PRIMARY KEY;

DROP TABLE users;

ALTER TABLE user_payment_method DROP PRIMARY KEY;

DROP TABLE user_payment_method;

ALTER TABLE user_data_cards DROP PRIMARY KEY;

DROP TABLE user_data_cards;

ALTER TABLE zones DROP PRIMARY KEY;

DROP TABLE zones;

ALTER TABLE user_invoices DROP PRIMARY KEY;

DROP TABLE user_invoices;
