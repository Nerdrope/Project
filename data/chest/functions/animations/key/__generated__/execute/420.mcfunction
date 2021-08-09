#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 7 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
execute if score #this.aj.anim aj.i matches 7 run tp @s ^0.031 ^-1.535 ^0.457 ~ ~
execute if score #this.aj.anim aj.i matches 8 run tp @s ^0.031 ^-1.535 ^0.423 ~ ~
execute if score #this.aj.anim aj.i matches 9 run tp @s ^0.031 ^-1.535 ^0.395 ~ ~
execute if score #this.aj.anim aj.i matches 10 run tp @s ^0.031 ^-1.535 ^0.36 ~ ~
execute if score #this.aj.anim aj.i matches 11 run tp @s ^0.031 ^-1.535 ^0.325 ~ ~
execute if score #this.aj.anim aj.i matches 12 run tp @s ^0.031 ^-1.535 ^0.284 ~ ~
execute if score #this.aj.anim aj.i matches 7 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:6}