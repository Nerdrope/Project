#built using mc-build (https://github.com/mc-build/mc-build)

tp @s ^0 ^-1.605 ^-0.25 ~ ~
execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run function chest:animations/close/__generated__/execute/211
execute store result entity @s Air short 1 run time query gametime