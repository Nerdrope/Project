#built using mc-build (https://github.com/mc-build/mc-build)

tp @s ~ ~ ~ ~ ~
scoreboard players operation @s aj.id = #last_model.id aj.i
tag @s add aj.state.default
execute as @e[type=armor_stand,tag=aj.chest.key,tag=new,distance=..5.34] run function chest:__generated__/execute/10
execute store result entity @s Air short 1 run time query gametime
tag @s remove new