#built using mc-build (https://github.com/mc-build/mc-build)

execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:remove/this_model","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
scoreboard players operation #this.aj.id aj.i = @s aj.id
execute at @s as @e[type=armor_stand,tag=aj.chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run kill @s
execute at @s as @e[type=area_effect_cloud,tag=aj.chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run kill @s