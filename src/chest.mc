# Exported for Minecraft Java Edition 1.17.x
function load {
	warn ----- Building Animated Java Model: chest -----
	scoreboard objectives add aj.i dummy
	scoreboard objectives add aj.id dummy
	#scoreboard objectives add aj.loop_mode dummy
}
function summon_model {
	#? Summons the model at the current position
	summon armor_stand ~ ~ ~ {Tags:['aj.chest','aj.chest.root_entity','new'],NoGravity:1b,Invisible:1b,Marker:0b,DisabledSlots:4144959,CustomName:'["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]'}
	execute rotated ~ 0 run{
		summon area_effect_cloud ^0 ^-1.918 ^0 {Tags:['aj.chest','aj.chest.Chest','new'],Age:-2147483648,Duration:-1,WaitTime:-2147483648,Passengers:[{id:"minecraft:armor_stand",Tags:['aj.chest','aj.chest.Chest','new'],Invisible:1b,NoGravity:1b,ArmorItems:[{},{},{},{id:"pufferfish",Count:1,tag:{CustomModelData:1}}],Marker:0b,Pose:{Head:[180f,0f,-180f]},DisabledSlots:4144959}]}
		summon area_effect_cloud ^0 ^-1.605 ^-0.25 {Tags:['aj.chest','aj.chest.group','new'],Age:-2147483648,Duration:-1,WaitTime:-2147483648,Passengers:[{id:"minecraft:armor_stand",Tags:['aj.chest','aj.chest.group','new'],Invisible:1b,NoGravity:1b,ArmorItems:[{},{},{},{id:"pufferfish",Count:1,tag:{CustomModelData:2}}],Marker:0b,Pose:{Head:[180f,0f,-180f]},DisabledSlots:4144959}]}
		summon area_effect_cloud ^0.031 ^-1.535 ^0.563 {Tags:['aj.chest','aj.chest.key','new'],Age:-2147483648,Duration:-1,WaitTime:-2147483648,Passengers:[{id:"minecraft:armor_stand",Tags:['aj.chest','aj.chest.key','new'],Invisible:1b,NoGravity:1b,ArmorItems:[{},{},{},{id:"pufferfish",Count:1,tag:{CustomModelData:3}}],Marker:0b,Pose:{Head:[180f,0f,-180f]},DisabledSlots:4144959}]}
	}
	execute as @e[type=armor_stand,tag=aj.chest.root_entity,tag=new] run{
		tp @s ~ ~ ~ ~ 0
		tag @s add aj.state.default
		execute store result score @s aj.id run scoreboard players add #last_model.id aj.i 1
		execute rotated as @s as @e[type=area_effect_cloud,tag=aj.chest.Chest,tag=new,distance=..5.34] positioned as @s run{
			tp @s ~ ~ ~ ~ ~
			scoreboard players operation @s aj.id = #last_model.id aj.i
			tag @s add aj.state.default
			execute as @e[type=armor_stand,tag=aj.chest.Chest,tag=new,distance=..5.34] run{
				scoreboard players operation @s aj.id = #last_model.id aj.i
				tp @s ~ ~ ~ ~ ~
				tag @s add aj.state.default
				tag @s remove new
			}
			execute store result entity @s Air short 1 run time query gametime
			tag @s remove new
		}
		execute rotated as @s as @e[type=area_effect_cloud,tag=aj.chest.group,tag=new,distance=..5.34] positioned as @s run{
			tp @s ~ ~ ~ ~ ~
			scoreboard players operation @s aj.id = #last_model.id aj.i
			tag @s add aj.state.default
			execute as @e[type=armor_stand,tag=aj.chest.group,tag=new,distance=..5.34] run{
				scoreboard players operation @s aj.id = #last_model.id aj.i
				tp @s ~ ~ ~ ~ ~
				tag @s add aj.state.default
				tag @s remove new
			}
			execute store result entity @s Air short 1 run time query gametime
			tag @s remove new
		}
		execute rotated as @s as @e[type=area_effect_cloud,tag=aj.chest.key,tag=new,distance=..5.34] positioned as @s run{
			tp @s ~ ~ ~ ~ ~
			scoreboard players operation @s aj.id = #last_model.id aj.i
			tag @s add aj.state.default
			execute as @e[type=armor_stand,tag=aj.chest.key,tag=new,distance=..5.34] run{
				scoreboard players operation @s aj.id = #last_model.id aj.i
				tp @s ~ ~ ~ ~ ~
				tag @s add aj.state.default
				tag @s remove new
			}
			execute store result entity @s Air short 1 run time query gametime
			tag @s remove new
		}
		tag @s remove new
	}
}
dir remove {
	function this_model {
		#? Removes the model from the world
		#: EXECUTED AS ROOT ENTITY
		!config.dev{
			#? This error message will not export if dev mode is disabled in the MCB config
			execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:remove/this_model","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
		}
		scoreboard players operation #this.aj.id aj.i = @s aj.id
		execute at @s as @e[type=armor_stand,tag=aj.chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run kill @s
		execute at @s as @e[type=area_effect_cloud,tag=aj.chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run kill @s
	}
	function all_models {
		#? Removes all models of the same type from the world
		#: EXECUTED WITH ANY CONTEXT
		kill @e[tag=aj.chest]
	}
}
function hide_model {
	#? Hides the model
	#: EXECUTED AS ROOT ENTITY
	!config.dev{
		#? This error message will not export if dev mode is disabled in the MCB config
		execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:hide_model","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
	}
	scoreboard players operation #this.aj.id aj.i = @s aj.id
	execute at @s as @e[type=armor_stand,tag=aj.chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data remove entity @s ArmorItems[-1]
}
function show_model {
	#? Reveals the model
	#: EXECUTED AS ROOT ENTITY
	!config.dev{
		#? This error message will not export if dev mode is disabled in the MCB config
		execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:show_model","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
	}
	scoreboard players operation #this.aj.id aj.i = @s aj.id
	execute if entity @s[tag=aj.state.default] run function chest:set_state/default
}
dir set_state {
	function default {
		#: EXECUTED AS ROOT ENTITY
		!config.dev{
			#? This error message will not export if dev mode is disabled in the MCB config
			execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/%animation_name/set_state/default","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
		}
		tag @s add aj.state.default
		scoreboard players operation #this.aj.id aj.i = @s aj.id
		execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run {
			data modify entity @s ArmorItems[-1] set value {id:"pufferfish",Count:1b,tag:{CustomModelData:1}}
			tag @s add aj.state.default
		}
		execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run {
			data modify entity @s ArmorItems[-1] set value {id:"pufferfish",Count:1b,tag:{CustomModelData:2}}
			tag @s add aj.state.default
		}
		execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run {
			data modify entity @s ArmorItems[-1] set value {id:"pufferfish",Count:1b,tag:{CustomModelData:3}}
			tag @s add aj.state.default
		}
	}
}
function tick {
	execute as @e[type=armor_stand,tag=aj.chest.root_entity] run {
		execute if entity @s[tag=aj.chest.animations.idle] at @s run function chest:animations/idle/loop
		execute if entity @s[tag=aj.chest.animations.open] at @s run function chest:animations/open/loop
		execute if entity @s[tag=aj.chest.animations.close] at @s run function chest:animations/close/loop
		execute if entity @s[tag=aj.chest.animations.key] at @s run function chest:animations/key/loop
	}
}
dir animations {
	dir idle {
		function start {
			warn -- Building idle ... (1 / 4 animation(s)) --
			warn - Building Utility Functions...
			#? Starts the animation from it's first frame
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/idle/start","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			scoreboard players set @s aj.i 0
			tag @s add aj.chest.animations.idle
		}
		function pause {
			#? Pauses the animation on it's current frame.
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/idle/pause","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			tag @s remove aj.chest.animations.idle
		}
		function resume {
			#? Resumes the animation frome it's current frame.
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/idle/resume","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			tag @s add aj.chest.animations.idle
		}
		function reset {
			#? Resets the animation to it's first frame and stops it's playback
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/idle/reset","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			scoreboard players set @s aj.i 0
			tag @s remove aj.chest.animations.idle
			scoreboard players operation #this.aj.id aj.i = @s aj.id
			execute as @e[type=area_effect_cloud,tag=aj.chest.Chest] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0 ^-1.918 ^0 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.group] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0 ^-1.605 ^-0.25 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.key] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0.031 ^-1.535 ^0.563 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
		}
		function loop {
			warn Constructing Animation Loop for idle ... (This may take a moment)
			scoreboard players operation #this.aj.id aj.i = @s aj.id
			scoreboard players operation #this.aj.anim aj.i = @s aj.i
			execute as @e[type=area_effect_cloud,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
				execute if score #this.aj.anim aj.i matches 0..2 run tp @s ^0 ^-1.918 ^0 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
				execute if score #this.aj.anim aj.i matches 0..2 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
				execute if score #this.aj.anim aj.i matches 0..2 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
				execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
				execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			scoreboard players add @s aj.i 1
			execute if score #this.aj.anim aj.i matches 3.. run tag @s remove aj.chest.animations.idle
		}
	}
	dir open {
		function start {
			warn -- Building open ... (2 / 4 animation(s)) --
			warn - Building Utility Functions...
			#? Starts the animation from it's first frame
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/open/start","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			scoreboard players set @s aj.i 0
			tag @s add aj.chest.animations.open
		}
		function pause {
			#? Pauses the animation on it's current frame.
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/open/pause","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			tag @s remove aj.chest.animations.open
		}
		function resume {
			#? Resumes the animation frome it's current frame.
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/open/resume","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			tag @s add aj.chest.animations.open
		}
		function reset {
			#? Resets the animation to it's first frame and stops it's playback
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/open/reset","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			scoreboard players set @s aj.i 0
			tag @s remove aj.chest.animations.open
			scoreboard players operation #this.aj.id aj.i = @s aj.id
			execute as @e[type=area_effect_cloud,tag=aj.chest.Chest] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0 ^-1.918 ^0 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.group] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0 ^-1.605 ^-0.25 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [-179.65f,0f,180f]
					execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.key] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0.031 ^-1.535 ^0.563 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
		}
		function loop {
			warn Constructing Animation Loop for open ... (This may take a moment)
			scoreboard players operation #this.aj.id aj.i = @s aj.id
			scoreboard players operation #this.aj.anim aj.i = @s aj.i
			execute as @e[type=area_effect_cloud,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0..23 run{
					execute if score #this.aj.anim aj.i matches 0..11 run{
						execute if score #this.aj.anim aj.i matches 0..5 run{
							execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 0..5 run tp @s ^0 ^-1.918 ^0 ~ ~
						}
						execute if score #this.aj.anim aj.i matches 6..11 run{
							execute if score #this.aj.anim aj.i matches 6 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 6..11 run tp @s ^0 ^-1.918 ^0 ~ ~
						}
					}
					execute if score #this.aj.anim aj.i matches 12..23 run{
						execute if score #this.aj.anim aj.i matches 12..17 run{
							execute if score #this.aj.anim aj.i matches 12 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 12..17 run tp @s ^0 ^-1.918 ^0 ~ ~
						}
						execute if score #this.aj.anim aj.i matches 18..23 run{
							execute if score #this.aj.anim aj.i matches 18 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 18..23 run tp @s ^0 ^-1.918 ^0 ~ ~
						}
					}
				}
				execute if score #this.aj.anim aj.i matches 24..47 run{
					execute if score #this.aj.anim aj.i matches 24..35 run{
						execute if score #this.aj.anim aj.i matches 24..29 run{
							execute if score #this.aj.anim aj.i matches 24 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 24..29 run tp @s ^0 ^-1.918 ^0 ~ ~
						}
						execute if score #this.aj.anim aj.i matches 30..35 run{
							execute if score #this.aj.anim aj.i matches 30 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 30..35 run tp @s ^0 ^-1.918 ^0 ~ ~
						}
					}
					execute if score #this.aj.anim aj.i matches 36..47 run{
						execute if score #this.aj.anim aj.i matches 36..41 run{
							execute if score #this.aj.anim aj.i matches 36 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 36..41 run tp @s ^0 ^-1.918 ^0 ~ ~
						}
						execute if score #this.aj.anim aj.i matches 42..47 run{
							execute if score #this.aj.anim aj.i matches 42 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 42..47 run tp @s ^0 ^-1.918 ^0 ~ ~
						}
					}
				}
				execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0..23 run{
					execute if score #this.aj.anim aj.i matches 0..11 run{
						execute if score #this.aj.anim aj.i matches 0..5 run{
							execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-179.65f,0f,180f]
							execute if score #this.aj.anim aj.i matches 1 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-162.15f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 2 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-144.65f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 3 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-127.15f,0f,180f]
							execute if score #this.aj.anim aj.i matches 4 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-110.125f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 5 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-116.5f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 0..5 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
						}
						execute if score #this.aj.anim aj.i matches 6..11 run{
							execute if score #this.aj.anim aj.i matches 6 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-122.625f,0f,180f]
							execute if score #this.aj.anim aj.i matches 7 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-129f,0f,180f]
							execute if score #this.aj.anim aj.i matches 8 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-134.747f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 9 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-129.807f,0f,180f]
							execute if score #this.aj.anim aj.i matches 10 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-123.473f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 11 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-117.013f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 6..11 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
						}
					}
					execute if score #this.aj.anim aj.i matches 12..23 run{
						execute if score #this.aj.anim aj.i matches 12..17 run{
							execute if score #this.aj.anim aj.i matches 12 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-120.08f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 13 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-124.08f,0f,180f]
							execute if score #this.aj.anim aj.i matches 14 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-128.08f,0f,180f]
							execute if score #this.aj.anim aj.i matches 15 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-132.08f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 16 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-136.16f,0f,180f]
							execute if score #this.aj.anim aj.i matches 17 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-139.967f,0f,180f]
							execute if score #this.aj.anim aj.i matches 12..17 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
						}
						execute if score #this.aj.anim aj.i matches 18..23 run{
							execute if score #this.aj.anim aj.i matches 18 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-138.267f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 19 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-136.6f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-135f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 18..23 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
						}
					}
				}
				execute if score #this.aj.anim aj.i matches 24..47 run{
					execute if score #this.aj.anim aj.i matches 24..35 run{
						execute if score #this.aj.anim aj.i matches 24..29 run{
							execute if score #this.aj.anim aj.i matches 24 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-135f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 24..29 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
						}
						execute if score #this.aj.anim aj.i matches 30..35 run{
							execute if score #this.aj.anim aj.i matches 30 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-135f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 30..35 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
						}
					}
					execute if score #this.aj.anim aj.i matches 36..47 run{
						execute if score #this.aj.anim aj.i matches 36..41 run{
							execute if score #this.aj.anim aj.i matches 36 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-135f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 36..41 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
						}
						execute if score #this.aj.anim aj.i matches 42..47 run{
							execute if score #this.aj.anim aj.i matches 42 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-135f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 42..47 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
						}
					}
				}
				execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0..23 run{
					execute if score #this.aj.anim aj.i matches 0..11 run{
						execute if score #this.aj.anim aj.i matches 0..5 run{
							execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 0..5 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
							execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
						}
						execute if score #this.aj.anim aj.i matches 6..11 run{
							execute if score #this.aj.anim aj.i matches 6 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 6..11 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
							execute if score #this.aj.anim aj.i matches 6 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
						}
					}
					execute if score #this.aj.anim aj.i matches 12..23 run{
						execute if score #this.aj.anim aj.i matches 12..17 run{
							execute if score #this.aj.anim aj.i matches 12 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 12..17 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
							execute if score #this.aj.anim aj.i matches 12 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
						}
						execute if score #this.aj.anim aj.i matches 18..23 run{
							execute if score #this.aj.anim aj.i matches 18 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 18..23 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
							execute if score #this.aj.anim aj.i matches 18 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
						}
					}
				}
				execute if score #this.aj.anim aj.i matches 24..47 run{
					execute if score #this.aj.anim aj.i matches 24..35 run{
						execute if score #this.aj.anim aj.i matches 24..29 run{
							execute if score #this.aj.anim aj.i matches 24 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 24..29 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
							execute if score #this.aj.anim aj.i matches 24 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
						}
						execute if score #this.aj.anim aj.i matches 30..35 run{
							execute if score #this.aj.anim aj.i matches 30 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 30..35 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
							execute if score #this.aj.anim aj.i matches 30 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
						}
					}
					execute if score #this.aj.anim aj.i matches 36..47 run{
						execute if score #this.aj.anim aj.i matches 36..41 run{
							execute if score #this.aj.anim aj.i matches 36 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 36..41 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
							execute if score #this.aj.anim aj.i matches 36 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
						}
						execute if score #this.aj.anim aj.i matches 42..47 run{
							execute if score #this.aj.anim aj.i matches 42 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
							execute if score #this.aj.anim aj.i matches 42..47 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
							execute if score #this.aj.anim aj.i matches 42 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
						}
					}
				}
				execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			scoreboard players add @s aj.i 1
			execute if score #this.aj.anim aj.i matches 48.. run tag @s remove aj.chest.animations.open
		}
	}
	dir close {
		function start {
			warn -- Building close ... (3 / 4 animation(s)) --
			warn - Building Utility Functions...
			#? Starts the animation from it's first frame
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/close/start","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			scoreboard players set @s aj.i 0
			tag @s add aj.chest.animations.close
		}
		function pause {
			#? Pauses the animation on it's current frame.
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/close/pause","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			tag @s remove aj.chest.animations.close
		}
		function resume {
			#? Resumes the animation frome it's current frame.
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/close/resume","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			tag @s add aj.chest.animations.close
		}
		function reset {
			#? Resets the animation to it's first frame and stops it's playback
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/close/reset","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			scoreboard players set @s aj.i 0
			tag @s remove aj.chest.animations.close
			scoreboard players operation #this.aj.id aj.i = @s aj.id
			execute as @e[type=area_effect_cloud,tag=aj.chest.Chest] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0 ^-1.918 ^0 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.group] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0 ^-1.605 ^-0.25 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [-112.725f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.key] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0.031 ^-1.535 ^0.563 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
		}
		function loop {
			warn Constructing Animation Loop for close ... (This may take a moment)
			scoreboard players operation #this.aj.id aj.i = @s aj.id
			scoreboard players operation #this.aj.anim aj.i = @s aj.i
			execute as @e[type=area_effect_cloud,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0..16 run{
					execute if score #this.aj.anim aj.i matches 0..8 run{
						execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 0..8 run tp @s ^0 ^-1.918 ^0 ~ ~
					}
					execute if score #this.aj.anim aj.i matches 9..16 run{
						execute if score #this.aj.anim aj.i matches 9 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 12 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 13 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 14 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 15 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.8f,-180f]
						execute if score #this.aj.anim aj.i matches 16 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.2f,-180f]
						execute if score #this.aj.anim aj.i matches 9..11 run tp @s ^0 ^-1.918 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 12 run tp @s ^0 ^-1.919 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 13 run tp @s ^0 ^-1.956 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 14 run tp @s ^0 ^-1.994 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 15 run tp @s ^0 ^-2.032 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 16 run tp @s ^0 ^-2.069 ^0 ~ ~
					}
				}
				execute if score #this.aj.anim aj.i matches 17..33 run{
					execute if score #this.aj.anim aj.i matches 17..25 run{
						execute if score #this.aj.anim aj.i matches 17 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 18 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.2f,-180f]
						execute if score #this.aj.anim aj.i matches 19 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 21 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.8f,-180f]
						execute if score #this.aj.anim aj.i matches 22 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 23 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 24 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 25 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 17 run tp @s ^0 ^-2.106 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 18 run tp @s ^0 ^-2.144 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 19 run tp @s ^0 ^-2.181 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 20 run tp @s ^0 ^-2.219 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 21 run tp @s ^0 ^-2.257 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 22 run tp @s ^0 ^-2.294 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 23 run tp @s ^0 ^-2.331 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 24 run tp @s ^0 ^-2.369 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 25 run tp @s ^0 ^-2.406 ^0 ~ ~
					}
					execute if score #this.aj.anim aj.i matches 26..33 run{
						execute if score #this.aj.anim aj.i matches 26 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.2f,-180f]
						execute if score #this.aj.anim aj.i matches 27 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 28 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 29 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 30 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 31 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.8f,-180f]
						execute if score #this.aj.anim aj.i matches 32 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 26 run tp @s ^0 ^-2.444 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 27 run tp @s ^0 ^-2.481 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 28 run tp @s ^0 ^-2.519 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 29 run tp @s ^0 ^-2.556 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 30 run tp @s ^0 ^-2.594 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 31 run tp @s ^0 ^-2.632 ^0 ~ ~
						execute if score #this.aj.anim aj.i matches 32..33 run tp @s ^0 ^-2.668 ^0 ~ ~
					}
				}
				execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0..16 run{
					execute if score #this.aj.anim aj.i matches 0..8 run{
						execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-112.725f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 1 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-124.2f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 2 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-135.45f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 3 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-146.475f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 4 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-157.95f,0f,180f]
						execute if score #this.aj.anim aj.i matches 5 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-169.2f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 6 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-179.9f,0f,180f]
						execute if score #this.aj.anim aj.i matches 7 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-174.9f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 8 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [-169.9f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 0..8 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
					}
					execute if score #this.aj.anim aj.i matches 9..16 run{
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
					}
				}
				execute if score #this.aj.anim aj.i matches 17..33 run{
					execute if score #this.aj.anim aj.i matches 17..25 run{
						execute if score #this.aj.anim aj.i matches 17 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 18 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.2f,-180f]
						execute if score #this.aj.anim aj.i matches 19 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 21 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.8f,-180f]
						execute if score #this.aj.anim aj.i matches 22 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 23 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 24 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 25 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 17 run tp @s ^0.021 ^-1.794 ^-0.249 ~ ~
						execute if score #this.aj.anim aj.i matches 18 run tp @s ^-0.001 ^-1.832 ^-0.25 ~ ~
						execute if score #this.aj.anim aj.i matches 19 run tp @s ^-0.021 ^-1.869 ^-0.249 ~ ~
						execute if score #this.aj.anim aj.i matches 20 run tp @s ^0 ^-1.906 ^-0.25 ~ ~
						execute if score #this.aj.anim aj.i matches 21 run tp @s ^0.021 ^-1.945 ^-0.249 ~ ~
						execute if score #this.aj.anim aj.i matches 22 run tp @s ^0 ^-1.981 ^-0.25 ~ ~
						execute if score #this.aj.anim aj.i matches 23 run tp @s ^-0.021 ^-2.019 ^-0.249 ~ ~
						execute if score #this.aj.anim aj.i matches 24 run tp @s ^0 ^-2.056 ^-0.25 ~ ~
						execute if score #this.aj.anim aj.i matches 25 run tp @s ^0.021 ^-2.094 ^-0.249 ~ ~
					}
					execute if score #this.aj.anim aj.i matches 26..33 run{
						execute if score #this.aj.anim aj.i matches 26 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.2f,-180f]
						execute if score #this.aj.anim aj.i matches 27 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 28 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 29 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,-4.9f,-180f]
						execute if score #this.aj.anim aj.i matches 30 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0.1f,-180f]
						execute if score #this.aj.anim aj.i matches 31 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,4.8f,-180f]
						execute if score #this.aj.anim aj.i matches 32 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 26 run tp @s ^-0.001 ^-2.132 ^-0.25 ~ ~
						execute if score #this.aj.anim aj.i matches 27 run tp @s ^-0.021 ^-2.169 ^-0.249 ~ ~
						execute if score #this.aj.anim aj.i matches 28 run tp @s ^0 ^-2.206 ^-0.25 ~ ~
						execute if score #this.aj.anim aj.i matches 29 run tp @s ^0.021 ^-2.244 ^-0.249 ~ ~
						execute if score #this.aj.anim aj.i matches 30 run tp @s ^0 ^-2.281 ^-0.25 ~ ~
						execute if score #this.aj.anim aj.i matches 31 run tp @s ^-0.021 ^-2.319 ^-0.249 ~ ~
						execute if score #this.aj.anim aj.i matches 32..33 run tp @s ^0 ^-2.355 ^-0.25 ~ ~
					}
				}
				execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0..16 run{
					execute if score #this.aj.anim aj.i matches 0..8 run{
						execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 0..8 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
						execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
					}
					execute if score #this.aj.anim aj.i matches 9..16 run{
						execute if score #this.aj.anim aj.i matches 9 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 9..16 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
						execute if score #this.aj.anim aj.i matches 9 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
					}
				}
				execute if score #this.aj.anim aj.i matches 17..33 run{
					execute if score #this.aj.anim aj.i matches 17..25 run{
						execute if score #this.aj.anim aj.i matches 17 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 17..25 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
						execute if score #this.aj.anim aj.i matches 17 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
					}
					execute if score #this.aj.anim aj.i matches 26..33 run{
						execute if score #this.aj.anim aj.i matches 26 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 26..33 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
						execute if score #this.aj.anim aj.i matches 26 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
					}
				}
				execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			scoreboard players add @s aj.i 1
			execute if score #this.aj.anim aj.i matches 34.. run tag @s remove aj.chest.animations.close
		}
	}
	dir key {
		function start {
			warn -- Building key ... (4 / 4 animation(s)) --
			warn - Building Utility Functions...
			#? Starts the animation from it's first frame
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/key/start","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			scoreboard players set @s aj.i 0
			tag @s add aj.chest.animations.key
		}
		function pause {
			#? Pauses the animation on it's current frame.
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/key/pause","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			tag @s remove aj.chest.animations.key
		}
		function resume {
			#? Resumes the animation frome it's current frame.
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/key/resume","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			tag @s add aj.chest.animations.key
		}
		function reset {
			#? Resets the animation to it's first frame and stops it's playback
			#: EXECUTED AS ROOT ENTITY
			!config.dev{
				#? This error message will not export if dev mode is disabled in the MCB config
				execute unless entity @s[tag=aj.chest.root_entity] run tellraw @a ["",[{"text":"[","color":"dark_gray"},{"text":"MCB-MODEL","color":"green"},{"text":" -> ","color":"light_purple"},{"text":"ROOT_EXECUTION_ERROR","color":"red"},{"text":"]","color":"dark_gray"}],"\n",{"text":"chest:animations/key/reset","color":"gold"}," ",{"text":"executed as non root entity.","color":"gray"},"\n",{"text":"Should be executed as ","color":"gray"},["",{"text":"model.","color":"gray"},{"text":"chest","color":"blue"},{"text":".root_entity","color":"gray"}]]
			}
			scoreboard players set @s aj.i 0
			tag @s remove aj.chest.animations.key
			scoreboard players operation #this.aj.id aj.i = @s aj.id
			execute as @e[type=area_effect_cloud,tag=aj.chest.Chest] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0 ^-1.918 ^0 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.group] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0 ^-1.605 ^-0.25 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.key] if score @s aj.id = #this.aj.id aj.i run {
				tp @s ^0.031 ^-1.535 ^0.563 ~ ~
				execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
					data modify entity @s Pose.Head set value [180f,0f,-180f]
					execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				}
				execute store result entity @s Air short 1 run time query gametime
			}
		}
		function loop {
			warn Constructing Animation Loop for key ... (This may take a moment)
			scoreboard players operation #this.aj.id aj.i = @s aj.id
			scoreboard players operation #this.aj.anim aj.i = @s aj.i
			execute as @e[type=area_effect_cloud,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0..12 run{
					execute if score #this.aj.anim aj.i matches 0..6 run{
						execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 0..6 run tp @s ^0 ^-1.918 ^0 ~ ~
					}
					execute if score #this.aj.anim aj.i matches 7..12 run{
						execute if score #this.aj.anim aj.i matches 7 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 7..12 run tp @s ^0 ^-1.918 ^0 ~ ~
					}
				}
				execute if score #this.aj.anim aj.i matches 13..25 run{
					execute if score #this.aj.anim aj.i matches 13..19 run{
						execute if score #this.aj.anim aj.i matches 13 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 13..19 run tp @s ^0 ^-1.918 ^0 ~ ~
					}
					execute if score #this.aj.anim aj.i matches 20..25 run{
						execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 20..25 run tp @s ^0 ^-1.918 ^0 ~ ~
					}
				}
				execute as @e[type=armor_stand,tag=aj.chest.Chest,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0..12 run{
					execute if score #this.aj.anim aj.i matches 0..6 run{
						execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 0..6 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
					}
					execute if score #this.aj.anim aj.i matches 7..12 run{
						execute if score #this.aj.anim aj.i matches 7 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 7..12 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
					}
				}
				execute if score #this.aj.anim aj.i matches 13..25 run{
					execute if score #this.aj.anim aj.i matches 13..19 run{
						execute if score #this.aj.anim aj.i matches 13 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 13..19 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
					}
					execute if score #this.aj.anim aj.i matches 20..25 run{
						execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 20..25 run tp @s ^0 ^-1.605 ^-0.25 ~ ~
					}
				}
				execute as @e[type=armor_stand,tag=aj.chest.group,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			execute as @e[type=area_effect_cloud,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run{
				execute if score #this.aj.anim aj.i matches 0..12 run{
					execute if score #this.aj.anim aj.i matches 0..6 run{
						execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 0..3 run tp @s ^0.031 ^-1.535 ^0.563 ~ ~
						execute if score #this.aj.anim aj.i matches 4 run tp @s ^0.031 ^-1.535 ^0.562 ~ ~
						execute if score #this.aj.anim aj.i matches 5 run tp @s ^0.031 ^-1.535 ^0.526 ~ ~
						execute if score #this.aj.anim aj.i matches 6 run tp @s ^0.031 ^-1.535 ^0.492 ~ ~
						execute if score #this.aj.anim aj.i matches 0 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:5}
						execute if score #this.aj.anim aj.i matches 1 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:6}
					}
					execute if score #this.aj.anim aj.i matches 7..12 run{
						execute if score #this.aj.anim aj.i matches 7 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-180f]
						execute if score #this.aj.anim aj.i matches 7 run tp @s ^0.031 ^-1.535 ^0.457 ~ ~
						execute if score #this.aj.anim aj.i matches 8 run tp @s ^0.031 ^-1.535 ^0.423 ~ ~
						execute if score #this.aj.anim aj.i matches 9 run tp @s ^0.031 ^-1.535 ^0.395 ~ ~
						execute if score #this.aj.anim aj.i matches 10 run tp @s ^0.031 ^-1.535 ^0.36 ~ ~
						execute if score #this.aj.anim aj.i matches 11 run tp @s ^0.031 ^-1.535 ^0.325 ~ ~
						execute if score #this.aj.anim aj.i matches 12 run tp @s ^0.031 ^-1.535 ^0.284 ~ ~
						execute if score #this.aj.anim aj.i matches 7 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:6}
					}
				}
				execute if score #this.aj.anim aj.i matches 13..25 run{
					execute if score #this.aj.anim aj.i matches 13..19 run{
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
					}
					execute if score #this.aj.anim aj.i matches 20..25 run{
						execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run data modify entity @s Pose.Head set value [180f,0f,-90f]
						execute if score #this.aj.anim aj.i matches 20..25 run tp @s ^0.006 ^-1.523 ^0.25 ~ ~
						execute if score #this.aj.anim aj.i matches 20 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:7}
						execute if score #this.aj.anim aj.i matches 21 as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s[tag=aj.state.default] aj.id = #this.aj.id aj.i run item replace entity @s armor.head with pufferfish{CustomModelData:4}
					}
				}
				execute as @e[type=armor_stand,tag=aj.chest.key,distance=..5.34] if score @s aj.id = #this.aj.id aj.i run tp @s ~ ~ ~ ~ ~
				execute store result entity @s Air short 1 run time query gametime
			}
			scoreboard players add @s aj.i 1
			execute if score @s aj.i matches 26.. run scoreboard players set @s aj.i 0
		}
	}
}
