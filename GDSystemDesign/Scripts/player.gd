extends Node2D

signal died
signal lvlup

#stats
var maxHP = 20
var HP = 20
var ATK = 5
var LVL = 1
var XP = 0
var GP = 5
var targetXP = 5

func _ready():
	updateUI()

func attacked(dmg):
	HP -= dmg
	if HP <= 0:
		died.emit()
	updateUI()

func loot(xp, gold):
	XP += xp
	GP += gold
	if XP >= targetXP:
		levelup()
	updateUI()

func levelup():
	print("LEVEL UP")
	LVL += 1
	XP -= targetXP
	targetXP += ceil(targetXP*0.21)
	maxHP += floor(maxHP*0.2)
	HP = maxHP
	ATK += floor(ATK*0.1)
	lvlup.emit()

func updateUI():
	get_node("Health").text = str(HP)
	get_node("Damage").text = str(ATK)
	get_node("Level").text = "LVL "+str(LVL)
	get_node("XP").text = str(XP)+"/"+str(targetXP)
	get_node("Gold").text = str(GP)+" Gold"
