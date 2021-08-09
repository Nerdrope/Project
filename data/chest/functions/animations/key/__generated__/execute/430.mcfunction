#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 13 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-179.4f]
execute if score #this.aj.anim aj.i matches 14 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-149.4f]
execute if score #this.aj.anim aj.i matches 15 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-119.4f]
execute if score #this.aj.anim aj.i matches 16 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-90f]
execute if score #this.aj.anim aj.i matches 13 run tp @s ^0.031 ^-1.535 ^0.25 ~ ~
execute if score #this.aj.anim aj.i matches 14 run tp @s ^0.027 ^-1.531 ^0.25 ~ ~
execute if score #this.aj.anim aj.i matches 15 run tp @s ^0.02 ^-1.528 ^0.25 ~ ~
execute if score #this.aj.anim aj.i matches 16 run tp @s ^0.013 ^-1.525 ^0.25 ~ ~
execute if score #this.aj.anim aj.i matches 17..19 run tp @s ^0.006 ^-1.523 ^0.25 ~ ~
execute if score #this.aj.anim aj.i matches 13 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:6}