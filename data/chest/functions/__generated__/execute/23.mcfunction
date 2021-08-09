#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.chest.animations.idle] at @s run function chest:animations/idle/loop
execute if entity @s[tag=aj.chest.animations.open] at @s run function chest:animations/open/loop
execute if entity @s[tag=aj.chest.animations.close] at @s run function chest:animations/close/loop
execute if entity @s[tag=aj.chest.animations.key] at @s run function chest:animations/key/loop