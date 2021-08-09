#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
execute if score #this.aj.anim aj.i matches 0..3 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
execute if score #this.aj.anim aj.i matches 4 run tp @s ^0.031 ^-1.535 ^0.562 ~ ~
execute if score #this.aj.anim aj.i matches 5 run tp @s ^0.031 ^-1.535 ^0.526 ~ ~
execute if score #this.aj.anim aj.i matches 6 run tp @s ^0.031 ^-1.535 ^0.492 ~ ~
execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:5}
execute if score #this.aj.anim aj.i matches 1 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:6}