#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 0..16 run function chest:animations/close/__generated__/execute/339
execute if score #this.aj.anim aj.i matches 17..33 run function chest:animations/close/__generated__/execute/348
execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
execute store result entity @s Air short 1 run time query gametime