#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
execute if score #this.aj.anim aj.i matches 20..25 run tp @s ^0 ^-1.918 ^0 ~ ~