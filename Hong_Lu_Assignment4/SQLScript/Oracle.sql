
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
	"DESCRIPTION" NVARCHAR2(2000)  
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

CREATE OR REPLACE
PROCEDURE UPDATE_INGREDIENT_SP (
  v_id IN NUMBER, 
  v_name IN VARCHAR2, 
  v_quantity IN VARCHAR2, 
  v_unit IN VARCHAR2, 
  v_recipeid IN NUMBER)
IS
  v_count number(5);
BEGIN 
  
		SELECT Count(*) 
		INTO v_count
		FROM rr_ingredient
		WHERE id= v_id;
	if v_count = 0 then
		INSERT INTO rr_ingredient
		(id,name,quantity,unit,recipeid)
		Values 
		(sq_ingredient_id.nextval,v_name,v_quantity,v_unit,v_recipeid);
	else
		UPDATE rr_ingredient
		SET name=v_name,
      quantity=v_quantity,
			unit=v_unit,
			recipeid=v_recipeid
		where id=v_id;
	end if;
END UPDATE_INGREDIENT_SP;


Insert into RR_RECIPE (ID,NAME,SUBMITBY,CATEGORY,COOKINGTIME,NUMBEROFSERVINGS,DESCRIPTION) values (sq_recipe_id.nextval,'Oracle-AWS','Luke','Breakfast',20,1,'Indicate this database is Oracle Database which is running on Amazon Web Service.');
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'test','1','cup',sq_recipe_id.currval);

Insert into RR_RECIPE (ID,NAME,SUBMITBY,CATEGORY,COOKINGTIME,NUMBEROFSERVINGS,DESCRIPTION) values (sq_recipe_id.nextval,'Potato Gratin','Metro','Desserts',55,4,'In large saucepan, cook potatoes in boiling salted water 20 minutes or until tender. Drain and break up with fork.Stir in cheese, sour cream, butter and green onions; add salt and pepper to taste.Spread potato mixture evenly in a 1 1/2 qt (1.5 L) shallow rectangular baking dish or in four 1 1/2 cups (375 mL) shallow baking dishes.Combine bread crumbs and 1 Tbsp. (15 mL) melted butter; sprinkle evenly over potatoes. Bake 15 minutes or until heated through.');
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'P Potatoes, peeled, quartered','6','whole',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'Diced brie','1','cup',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'sour cream','3/4','cup',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'butter, softend','1/4','cup',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'finely chopped green onions','3','teas',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'fresh bread crumbs','1','cup',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'butter, melted','1','teaspoon',sq_recipe_id.currval);

Insert into RR_RECIPE (ID,NAME,SUBMITBY,CATEGORY,COOKINGTIME,NUMBEROFSERVINGS,DESCRIPTION) values (sq_recipe_id.nextval,'Hawaiian Pita Lunch','Luke','Main dishes',30,1,'1. Preheat oven to 375 F. 2. Place pita bread on baking sheet. Spread sauce over pita. Top sauce with chicken, pineapple and green peppers. Sprinkle with cheese. 3. Bake for 7-10 minutes or until cheese is melted and pizza is bubbly.');
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'wheat pita','1','whole',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'mazzarella chess, shredded','1/2','cup',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'pizza sauce','2','teablespoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'cooked chicken breast','2 1/2','ounces',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'green peper, chopped','1/4','cup',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'fresh pineapple, diced','1/4','cup',sq_recipe_id.currval);

Insert into RR_RECIPE (ID,NAME,SUBMITBY,CATEGORY,COOKINGTIME,NUMBEROFSERVINGS,DESCRIPTION) values (sq_recipe_id.nextval,'Cholay (Curried Chickpeas)','SHAMMI EDWARDS','Main dishes',45,1,'This is a very flavourful recipe from North India, usually eaten with fried bread like bhatura or puri. I like to serve it over rice for a very filling meal. You can also try it as a quick snack over toasted bread. This recipe is much quicker to make if you use precooked canned beans, but I like to think that the authentic flavour comes from doing it the hard way!');

Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'Leaf','1','bay',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'Garbanzo Beans, drained','2','cans',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'Water','2','cups',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'Tea bag','1','bag',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'vegetable oil, divided','2','tablespoons',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'onion silce','1','whole',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'tomatoes, chopped','3','whole',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'fresh chilantro leaves','1/4','cup',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'cumin seeds','1','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'ground coriander','1','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'grated fresh ginger root','1','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'grated garlic','1','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'ground turmeric','1','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'onion, finely chopped','1','whole',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'ground cayenene pepper to taste','1','whole',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'masala','1','pinch garam',sq_recipe_id.currval);

Insert into RR_RECIPE (ID,NAME,SUBMITBY,CATEGORY,COOKINGTIME,NUMBEROFSERVINGS,DESCRIPTION) values (sq_recipe_id.nextval,'Moroccan Lamb and Chickpea Stew Dinner','Luke','Main dishes',30,8,'The original recipe was written for 8 servings, and ingredient quantities from the original recipe are included in parentheses.');
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'boneless leg of lamb','3','ounces',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'ground cumin','1','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,' ground cinnamon','1','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'Pinch of salt','1/2','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,' vegetable oil','2','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'steamed carrot slices','1/4','cup',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'Pinch of chili powder','1/2','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'garlic clove, minced','1/3','whole',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'canned chickpeas, rinsed and drained','3 1/2','teaspoons',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'beef broth, low sodium ','3','tablespoons',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'ground coriander','1','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'canned crushed tomatoes','3 1/2','ounces',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'dried apricots','2','tablespoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'sugar ','1/8','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'cooked couscous','1/2','cup',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'ground ginger','1/8','teaspoon',sq_recipe_id.currval);
Insert into RR_INGREDIENT (ID,NAME,QUANTITY,UNIT,RECIPEID) values (sq_ingredient_id.nextval,'medium onion, cut into thin wedges','1/8','each',sq_recipe_id.currval);
commit;

--for centennial College Oracle 1
update rr_recipe set name='Centennial College Oracle 1', description='Indicate this database is Oracle Database which is running on Centennial College Oracle 1.' where id=1;
commit;

----for local Oracle
update rr_recipe set name='local Oracle', description='Indicate this database is Oracle Database which is running on local Oracle.' where id=1;
commit;

