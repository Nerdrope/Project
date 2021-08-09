#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 0..12 run function chest:animations/key/__generated__/execute/377
execute if score #this.aj.anim aj.i matches 13..25 run function chest:animations/key/__generated__/execute/384
execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
execute store result entity @s Air short 1 run time query gametime