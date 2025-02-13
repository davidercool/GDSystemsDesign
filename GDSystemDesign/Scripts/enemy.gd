extends Node2D

signal dead(xp:int, gold:int)
signal attack(enemyATK:int)

var enemyHP = 8
var enemyDMG = 3
var enemyXP = 7
var enemyGP = 2
var isDead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_player_attack(playerATK):
	print("ATTACK SIGNAL RECEIVED")
	resolveTurn(playerATK)

func resolveTurn(playerATK):
	takeDamage(playerATK)
	attackPlayer(enemyDMG)
	updateUI()

func takeDamage(playerATK):
	enemyHP -= playerATK
	print("enemy hurt")
	if enemyHP <= 0:
		isDead = true
		die()
	

func attackPlayer(dmg):
	attack.emit(dmg)

func updateUI():
	if isDead:
		get_node("Health").text = "HP 0"
	else:
		get_node("Health").text = "HP "+str(enemyHP)
	print("enemy UI updated")

func die():
	dead.emit(enemyXP, enemyGP)
	print("enemy dead")
	
