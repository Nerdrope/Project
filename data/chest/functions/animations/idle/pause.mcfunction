#built using mc-build (https://github.com/mc-build/mc-build)

execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/idle/pause","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
tag @s remove aj.chest.animations.idle