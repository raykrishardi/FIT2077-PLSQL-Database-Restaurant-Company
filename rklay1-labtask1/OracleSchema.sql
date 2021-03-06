spool ./OracleOutput.txt
/*
RAY KRISHARDI LAYADI
RKLAY1 - 26445549
*/

-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2016-04-11 20:25:49 AEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g


drop sequence diner_diner_num_seq ;

drop sequence diner_food_item_diner_food_ite ;

drop sequence food_item_food_item_num_seq ;

drop sequence tables_tables_num_seq ;

drop
  table beverage cascade constraints ;

drop
  table dessert cascade constraints ;

drop
  table diner cascade constraints ;

drop
  table diner_food_item cascade constraints ;

drop
  table entree cascade constraints ;

drop
  table food_item cascade constraints ;

drop
  table large cascade constraints ;

drop
  table main cascade constraints ;

drop
  table seat cascade constraints ;

drop
  table small cascade constraints ;

drop
  table tables cascade constraints ;

create
  table beverage
  (
    food_item_num number (5) not null ,
    alcohol_level number (5,2) not null
  ) ;



comment on column beverage.food_item_num
is
  'Unique number for each food item (ex: 1. omelette, etc)' ;

  comment on column beverage.alcohol_level
is
  'The percentage amount of alcohol contained in the beverage' ;

alter table beverage add constraint beverage_pk primary key ( food_item_num ) ;


create
  table dessert
  (
    food_item_num           number (5) not null ,
    dessert_is_lactose_free char (1) not null
  ) ;



alter table dessert add constraint chk_dessert_is_lactose_free check (
dessert_is_lactose_free in ('N', 'Y')) ;


comment on column dessert.food_item_num
is
  'Unique number for each food item (ex: 1. omelette, etc)' ;

  comment on column dessert.dessert_is_lactose_free
is
  'Determine whether the dessert is lactose free ("Y" = Yes, "N" = No)' ;

alter table dessert add constraint dessert_pk primary key ( food_item_num ) ;


create
  table diner
  (
    diner_num number (5) not null
  ) ;



comment on column diner.diner_num
is
  'Unique number for each diner (in this case each diner number could be a representative for another diner)'
  ;

alter table diner add constraint diner_pk primary key ( diner_num ) ;


create
  table diner_food_item
  (
    diner_food_item_id   number (5) not null ,
    diner_num            number (5) not null ,
    food_item_num        number (5) not null ,
    diner_food_item_size char (1) not null
  ) ;



alter table diner_food_item add constraint chk_diner_food_item_size check (
diner_food_item_size in ('L', 'R', 'S')) ;


comment on column diner_food_item.diner_food_item_id
is
  'Unique number for each food item that is being ordered by a particular diner'
  ;

  comment on column diner_food_item.diner_num
is
  'Unique number for each diner (in this case each diner number could be a representative for another diner)'
  ;

  comment on column diner_food_item.food_item_num
is
  'Unique number for each food item (ex: 1. omelette, etc)' ;

  comment on column diner_food_item.diner_food_item_size
is
  'Determine the serve size of the ordered food item ("R" = regular/standard, "S" = Small, "L" = Large)'
  ;

alter table diner_food_item add constraint diner_food_item_pk primary key (
diner_food_item_id ) ;


create
  table entree
  (
    food_item_num number (5) not null ,
    entree_type   char (1) not null
  ) ;



alter table entree add constraint chk_entree_type check ( entree_type in ('C',
'H')) ;


comment on column entree.food_item_num
is
  'Unique number for each food item (ex: 1. omelette, etc)' ;

  comment on column entree.entree_type
is
  'Determine whether the entree is cold or hot ("C" = Cold, "H" = Hot)' ;

alter table entree add constraint entree_pk primary key ( food_item_num ) ;


create
  table food_item
  (
    food_item_num              number (5) not null ,
    food_item_name             varchar2 (50) not null ,
    food_item_description      varchar2 (50) not null ,
    food_item_std_cost         number (14,2) not null ,
    food_item_std_energy_in_kj number (8,2) not null ,
    food_item_type             char (1) not null
  ) ;



alter table food_item add constraint chk_food_item_type check ( food_item_type
in ('B', 'D', 'E', 'M')) ;


comment on column food_item.food_item_num
is
  'Unique number for each food item (ex: 1. omelette, etc)' ;

  comment on column food_item.food_item_name
is
  'Name of the food item' ;

  comment on column food_item.food_item_description
is
  'Description for the food item' ;

  comment on column food_item.food_item_std_cost
is
  'Price for the standard serve of a particular food item' ;

  comment on column food_item.food_item_std_energy_in_kj
is
  'The approximate amount of energy (Kj) contained in the standard serve of a particular food item'
  ;

  comment on column food_item.food_item_type
is
  'Type of the food item ("B" = Beverage, "E" = Entree, "M" = Main, "D" = Dessert)'
  ;

alter table food_item add constraint food_item_pk primary key ( food_item_num )
;


create
  table large
  (
    food_item_num           number (5) not null ,
    main_large_serve_cost   number (14,2) not null ,
    main_large_energy_in_kj number (8,2) not null
  ) ;



comment on column large.food_item_num
is
  'Unique number for each food item (ex: 1. omelette, etc)' ;

  comment on column large.main_large_serve_cost
is
  'Price for the large serve of a particular main' ;

  comment on column large.main_large_energy_in_kj
is
  'The approximate amount of energy (Kj) contained in the large serve of a particular main'
  ;

alter table large add constraint large_pk primary key ( food_item_num ) ;


create
  table main
  (
    food_item_num           number (5) not null ,
    main_is_vegetarian      char (1) not null ,
    main_is_gluten_free     char (1) not null ,
    main_available_in_small char (1) ,
    main_available_in_large char (1)
  ) ;



alter table main add constraint chk_main_is_vegetarian check (
main_is_vegetarian in ('N', 'Y')) ;


alter table main add constraint chk_main_is_gluten_free check (
main_is_gluten_free in ('N', 'Y')) ;


alter table main add constraint chk_main_available_in_small check (
main_available_in_small in ('N', 'Y')) ;


alter table main add constraint chk_main_available_in_large check (
main_available_in_large in ('N', 'Y')) ;


comment on column main.food_item_num
is
  'Unique number for each food item (ex: 1. omelette, etc)' ;

  comment on column main.main_is_vegetarian
is
  'Determine whether the main is vegetarian ("Y" = Yes, "N" = No)' ;

  comment on column main.main_is_gluten_free
is
  'Determine whether the main is gluten free ("Y" = Yes, "N" = No)' ;

  comment on column main.main_available_in_small
is
  'Determine whether the main is available in small serve size ("Y" = Yes, "N" = No)'
  ;

  comment on column main.main_available_in_large
is
  'Determine whether the main is available in large serve size ("Y" = Yes, "N" = No)'
  ;

alter table main add constraint main_pk primary key ( food_item_num ) ;


create
  table seat
  (
    tables_num number (5) not null ,
    diner_num  number (5) not null ,
    seat_num   number (5) not null
  ) ;



comment on column seat.tables_num
is
  'Unique number for each table' ;

  comment on column seat.diner_num
is
  'Unique number for each diner (in this case each diner number could be a representative for another diner)'
  ;

  comment on column seat.seat_num
is
  'Unique seat number for each diner sitting at a specific table number' ;

alter table seat add constraint seat_pk primary key ( seat_num, tables_num,
diner_num ) ;


create
  table small
  (
    food_item_num           number (5) not null ,
    main_small_serve_cost   number (14,2) not null ,
    main_small_energy_in_kj number (8,2) not null
  ) ;



comment on column small.food_item_num
is
  'Unique number for each food item (ex: 1. omelette, etc)' ;

  comment on column small.main_small_serve_cost
is
  'Price for the small serve of a particular main' ;

  comment on column small.main_small_energy_in_kj
is
  'The approximate amount of energy (Kj) contained in the small serve of a particular main'
  ;

alter table small add constraint small_pk primary key ( food_item_num ) ;


create
  table tables
  (
    tables_num           number (5) not null ,
    tables_seat_capacity number (5) not null ,
    tables_location      varchar2 (20) not null
  ) ;



comment on column tables.tables_num
is
  'Unique number for each table' ;

  comment on column tables.tables_seat_capacity
is
  'Table seating capacity (how many diners/people can sit at the table)' ;

  comment on column tables.tables_location
is
  'Table location (near the windows, etc)' ;

alter table tables add constraint tables_pk primary key ( tables_num ) ;



alter table beverage add constraint beverage_food_item_fk foreign key (
food_item_num ) references food_item ( food_item_num ) ;


alter table dessert add constraint dessert_food_item_fk foreign key (
food_item_num ) references food_item ( food_item_num ) ;


alter table diner_food_item add constraint diner_food_item_fk foreign key (
food_item_num ) references food_item ( food_item_num ) ;


alter table entree add constraint entree_food_item_fk foreign key (
food_item_num ) references food_item ( food_item_num ) ;


alter table diner_food_item add constraint food_item_diner_fk foreign key (
diner_num ) references diner ( diner_num ) ;


alter table large add constraint large_main_fk foreign key ( food_item_num )
references main ( food_item_num ) ;


alter table main add constraint main_food_item_fk foreign key ( food_item_num )
references food_item ( food_item_num ) ;


alter table seat add constraint seat_diner_fk foreign key ( diner_num )
references diner ( diner_num ) ;


alter table seat add constraint seat_tables_fk foreign key ( tables_num )
references tables ( tables_num ) ;


alter table small add constraint small_main_fk foreign key ( food_item_num )
references main ( food_item_num ) ;

create or replace trigger arc_fk_food_item_subtypes_main before
  insert
  or
  update
    of food_item_num on main for each row declare d char (1);
  begin
    select
      a.food_item_type
    into
      d
    from
      food_item a
    where
      a.food_item_num = :new.food_item_num;
    if (d            is null or d <> 'M') then
      raise_application_error(-20223,
      'FK main_food_item_FK in Table main violates Arc constraint on Table food_item - discriminator column food_item_type doesn''t have value ''M'''
      );
    end if;
  exception
  when no_data_found then
    null;
  when others then
    raise;
  end;
  /

create or replace trigger arc_fk_food_item_subty_dessert before
  insert
  or
  update
    of food_item_num on dessert for each row declare d char (1);
  begin
    select
      a.food_item_type
    into
      d
    from
      food_item a
    where
      a.food_item_num = :new.food_item_num;
    if (d            is null or d <> 'D') then
      raise_application_error(-20223,
      'FK dessert_food_item_FK in Table dessert violates Arc constraint on Table food_item - discriminator column food_item_type doesn''t have value ''D'''
      );
    end if;
  exception
  when no_data_found then
    null;
  when others then
    raise;
  end;
  /

create or replace trigger arc_fk_food_item_subtyp_entree before
  insert
  or
  update
    of food_item_num on entree for each row declare d char (1);
  begin
    select
      a.food_item_type
    into
      d
    from
      food_item a
    where
      a.food_item_num = :new.food_item_num;
    if (d            is null or d <> 'E') then
      raise_application_error(-20223,
      'FK entree_food_item_FK in Table entree violates Arc constraint on Table food_item - discriminator column food_item_type doesn''t have value ''E'''
      );
    end if;
  exception
  when no_data_found then
    null;
  when others then
    raise;
  end;
  /

create or replace trigger arc_fk_food_item_subt_beverage before
  insert
  or
  update
    of food_item_num on beverage for each row declare d char (1);
  begin
    select
      a.food_item_type
    into
      d
    from
      food_item a
    where
      a.food_item_num = :new.food_item_num;
    if (d            is null or d <> 'B') then
      raise_application_error(-20223,
      'FK beverage_food_item_FK in Table beverage violates Arc constraint on Table food_item - discriminator column food_item_type doesn''t have value ''B'''
      );
    end if;
  exception
  when no_data_found then
    null;
  when others then
    raise;
  end;
  /

create sequence diner_diner_num_seq start with 1 nocache order ;

create sequence diner_food_item_diner_food_ite start with 1 nocache order ;

create sequence food_item_food_item_num_seq start with 1 nocache order ;

create sequence tables_tables_num_seq start with 1 nocache order ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             29
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           4
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          4
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

spool off