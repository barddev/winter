extends Node2D

export (int) var score = 0 setget set_score
export (int) var happiness = 0 setget set_happiness

func set_score(new_score: int):
    score = new_score

func set_happiness(new_happiness: int):
    happiness = clamp(new_happiness, 0, 4)