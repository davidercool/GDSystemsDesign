extends Node2D

signal dead(xp:int, gold:int)
signal attack(enemyATK:int)

var enemyHP = 8
var enemyDMG = 3
var enemyXP = 5
var enemyGP = 3
var isDead = false

func spawn(hp, dmg):
	enemyHP = hp
	enemyDMG = dmg

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
	get_node("Health").text = str(enemyHP)
	print("enemy UI updated")

func die():
	dead.emit(enemyXP, enemyGP)
	print("enemy dead")
	
func respawn():
	enemyHP = 10
