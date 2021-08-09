#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 12 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-120.08f,0f,-180f]
execute if score #this.aj.anim aj.i matches 13 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-124.08f,0f,180f]
execute if score #this.aj.anim aj.i matches 14 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-128.08f,0f,180f]
execute if score #this.aj.anim aj.i matches 15 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-132.08f,0f,-180f]
execute if score #this.aj.anim aj.i matches 16 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-136.16f,0f,180f]
execute if score #this.aj.anim aj.i matches 17 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-139.967f,0f,180f]
execute if score #this.aj.anim aj.i matches 12..17 run tp @s ^0 ^-1.605 ^-0.25 ~ ~