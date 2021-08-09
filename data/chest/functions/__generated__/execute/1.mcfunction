#built using mc-build (https://github.com/mc-build/mc-build)

tp @s ~ ~ ~ ~ 0
tag @s add aj.state.default
execute store result score @s aj.id run scoreboard players add #last_model.id aj.i 1
execute rotated as @s as @e[type=area_effect_cloud,tag=aj.chest.Chest,tag=new,distance=..5.34] positioned as @s run function chest:__generated__/execute/3
execute rotated as @s as @e[type=area_effect_cloud,tag=aj.chest.group,tag=new,distance=..5.34] positioned as @s run function chest:__generated__/execute/6
execute rotated as @s as @e[type=area_effect_cloud,tag=aj.chest.key,tag=new,distance=..5.34] positioned as @s run function chest:__generated__/execute/9
tag @s remove new