#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 6 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-122.625f,0f,180f]
execute if score #this.aj.anim aj.i matches 7 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-129f,0f,180f]
execute if score #this.aj.anim aj.i matches 8 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-134.747f,0f,-180f]
execute if score #this.aj.anim aj.i matches 9 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-129.807f,0f,180f]
execute if score #this.aj.anim aj.i matches 10 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-123.473f,0f,-180f]
execute if score #this.aj.anim aj.i matches 11 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-117.013f,0f,-180f]
execute if score #this.aj.anim aj.i matches 6..11 run tp @s ^0 ^-1.605 ^-0.25 ~ ~