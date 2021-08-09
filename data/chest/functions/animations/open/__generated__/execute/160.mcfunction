#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 0..23 run function chest:animations/open/__generated__/execute/161
execute if score #this.aj.anim aj.i matches 24..47 run function chest:animations/open/__generated__/execute/180
execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
execute store result entity @s Air short 1 run time query gametime