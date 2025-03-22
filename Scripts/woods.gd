extends Node2D

@onready var unknownCharacter = preload("res://Scenes/others/UnknownCharacter.tscn")
@onready var Statue = preload("res://Scenes/others/statue.tscn")
@onready var blueOrb = preload("res://Scenes/others/BlueOrb.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Player").global_position = Globals.playerPos

	if Globals.progress in [0,1]:
		spwan_entity(unknownCharacter,Vector2(1200,400))
	
	if Globals.progress in [2,3]:
		spwan_entity(Statue,Vector2(1189,363))

	if Globals.progress == 3 and not Globals.has_blueOrb:
		spwan_entity(blueOrb,Vector2(1389,163))

	
func spwan_entity(entity,pos):
	var e = entity.instantiate()
	e.global_position = pos
	add_child(e)
