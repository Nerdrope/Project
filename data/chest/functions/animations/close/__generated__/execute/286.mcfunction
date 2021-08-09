#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 9 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-165.9f,0f,180f]
execute if score #this.aj.anim aj.i matches 10 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-169.1f,0f,-180f]
execute if score #this.aj.anim aj.i matches 11 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-174.1f,0f,180f]
execute if score #this.aj.anim aj.i matches 12 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.1f,-180f]
execute if score #this.aj.anim aj.i matches 13 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.9f,-180f]
execute if score #this.aj.anim aj.i matches 14 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.1f,-180f]
execute if score #this.aj.anim aj.i matches 15 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.8f,-180f]
execute if score #this.aj.anim aj.i matches 16 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.2f,-180f]
execute if score #this.aj.anim aj.i matches 9..11 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
execute if score #this.aj.anim aj.i matches 12 run tp @s ^0 ^-1.606 ^-0.25 ~ ~
execute if score #this.aj.anim aj.i matches 13 run tp @s ^0.021 ^-1.644 ^-0.249 ~ ~
execute if score #this.aj.anim aj.i matches 14 run tp @s ^0 ^-1.681 ^-0.25 ~ ~
execute if score #this.aj.anim aj.i matches 15 run tp @s ^-0.021 ^-1.719 ^-0.249 ~ ~
execute if score #this.aj.anim aj.i matches 16 run tp @s ^0.001 ^-1.757 ^-0.25 ~ ~