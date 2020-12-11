extends Node2D

export (int) var score = 0 setget set_score
export (int) var happiness = 0 setget set_happiness

func set_score(new_score: int) -> void:
	score = new_score

func set_happiness(new_happiness: int) -> void:
	happiness = clamp(new_happiness, 0, 4)

func add_score(s: int) -> void:
	score += s

func add_happiness(h: int) -> void:
	happiness += h
	if happiness < 0:
		happiness = 0
