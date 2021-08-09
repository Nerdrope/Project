#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 26 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.2f,-180f]
execute if score #this.aj.anim aj.i matches 27 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.9f,-180f]
execute if score #this.aj.anim aj.i matches 28 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.1f,-180f]
execute if score #this.aj.anim aj.i matches 29 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.9f,-180f]
execute if score #this.aj.anim aj.i matches 30 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.1f,-180f]
execute if score #this.aj.anim aj.i matches 31 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.8f,-180f]
execute if score #this.aj.anim aj.i matches 32 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
execute if score #this.aj.anim aj.i matches 26 run tp @s ^0 ^-2.444 ^0 ~ ~
execute if score #this.aj.anim aj.i matches 27 run tp @s ^0 ^-2.481 ^0 ~ ~
execute if score #this.aj.anim aj.i matches 28 run tp @s ^0 ^-2.519 ^0 ~ ~
execute if score #this.aj.anim aj.i matches 29 run tp @s ^0 ^-2.556 ^0 ~ ~
execute if score #this.aj.anim aj.i matches 30 run tp @s ^0 ^-2.594 ^0 ~ ~
execute if score #this.aj.anim aj.i matches 31 run tp @s ^0 ^-2.632 ^0 ~ ~
execute if score #this.aj.anim aj.i matches 32..33 run tp @s ^0 ^-2.668 ^0 ~ ~