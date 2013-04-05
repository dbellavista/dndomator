# D&D'o'mator, the d&d encounter and more o-mator!

This is an alpha experiment for a simply o-mator for D&D encounters,
treasures, achievements, skill challenges and heroes management.

*WARNING*: This software is realized with a level 0 CMM, without models, test plans
or documentation.

## FEATURES

1. Autocreation of monsters, items and achievements from images (no OCR, don't worry :P).
2. Monsters differentiation in creatures, hazards, traps and terrain.
3. Creation of encounter and interactive turn management.
4. Definition of treasures composed by items. An treasure item can be assigned
	 to an hero (sorry but the treasure managements sucks).
5. Definition of achievements (missing features for automatic achievement achieve).

## INSTALLATION

1. Install and configure Ruby on Rails.
2. Create the directories:
	* `public/imgs`
	* `public/imgs/monsters`
	* `public/imgs/achievements`
	* `public/imgs/items`
3. Install gems (`bundle install`)
4. Run the server (`rails server -d`)
5. Post any error, advice, etc. as an issue :)

## MONSTERS, ITEMS and ACHIEVEMENTS CREATION/AUTOCREATION

You can autocreate monsters, items and achievements by inserting a `png` image
with the following convention:
###Monster
    public/imgs/monsters/level_Name.png
Eg:
    public/imgs/monsters/10_Ice Troll.png

By clicking on AutoCreate in the monsters index page, an uncategorized level 10
*Ice Troll* will be created. Then you can edit it assigning the kind *creature*.

###Item

    public/imgs/items/level_Item.png
Eg:
    public/imgs/monsters/6_Flame Axe.png

By clicking on AutoCreate in the items index page, a level 6 magic item named
*Flame Axe* will be created. You can edit it assigning a value in gp.

**WARNING**: The item and treasure management isn't well defined (my fault). If
you want to include in the items object like a gold coin, or a generic 250gp
Art object, you can create (manually or via autocreation) a new item:
	
    Level: 0, Name: Gold

The you can create treasures with *X* Gold items.

###Achievements

Achievements are a funny and dangerous thing I like to add to D&D campaigns.
You can define an achievements not via autocreation but creating a new
achievement and give the right name to the associated image. The image name
must be the lowercase of the name of the achievement.

    public/imgs/achievements/name.png

Eg:

	Achievement: Flame Lord
	Image: public/imgs/achievements/flame lord.png
