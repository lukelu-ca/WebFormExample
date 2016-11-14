
alter table rr_ingredient drop constraint FK_ingredient_recipe_recipeID;
drop table rr_ingredient;
drop table RR_Recipe;
drop sequence sq_recipe_id;
drop SEQUENCE sq_ingredient_id;

--
-- RR_RECIPE
--
  CREATE TABLE "RR_RECIPE" 
   ("ID" NUMBER(5) primary key,
	"NAME" NVARCHAR2(50) NOT NULL,
	"SUBMITBY" NVARCHAR2(50) NOT NULL,
	"CATEGORY" NVARCHAR2(50) NOT NULL,
	"COOKINGTIME" NUMBER(5),
	"NUMBEROFSERVINGS" NUMBER(5),
	"DESCRIPTION" NVARCHAR2(500)  
   );
   
--
-- RR_INGREDIENT
--
  CREATE TABLE "RR_INGREDIENT" 
   ("ID" NUMBER(5)  primary key,
	"NAME" NVARCHAR2(50) NOT NULL,
	"QUANTITY" NVARCHAR2(20),
	"UNIT" NVARCHAR2(20), 
   "RECIPEID" NUMBER(5) NOT NULL
   );

   
alter table rr_ingredient
add constraint FK_ingredient_recipe_recipeID FOREIGN  key (recipeid) references rr_recipe (id);

create sequence sq_recipe_id
increment by 1
start with 1
nocycle
cache 20
noorder;

create sequence sq_ingredient_id
increment by 1
start with 1
nocycle
cache 20
noorder;


create or replace 
procedure 
INSERT_RECIPE_SP
(v_RecipeID out number,
  v_name in  nvarchar2,
  v_submitby in  nvarchar2,
  v_category in  nvarchar2,
  v_cookingtime in number,
  v_numberOfServings in number,
  v_description in nvarchar2
)
IS
BEGIN
  INSERT INTO RR_RECIPE VALUES (sq_recipe_id.nextval,v_name,v_submitby,v_category,v_cookingtime,v_numberOfServings,v_description);
  select sq_recipe_id.currval into v_recipeid from dual;
END INSERT_RECIPE_SP;

