#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation #this.aj.id aj.i = @s aj.id
scoreboard players operation #this.aj.anim aj.i = @s aj.i
execute as @e[type=area_effect_cloud,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run function chest:animations/key/__generated__/execute/376
execute as @e[type=area_effect_cloud,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run function chest:animations/key/__generated__/execute/393
execute as @e[type=area_effect_cloud,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run function chest:animations/key/__generated__/execute/410
scoreboard players add @s aj.i 1
execute if score @s aj.i matches 26.. run scoreboard players set @s aj.i 0