extends Node2D
@onready var player = $player
@onready var enemy = $enemy
@onready var button = $button

func _on_player_died():
	print("PLAYER IS DEAD")

func _on_button_pressed():
	performAction()

func performAction():
	combat()
	
func combat():
	print("COMBAT")
	get_node("player").attacked(enemy.ATK)
	get_node("enemy").attacked(player.ATK)

func _on_enemy_died():
	print("BAD GUY IS DEAD")
	rewardPlayer()
	spawnEnemy()

func spawnEnemy():
	get_node("enemy").respawn()
	
func rewardPlayer():
	get_node("player").loot(enemy.XP, enemy.GP)
	

func _on_player_lvlup():
	enemy.playerLVLUP()
	player = $player
	enemy = $enemy
