#built using mc-build (https://github.com/mc-build/mc-build)

tp @s ^0.031 ^-1.535 ^0.563 ~ ~
execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run function chest:animations/open/__generated__/execute/74
execute store result entity @s Air short 1 run time query gametime