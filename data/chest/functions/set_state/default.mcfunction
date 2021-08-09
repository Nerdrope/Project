#built using mc-build (https://github.com/mc-build/mc-build)

execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/%animation_name/set_state/default","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
tag @s add aj.state.default
scoreboard players operation #this.aj.id aj.i = @s aj.id
execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run function chest:set_state/__generated__/execute/20
execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run function chest:set_state/__generated__/execute/21
execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run function chest:set_state/__generated__/execute/22