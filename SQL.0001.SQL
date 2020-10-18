-- --------------------------------------------------------
-- очистка таблицы
truncate table  nameTable;

-- -----------------------------------------------------
-- заполнение таблицы случайными числами от 1 до 100
create table tab02
(
 id int NOT NULL AUTO_INCREMENT,
 p1 int,
 p2 int,
 p3 int,
 PRIMARY KEY (p1)
)

insert into travel_list.tab02 (p1, p2, p3) values (1 + ceil(rand() * (100 - 1)), 1+ceil(rand()*(100-1)), 1+ceil(rand()*(100-1)) );

insert into travel_list.tab02 (p1) select 1+ceil(rand()*(100-1)) from tab02 ; 
update travel_list.tab02 
set p2=1+ceil(rand()*(100-1)), p3=1+ceil(rand()*(100-1)) where p2 is NULL or p3 is NULL ;




-- ------------------------------------------------------
-- вставка случайного числа 
insert into tab02 (p1) select rand()*10000  from (
    select 0 as i
    union select 1 union select 2 union select 3 
     union select 4 union select 5 union select 6 
     union select 7 union select 8 union select 9
    ) as t1, (
    select 0 as i
        union select 1 union select 2 union select 3
        union select 4 union select 5 union select 6
        union select 7 union select 8 union select 9
    ) as t2, (
    select 0 as i
        union select 1 union select 2 union select 3
        union select 4 union select 5 union select 6
        union select 7 union select 8 union select 9
    ) as t3 ;

-- ------------------------------------------------------------------------- 
-- процедура заполнения случайными числами 
-- use travel_list;
delimiter $$
create procedure Insert2Rand( in NameTab varchar(50), in NameCol varchar(50), in NomRows int, in MinVal int, in MaxVal int)
  begin
       declare i int ;
       set     i = 1 ;
       start transaction ;
       while i <= NumRows do
          insert into NameTab (NameCol) values (MinVal + ceil(rand()*(MaxVal-MinVal))  );
          set i = i + 1 ;
       end while;
       commit;
  end $$
delimiter;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------
-- _______________________________________________________