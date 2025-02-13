extends Node2D

#signals
signal attack(dmg)

#stats
var playerHP = 20
var playerATK = 5
var playerLVL = 1
var playerXP = 0
var playerGP = 5
var targetXP = 5
var enemyGP = 0
var enemyXP = 0

#state machine
var inCombat = true

# Called when the node enters the scene tree for the first time.
func _ready():
	updateUI()

func resolveTurn():
	if inCombat:
		dealDamage()
		updateUI()
	else:
		print("LOOTING")
		loot()
		updateUI()

func dealDamage():
	attack.emit(playerATK)
	print("ATTACK SIGNAL EMITTED")

func takeDamage(enemyATK):
	print("player hurt")
	playerHP -= enemyATK
	
func updateUI():
	get_node("Damage").text = str(playerATK)
	get_node("Health").text = str(playerHP)
	get_node("Gold").text = str(playerGP)+" Gold"
	get_node("XP").text = str(playerXP)+"/"+str(targetXP)
	get_node("Level").text = "LVL "+str(playerLVL)
	print("UI updated")

func loot():
	playerGP += enemyGP
	playerXP += enemyXP
	inCombat = true
	get_node("Button").text = "ATTACK"

func _on_button_pressed():
	resolveTurn()

func _on_enemy_attack(enemyATK):
	takeDamage(enemyATK)

func _on_enemy_dead(XP, GP):
	enemyXP = XP
	enemyGP = GP
	inCombat = false
	get_node("Button").text = "LOOT"
