extends Node2D

signal died

var maxHP = 8
var HP = 8
var ATK = 3
var XP = 3
var GP = 2
var scaling = 0.15

func respawn():
	HP = maxHP
	updateUI()

func playerLVLUP():
	maxHP += ceil(maxHP*scaling)
	ATK += ceil(ATK*scaling)
	XP += ceil(XP*scaling)
	GP += ceil(GP*scaling)
	updateUI()

func attacked(dmg):
	HP -= dmg
	if HP <= 0:
		died.emit()
	updateUI()

func updateUI():
	get_node("Health").text = str(HP)
	get_node("ATK").text = str(ATK)
