
alter table rr_ingredient drop constraint FK_ingredient_recipe_recipeID;
drop table rr_ingredient;
drop table RR_Recipe;


--
-- RR_RECIPE
--
  CREATE TABLE "RR_RECIPE" 
   ("ID" int primary key identity,
	"NAME" nvarchar(50) NOT NULL,
	"SUBMITBY" NVARCHAR(50) NOT NULL,
	"CATEGORY" NVARCHAR(50) NOT NULL,
	"COOKINGTIME" int,
	"NUMBEROFSERVINGS" int,
	"DESCRIPTION" NVARCHAR(2000)  
   );

--
-- RR_INGREDIENT
--
  CREATE TABLE "RR_INGREDIENT" 
   ("ID" int  primary key identity,
	"NAME" NVARCHAR(50) NOT NULL,
	"QUANTITY" NVARCHAR(20),
	"UNIT" NVARCHAR(20), 
   "RECIPEID" int NOT NULL
   );

   
alter table rr_ingredient
add constraint FK_ingredient_recipe_recipeID FOREIGN  key (recipeid) references rr_recipe (id);

go

IF ( OBJECT_ID('dbo.INSERT_RECIPE_SP') IS NOT NULL ) 
   DROP PROCEDURE dbo.INSERT_RECIPE_SP
GO

create procedure INSERT_RECIPE_SP
  @v_RecipeID  int OUTPUT,
  @v_name   nvarchar(50),
  @v_submitby   nvarchar(50),
  @v_category   nvarchar(50),
  @v_cookingtime  int,
  @v_numberOfServings  int,
  @v_description  nvarchar(2000)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO RR_RECIPE VALUES (@v_name,@v_submitby,@v_category,@v_cookingtime,@v_numberOfServings,@v_description);
  SELECT @v_RecipeID = SCOPE_IDENTITY();
  SELECT @v_RecipeID AS id;
  RETURN
END

go

Insert into RR_RECIPE (NAME,SUBMITBY,CATEGORY,COOKINGTIME,NUMBEROFSERVINGS,DESCRIPTION) values ('Cholay (Curried Chickpeas)','SHAMMI EDWARDS','Main dishes',45,1,'This is a very flavourful recipe from North India, usually eaten with fried bread like bhatura or puri. I like to serve it over rice for a very filling meal. You can also try it as a quick snack over toasted bread. This recipe is much quicker to make if you use precooked canned beans, but I like to think that the authentic flavour comes from doing it the hard way!');
Insert into RR_RECIPE (NAME,SUBMITBY,CATEGORY,COOKINGTIME,NUMBEROFSERVINGS,DESCRIPTION) values ('Hawaiian Pita Lunch','Luke','Main dishes',30,1,'1. Preheat oven to 375 F. 2. Place pita bread on baking sheet. Spread sauce over pita. Top sauce with chicken, pineapple and green peppers. Sprinkle with cheese. 3. Bake for 7-10 minutes or until cheese is melted and pizza is bubbly.');
Insert into RR_RECIPE (NAME,SUBMITBY,CATEGORY,COOKINGTIME,NUMBEROFSERVINGS,DESCRIPTION) values ('Moroccan Lamb and Chickpea Stew Dinner','Luke','Main dishes',30,8,'The original recipe was written for 8 servings, and ingredient quantities from the original recipe are included in parentheses.');
Insert into RR_RECIPE (NAME,SUBMITBY,CATEGORY,COOKINGTIME,NUMBEROFSERVINGS,DESCRIPTION) values ('Potato Gratin','Metro','Desserts',55,4,'In large saucepan, cook potatoes in boiling salted water 20 minutes or until tender. Drain and break up with fork. Stir in cheese, sour cream, butter and green onions; add salt and pepper to taste.Spread potato mixture evenly in a 1 1/2 qt (1.5 L) shallow rectangular baking dish or in four 1 1/2 cups (375 mL) shallow baking dishes.Combine bread crumbs and 1 Tbsp. (15 mL) melted butter; sprinkle evenly over potatoes. Bake 15 minutes or until heated through.');



Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('P Potatoes, peeled, quartered','6','whole',4);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('Diced brie','1','cup',4);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('sour cream','3/4','cup',4);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('butter, softend','1/4','cup',4);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('finely chopped green onions','3','teas',4);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('fresh bread crumbs','1','cup',4);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('butter, melted','1','teaspoon',4);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('wheat pita','1','whole',2);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('mazzarella chess, shredded','1/2','cup',2);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('pizza sauce','2','teablespoon',2);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('cooked chicken breast','2 1/2','ounces',2);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('green peper, chopped','1/4','cup',2);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('fresh pineapple, diced','1/4','cup',2);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('Leaf','1','bay',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('Garbanzo Beans, drained','2','cans',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('Water','2','cups',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('Tea bag','1','bag',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('vegetable oil, divided','2','tablespoons',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('onion silce','1','whole',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('tomatoes, chopped','3','whole',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('fresh chilantro leaves','1/4','cup',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('cumin seeds','1','teaspoon',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('ground coriander','1','teaspoon',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('grated fresh ginger root','1','teaspoon',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('grated garlic','1','teaspoon',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('ground turmeric','1','teaspoon',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('onion, finely chopped','1','whole',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('ground cayenene pepper to taste','1','whole',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('masala','1','pinch garam',1);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('boneless leg of lamb','3','ounces',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('ground cumin','1','teaspoon',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('ground cinnamon','1','teaspoon',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('Pinch of salt','1/2','teaspoon',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('vegetable oil','2','teaspoon',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('steamed carrot slices','1/4','cup',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('Pinch of chili powder','1/2','teaspoon',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('garlic clove, minced','1/3','whole',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('canned chickpeas, rinsed and drained','3 1/2','teaspoons',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('beef broth, low sodium ','3','tablespoons',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('ground coriander','1','teaspoon',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('canned crushed tomatoes','3 1/2','ounces',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('dried apricots','2','tablespoon',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('sugar ','1/8','teaspoon',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('cooked couscous','1/2','cup',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('ground ginger','1/8','teaspoon',3);
Insert into RR_INGREDIENT (NAME,QUANTITY,UNIT,RECIPEID) values ('medium onion, cut into thin wedges','1/8','each',3);
