#built using mc-build (https://github.com/mc-build/mc-build)

data modify entity @s Pose.Head set value [-112.725f,0f,-180f]
execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~