extends Node2D

@onready var unknownCharacter = preload("res://Scenes/others/UnknownCharacter.tscn")
@onready var Statue = preload("res://Scenes/others/statue.tscn")
@onready var blueOrb = preload("res://Scenes/others/BlueOrb.tscn")
@onready var story_paper = preload("res://Scenes/others/story_papers.tscn")
var story = ""

var stoies = {1:"You may find a person who may ask you different question,\nregardless of your opinion, say what that person wants to hear",
			  2:"Statue of Incantatio hates when faced with questions",
			  3:"orb to key,\nkey to cabin,\ncabin t........;'./.[.[.;.[;.;..//.,]]]",}
			
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	get_node("Player").global_position = Globals.playerPos

	if Globals.progress in [0,1]:
		spwan_entity(unknownCharacter,Vector2(1200,400))
	
	if Globals.progress in [2,3]:
		spwan_entity(Statue,Vector2(970,217))

	if Globals.progress == 3 and not Globals.has_blueOrb:
		spwan_entity(blueOrb,Vector2(389,452))

	if Globals.progress in [1,2,3]:
		story = stoies[Globals.progress]
	
	if Globals.progress in [1,2,3]:
		spwan_entity(story_paper,Vector2(randi_range(236,380),randi_range(174,340)))
	
	$Popup/RichTextLabel.text = story
	
func spwan_entity(entity,pos):
	var e = entity.instantiate()
	e.global_position = pos
	add_child(e)
