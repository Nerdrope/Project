#built using mc-build (https://github.com/mc-build/mc-build)

summon armor_stand ~ ~ ~ {Tags:['aj.chest','aj.chest.root_entity','new'],NoGravity:1b,Invisible:1b,Marker:0b,DisabledSlots:4144959,CustomName:'["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]'}
execute rotated ~ 0 run function chest:__generated__/execute/0
execute as @e[type=armor_stand,tag=aj.chest.root_entity,tag=new] run function chest:__generated__/execute/1