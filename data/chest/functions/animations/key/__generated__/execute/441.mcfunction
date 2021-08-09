#built using mc-build (https://github.com/mc-build/mc-build)

execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-90f]
execute if score #this.aj.anim aj.i matches 20..25 run tp @s ^0.006 ^-1.523 ^0.25 ~ ~
execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:7}
execute if score #this.aj.anim aj.i matches 21 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}