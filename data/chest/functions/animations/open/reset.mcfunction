#built using mc-build (https://github.com/mc-build/mc-build)

execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/open/reset","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
scoreboard players set @s aj.i 0
tag @s remove aj.chest.animations.open
scoreboard players operation #this.aj.id aj.i = @s aj.id
execute as @e[type=area_effect_cloud,tag=aj.chest.Chest] if score @s aj.id = #this.aj.id aj.i run function chest:animations/open/__generated__/execute/65
execute as @e[type=area_effect_cloud,tag=aj.chest.group] if score @s aj.id = #this.aj.id aj.i run function chest:animations/open/__generated__/execute/69
execute as @e[type=area_effect_cloud,tag=aj.chest.key] if score @s aj.id = #this.aj.id aj.i run function chest:animations/open/__generated__/execute/73